@echo off

set target=%1

set HOME=%USERPROFILE%

if /i %target%==runserver (
  docker-machine start
  docker-machine ssh default echo
  docker-machine inspect | docker-compose run --rm app python bin/print-site-url.py
  docker-compose up
  exit /b
)

if /i %target%==cli (
  docker-machine start
  docker-machine ssh default echo
  docker-compose run --rm app bin/cli-command.sh
  exit /b
)
