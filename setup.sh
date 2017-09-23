TUTORIAL_HOME=${HOME}/src/djangogirls

echo "What's your GitHub username?"
read -r github_username

mkdir -p "${TUTORIAL_HOME}"
cd "${TUTORIAL_HOME}" || exit

docker run --rm -v "${PWD}":/app \
  gsong/djangogirls-starter \
  git clone https://github.com/"${github_username}"/my-first-blog.git .
