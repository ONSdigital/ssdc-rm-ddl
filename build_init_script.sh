rm dev-common-postgres-image/init.sql || true
{
echo "create schema if not exists casev3;"
echo "set schema 'casev3';"
cat groundzero_ddl/casev3.sql
} > dev-common-postgres-image/init.sql
