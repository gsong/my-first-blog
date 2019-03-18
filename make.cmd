@echo off

set target=%1

if /i %target%==runserver (
  docker-compose up
  exit /b
)

if /i %target%==cli (
  docker-compose run --rm app bin/cli-command.sh
  exit /b
)
