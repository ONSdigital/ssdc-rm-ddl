rm dev-common-postgres-image/init.sql || true
{
echo "create schema if not exists casev3;"
echo "set schema 'casev3';"
cat groundzero_ddl/casev3.sql
} > dev-common-postgres-image/init.sql

{
echo ""
echo "create schema if not exists uacqid;"
echo "set schema 'uacqid';"
cat groundzero_ddl/uacqid.sql
} >> dev-common-postgres-image/init.sql

{
echo ""
echo "create schema if not exists ddl_version;"
echo "set schema 'ddl_version';"
cat groundzero_ddl/ddl_version.sql
} >> dev-common-postgres-image/init.sql
