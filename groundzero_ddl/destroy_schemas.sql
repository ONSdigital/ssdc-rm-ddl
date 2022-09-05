begin transaction;
DROP SCHEMA IF EXISTS casev3 cascade;
DROP SCHEMA IF EXISTS uacqid cascade;
DROP SCHEMA IF EXISTS exceptionmanager cascade;
DROP SCHEMA IF EXISTS ddl_version cascade;

DROP ROLE IF EXISTS rm_superuser
DROP ROLE IF EXISTS rm_support
DROP ROLE IF EXISTS rm_read_access
commit transaction;
