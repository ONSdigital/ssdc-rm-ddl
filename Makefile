install:
	pipenv install --dev

check:
	pipenv check

lint:
	pipenv run flake8

test: check lint
	pipenv run pytest ./test --cov --cov-report term-missing --cov-report xml

build-ddl-docker:
	docker build . -t europe-west2-docker.pkg.dev/ssdc-rm-ci/docker/ssdc-rm-ddl:latest

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
	docker pull europe-west2-docker.pkg.dev/ssdc-rm-ci/docker/ssdc-rm-dev-common-postgres:latest

dev-postgres-up:
	docker-compose -f docker-compose-dev-postgres.yml up -d

dev-postgres-down:
	docker-compose -f docker-compose-dev-postgres.yml down

run-test-patches:
	DB_PORT=16432 pipenv run python patch_database.py

run-test-rollback:
	DB_PORT=16432 pipenv run pytest -s test_rollback_scripts.py

wait-for-docker-postgres:
	./wait_for_docker_postgres.sh

test-patches: pull-latest-dev-postgres dev-postgres-down dev-postgres-up wait-for-docker-postgres run-test-patches run-test-rollback dev-postgres-down

build-dev-postgres-image:
	docker build ./dev-common-postgres-image -t europe-west2-docker.pkg.dev/ssdc-rm-ci/dockerssdc-rm-dev-common-postgres:latest

test-dev-common-postgres: build-dev-postgres-image dev-postgres-up wait-for-docker-postgres run-test-patches run-test-rollback dev-postgres-down