install:
	pipenv install --dev

check:
	pipenv check

lint:
	pipenv run flake8

test: check lint
	pipenv run pytest

format-check-common:
	cd ssdc-rm-common-entity-model && mvn fmt:check pmd:check

check-ddl:
	mvn pmd:check

build-common:
	cd ssdc-rm-common-entity-model && mvn compile

dev-install-common:
	cd ssdc-rm-common-entity-model && mvn clean install

dev-update-ddl:
	./build_groundzero_ddl.sh

dev-build: dev-install-common dev-update-ddl

shellcheck:
	shellcheck -x --shell=bash **/*.sh *.sh

dev-postgres-up:
	docker-compose -f docker-compose-dev-postgres.yml up -d

dev-postgres-down:
	docker-compose -f docker-compose-dev-postgres.yml down

run-test-patches:
	DB_PORT=16432 pipenv run python patch_database.py

wait-for-docker-postgres:
	./wait_for_docker_postgres.sh

test-patches: dev-postgres-up wait-for-docker-postgres run-test-patches dev-postgres-down
