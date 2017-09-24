TUTORIAL_HOME=${HOME}/src/djangogirls

echo "What's your GitHub username?"
read -r github_username

mkdir -p "${TUTORIAL_HOME}"
cd "${TUTORIAL_HOME}" || return

docker run --rm -v "${PWD}":/root/src/djangogirls \
  gsong/djangogirls-app \
  git clone https://github.com/"${github_username}"/my-first-blog.git .
