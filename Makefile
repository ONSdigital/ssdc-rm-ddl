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
