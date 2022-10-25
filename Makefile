install:
	pipenv install --dev

check:
	pipenv check

lint:
	pipenv run flake8

test: check lint
	pipenv run pytest ./test

format-check-common:
	cd ssdc-rm-common-entity-model && mvn fmt:check pmd:check

check-ddl:
	mvn pmd:check

build-common:
	cd ssdc-rm-common-entity-model && mvn compile

build-ddl-docker:
	docker build . -t europe-west2-docker.pkg.dev/ssdc-rm-ci/docker/ssdc-rm-ddl:latest

dev-install-common:
	cd ssdc-rm-common-entity-model && mvn clean install

dev-update-ddl:
	./build_groundzero_ddl.sh

dev-build: dev-install-common dev-update-ddl build-ddl-docker

shellcheck:
	shellcheck -x --shell=bash **/*.sh *.sh

pull-latest-dev-postgres:
	docker pull europe-west2-docker.pkg.dev/ssdc-rm-ci/docker/ssdc-rm-dev-common-postgres:latest

dev-postgres-up:
	docker-compose -f docker-compose-dev-postgres.yml up -d

dev-postgres-down:
	docker-compose -f docker-compose-dev-postgres.yml down

run-test-patches:
	DB_PORT=16432 pipenv run python patch_database.py
	DB_PORT=16432 pipenv run pytest -s test_rollback_scripts.py

wait-for-docker-postgres:
	./wait_for_docker_postgres.sh

test-patches: pull-latest-dev-postgres dev-postgres-down dev-postgres-up wait-for-docker-postgres run-test-patches dev-postgres-down
