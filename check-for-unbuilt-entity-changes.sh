#!/usr/bin/env bash

### This script is intended to be run in CI environments, and will fail by design if run locally
### when there are uncommitted changes

# Do a DDL build
mvn clean package
java -jar target/ssdc-rm-ddl-1.0-SNAPSHOT.jar casev3 uk.gov.ons.ssdc.common.model.entity

# Check if files known to git have changed
git diff --exit-code || echo "THERE ARE UN-BUILT DDL CHANGES. Try running 'make dev-build' and committing the results" && exit 1
