.DEFAULT_GOAL := help

include Makefiles/*.mk

# Generates a help message. Borrowed from https://github.com/pydanny/cookiecutter-djangopackage.
help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of the following:"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

# Tasks to be run in developer shell
## Python requirements
compile-requirements: # Compile Python requirements without upgrading
	docker-compose run --rm --no-deps app make pip-compile

upgrade-requirements: # Compile and upgrade Python requirements
	docker-compose run --rm --no-deps app make pip-compile-upgrade

## General Docker operations
up: # Start environment
	docker-compose up -d

down: ## Destroy environment
	docker-compose down

restart: down up ps ## Restart environment

shell: ## Start app server shell
	docker-compose run --rm app /bin/bash

ps: ## View environment containers
	docker-compose ps

build: # Build image
	docker build -t gsong/djangogirls-starter .

pull: # Pull latest image from Docker Hub
	docker-compose pull

setup: pull up ps # Set up development environment
