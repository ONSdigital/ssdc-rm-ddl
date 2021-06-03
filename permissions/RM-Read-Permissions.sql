-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0010                         ***
-- *** Purpose: Create and grant            *** 
-- *** permissions on rm read only access   ***
-- *** role                                 ***
-- *** Author: Adam Hawtin                  ***
-- ********************************************

CREATE ROLE rm_read_access;

GRANT CONNECT ON DATABASE rm TO rm_read_access;

GRANT USAGE ON SCHEMA casev2 TO rm_read_access;
GRANT USAGE ON SCHEMA exceptionmanager TO rm_read_access;
GRANT USAGE ON SCHEMA uacqid TO rm_read_access;
GRANT USAGE ON SCHEMA ddl_version TO rm_read_access;

GRANT SELECT ON ALL TABLES IN SCHEMA casev2 TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA casev2 TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA exceptionmanager TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA exceptionmanager TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA uacqid TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA uacqid TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA ddl_version TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_read_access;

ALTER DEFAULT PRIVILEGES IN SCHEMA casev2 GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA exceptionmanager GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA uacqid GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT SELECT ON TABLES TO rm_read_access;
