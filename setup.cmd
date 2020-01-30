@echo off
set TUTORIAL_HOME=%USERPROFILE%\src\djangogirls

set /p github_username="What's your GitHub username? "
set /p github_email="What's your GitHub email? "

md %TUTORIAL_HOME%
cd %TUTORIAL_HOME% || exit /b

:: Start docker if it's not already running
docker-machine start

:: Create symlink inside the docker machine so capital drive letters will work in mount paths
docker-machine ssh default sudo ln -sf /c /C

:: Store current working directory in env var
set current_dir=%cd%

:: Convert backslashes to forward-slashes
set current_dir=%current_dir:\=/%

:: Remove ":"
set current_dir=/%current_dir::=%

docker run --rm -v %current_dir%:/root/src/djangogirls gsong/djangogirls-app git clone https://github.com/%github_username%/my-first-blog.git .

(
  echo GITHUB_USERNAME=%github_username%
  echo GITHUB_EMAIL=%github_email%
  echo USER=root
) > .env
