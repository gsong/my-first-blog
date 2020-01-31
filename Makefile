.DEFAULT_GOAL := help

include Makefiles/*.mk

# Generates a help message. Borrowed from https://github.com/pydanny/cookiecutter-djangopackage.
help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of the following:"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

# This target just checks if you're executing make inside the container. If
# you are inside the container, it fails with a hopefully helpful error
# message. Otherwise, it silently succeeds and executes the intended target.
assert-not-container:
	@test -f /etc/issue && grep -q 'Alpine Linux' /etc/issue && echo "Whoops! That won't work inside the container. Type 'exit' (without the quotes), then press enter, then try that command again." && echo && echo && exit 1 || true

# Tasks to be run in developer shell
## General Docker operations
runserver: assert-not-container ## Start Django development server
	docker-compose up

cli: assert-not-container ## Start development command line interface
	docker-compose run --rm app bin/cli-command.sh

build: # Build image
	docker pull python:3.6-alpine
	docker build -t gsong/djangogirls-app .

pull: # Pull latest image from Docker Hub
	docker-compose pull

## Python requirements
compile-requirements: # Compile Python requirements without upgrading
	docker-compose run --rm --no-deps app make pip-compile

upgrade-requirements: # Compile and upgrade Python requirements
	docker-compose run --rm --no-deps app make pip-compile-upgrade
