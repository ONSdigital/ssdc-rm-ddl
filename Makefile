# Set the container runtime based on architecture, default to docker for amd64 and podman for arm64
DOCKER ?= $(shell if [ "$$(uname -m)" = "arm64" ]; then echo podman; else echo docker; fi)

install:
	pipenv install --dev

lint:
	pipenv run flake8

test: lint
	pipenv run pytest ./test --cov --cov-report term-missing --cov-report xml

build-ddl-docker:
	$(DOCKER) build . --platform linux/amd64 -t europe-west2-docker.pkg.dev/ssdc-rm-ci/docker/ssdc-rm-ddl:latest

check-ddl:
	mvn pmd:check

format-check-common:
	$(MAKE) -C ssdc-rm-common-entity-model format-check

build-common:
	$(MAKE) -C ssdc-rm-common-entity-model build

dev-install-common:
	$(MAKE) -C ssdc-rm-common-entity-model dev-install

dev-update-ddl:
	./build_groundzero_ddl.sh

dev-build: dev-install-common dev-update-ddl build-ddl-docker

shellcheck:
	shellcheck -x --shell=bash **/*.sh *.sh

pull-latest-dev-postgres:
	$(DOCKER) pull europe-west2-docker.pkg.dev/ssdc-rm-ci/docker/ssdc-rm-dev-common-postgres:latest

dev-postgres-up:
	$(DOCKER) compose -f docker-compose-dev-postgres.yml up -d

dev-postgres-down:
	$(DOCKER) compose -f docker-compose-dev-postgres.yml down

run-test-patches:
	DB_PORT=16432 pipenv run python patch_database.py

run-test-rollback:
	DB_PORT=16432 pipenv run pytest -s test_rollback_scripts.py

wait-for-docker-postgres:
	./wait_for_docker_postgres.sh

test-patches: pull-latest-dev-postgres dev-postgres-down dev-postgres-up wait-for-docker-postgres run-test-patches run-test-rollback dev-postgres-down

build-dev-postgres-image:
	$(DOCKER) build ./dev-common-postgres-image --platform linux/amd64 -t europe-west2-docker.pkg.dev/ssdc-rm-ci/docker/ssdc-rm-dev-common-postgres:latest

test-dev-postgres: build-dev-postgres-image dev-postgres-up wait-for-docker-postgres dev-postgres-down

megalint:  ## Run the mega-linter.
	$(DOCKER) run --platform linux/amd64 --rm \
		-v /var/run/docker.sock:/var/run/docker.sock:rw \
		-v $(shell pwd):/tmp/lint:rw \
		oxsecurity/megalinter:v8

megalint-fix:  ## Run the mega-linter and attempt to auto fix any issues.
	$(DOCKER) run --platform linux/amd64 --rm \
		-v /var/run/docker.sock:/var/run/docker.sock:rw \
		-v $(shell pwd):/tmp/lint:rw \
		-e APPLY_FIXES=all \
		oxsecurity/megalinter:v8

clean_megalint: ## Clean the temporary files.
	rm -rf megalinter-reports

lint_check: clean_megalint megalint