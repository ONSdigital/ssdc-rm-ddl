# Make sure we're working in the right directory
cd groundzero_ddl || true

PSQL_CONNECT_WRITE_MODE="sslmode=verify-ca sslrootcert=/root/.postgresql/root.crt sslcert=/root/.postgresql/postgresql.crt sslkey=/root/.postgresql/postgresql.key hostaddr=$DB_HOST user=rmuser password=${DB_PASSWORD:=password} dbname=$DB_NAME"

# Create the copy in/out files and run the copy out
echo "begin transaction;" > copy_out_tables.sql
echo "begin transaction;" > copy_in_tables.sql

# Copy out all the non survey specific user and group tables
for TABLE_NAME in users user_group user_group_member user_group_admin
do
  echo "\copy casev3.$TABLE_NAME to backup_$TABLE_NAME.txt;" >> copy_out_tables.sql
  echo "\copy casev3.$TABLE_NAME from backup_$TABLE_NAME.txt;" >> copy_in_tables.sql
done

# Only copy the global roles from the user_group_permission table, as survey specific roles will no longer work
echo "\copy (select * from casev3.user_group_permission where survey_id is null) to backup_user_group_permission.txt;" >> copy_out_tables.sql
echo "\copy casev3.user_group_permission from backup_user_group_permission.txt;" >> copy_in_tables.sql

echo "commit transaction;" >> copy_out_tables.sql
echo "commit transaction;" >> copy_in_tables.sql

psql "$PSQL_CONNECT_WRITE_MODE" -f copy_out_tables.sql

# Run the ground zero
./rebuild_from_ground_zero.sh

# Restore the tables
psql "$PSQL_CONNECT_WRITE_MODE" -f copy_in_tables.sql

# Remove all table files
for TABLE_NAME in users user_group user_group_permission user_group_member user_group_admin
do
  rm backup_$TABLE_NAME.txt
done

rm copy_out_tables.sql
rm copy_in_tables.sql
