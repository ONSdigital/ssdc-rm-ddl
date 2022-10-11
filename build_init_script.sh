rm dev-common-postgres-image/init.sql || true
{
echo "-- THIS FILE IS AUTO-GENERATED"
echo "-- DO NOT EDIT IT DIRECTLY"
echo "-- REFER TO THE README FOR INSTRUCTIONS ON REGENERATING IT"
echo ""
echo "create schema if not exists casev3;"
echo "set schema 'casev3';"
cat groundzero_ddl/casev3.sql
echo ""
echo "create schema if not exists uacqid;"
echo "set schema 'uacqid';"
cat groundzero_ddl/uacqid.sql
echo ""
echo "create schema if not exists exceptionmanager;"
echo "set schema 'uacqid';"
cat groundzero_ddl/exceptionmanager.sql
echo ""
echo "create schema if not exists ddl_version;"
echo "set schema 'ddl_version';"
cat groundzero_ddl/ddl_version.sql
} > dev-common-postgres-image/init.sql
