# Make sure we're working in the right directory
cd groundzero_ddl || true

PSQL_CONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql/root.crt sslcert=/root/.postgresql/postgresql.crt sslkey=/root/.postgresql/postgresql.key hostaddr=$DB_HOST user=rmuser password=${DB_PASSWORD:=password} dbname=$DB_NAME"

psql "$PSQL_CONNECT_WRITE_MODE" -v "ON_ERROR_STOP=1" -f destroy_schemas.sql || exit 1

for SCHEMA_NAME in casev3 uacqid exceptionmanager ddl_version
do
  {
  echo "begin transaction;"
  echo "create schema if not exists $SCHEMA_NAME;"
  echo "set schema '$SCHEMA_NAME';"
  cat "$SCHEMA_NAME.sql"
  echo "commit transaction;"
  } > "tmp_transaction_$SCHEMA_NAME.sql"

  psql "$PSQL_CONNECT_WRITE_MODE" -f "tmp_transaction_$SCHEMA_NAME.sql"
  rm "tmp_transaction_$SCHEMA_NAME.sql"
done

pushd roles || exit 1
for ROLE_PERMISSIONS_SCRIPT in *.sql;
do
  {
  echo "begin transaction;"
  cat "$ROLE_PERMISSIONS_SCRIPT"
  echo "commit transaction;"
  } > "tmp_transaction_$ROLE_PERMISSIONS_SCRIPT"

  psql "$PSQL_CONNECT_WRITE_MODE" -f "tmp_transaction_$ROLE_PERMISSIONS_SCRIPT"
  rm "tmp_transaction_$ROLE_PERMISSIONS_SCRIPT"
done
popd || exit 1
