install:
	pipenv install --dev

check:
	PIPENV_PYUP_API_KEY="" pipenv check -i 40291

lint:
	pipenv run flake8

test: check lint
	pipenv run pytest

format-check-common:
	cd ssdc-rm-common-entity-model && mvn fmt:check

build-common:
	cd ssdc-rm-common-entity-model && mvn compile