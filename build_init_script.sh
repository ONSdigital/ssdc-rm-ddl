rm integration-testing-image/init.sql | true
echo "create schema if not exists casev3;" >> integration-testing-image/init.sql
echo "set schema 'casev3';" >> integration-testing-image/init.sql
cat groundzero_ddl/casev3.sql >> integration-testing-image/init.sql


