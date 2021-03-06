.PHONY: build
.DEFAULT_GOAL := help

VERSION := 0.0.1
COMMIT_HASH := $(shell git rev-parse HEAD)
MAIN_BRANCH := master


rm_venv: ## use clean-venv instead
	rm -rf .venv

clean-venv: rm_venv  ## delete and recreate venv
	python3 -m venv .venv
	( \
			. .venv/bin/activate; \
			pip install --upgrade pip setuptools; \
			pip install -r requirements.txt; \
	)

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: ## build the docker image locally with latest/hash tag
	@echo Run static code checks
	docker build --tag docker-stub:$(COMMIT_HASH) .

get_commit: ## echo the commit hash
	@echo $(COMMIT_HASH)

get_version: ## echo the version
	@echo $(VERSION)