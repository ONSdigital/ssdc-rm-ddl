#!/usr/bin/env bash

### This script is intended to be run in CI environments, and will fail by design if run locally
### when there are uncommitted changes

# Do a DDL build
make dev-update-ddl

# Check if files known to git have changed
git diff --exit-code || echo "THERE ARE UN-BUILT DDL CHANGES. Try running 'make dev-build' and committing the results" && exit 1
