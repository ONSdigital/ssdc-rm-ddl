rm dev-common-postgres-image/init.sql | true
echo "create schema if not exists casev3;" >> dev-common-postgres-image/init.sql
echo "set schema 'casev3';" >> dev-common-postgres-image/init.sql
cat groundzero_ddl/casev3.sql >> dev-common-postgres-image/init.sql


