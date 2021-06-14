-- ********************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT ***
-- ********************************************
-- *** Number: 0012                         ***
-- *** Purpose: Create and grant            *** 
-- *** permissions on rm dev group role     ***
-- ***                                      ***
-- *** Author: Adam Hawtin                  ***
-- ********************************************

CREATE ROLE rm_developer;

GRANT CONNECT ON DATABASE rm TO rm_developer;

GRANT USAGE ON SCHEMA casev3 TO rm_developer;
GRANT USAGE ON SCHEMA uacqid TO rm_developer;
GRANT USAGE ON SCHEMA exceptionmanager TO rm_developer;
GRANT USAGE ON SCHEMA ddl_version TO rm_developer;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA casev3 TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA casev3 TO rm_developer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA uacqid TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA uacqid TO rm_developer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA exceptionmanager TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA exceptionmanager TO rm_developer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA ddl_version TO rm_developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_developer;
GRANT ALL PRIVILEGES ON DATABASE rm TO rm_developer;

ALTER DEFAULT PRIVILEGES IN SCHEMA casev3 GRANT ALL PRIVILEGES ON TABLES TO rm_developer;
ALTER DEFAULT PRIVILEGES IN SCHEMA uacqid GRANT ALL PRIVILEGES ON TABLES TO rm_developer;
ALTER DEFAULT PRIVILEGES IN SCHEMA exceptionmanager GRANT ALL PRIVILEGES ON TABLES TO rm_developer;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT ALL PRIVILEGES ON TABLES TO rm_developer;