#!/bin/sh

set -x

TUTORIAL_HOME=${HOME}/src/djangogirls
USER=$(whoami)
UID=$(id -u ${USER})
GID=$(id -g ${USER})

echo "What's your GitHub username?"
read -r github_username

echo "What's your GitHub email?"
read -r github_email

mkdir -p "${TUTORIAL_HOME}"
cd "${TUTORIAL_HOME}" || return

docker run --rm -v "${PWD}":/root/src/djangogirls \
  gsong/djangogirls-app \
  /bin/bash -c "git clone https://github.com/${github_username}/my-first-blog.git . ; chown -R '${UID}:${GID}' /root/src/djangogirls"

cat << EOF > .env
GITHUB_USERNAME=${github_username}
GITHUB_EMAIL=${github_email}
USER=${USER}
UID=${UID}
GID=${GID}
EOF
