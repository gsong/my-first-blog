#!/bin/bash -x

# remove any old docker dependencies
echo "Removing any old docker-related packages..."
sudo apt-get remove docker docker-engine docker.io containerd runc docker-compose containerd.io docker-ce docker-ce-cli

# add Docker repository
echo "Adding Docker repository..."
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# should verify the output of this against fingerprint: 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
# sudo apt-key fingerprint 0EBFCD88

CODENAME=$(lsb_release -cs)

# use disco instead of eoan, because docker repos for eoan are not ready yet
if [ "$CODENAME" == "eoan" ]; then
  CODENAME="disco"
fi

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $CODENAME \
   stable"
sudo apt-get update

# install the tools
echo "Installing Docker..."
sudo apt-get install docker-ce docker-ce-cli containerd.io

# install docker-compose (https://docs.docker.com/compose/install/)
echo "Installing docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# make it possible to run docker without sudo
echo "Adding Docker group..."
sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker

# test that it runs correctly
echo "Setup done! To test, try running `docker run hello-world` and `docker-compose version`. If they both print output without errors, you're good to go!"
