-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 900
-- Purpose: Add roles and permissions which are now included with the DDL
-- Author: Adam Hawtin
-- ****************************************************************************

-- rm_read_access role
CREATE ROLE rm_read_access;

GRANT CONNECT ON DATABASE rm TO rm_read_access;

GRANT USAGE ON SCHEMA casev3 TO rm_read_access;
GRANT USAGE ON SCHEMA exceptionmanager TO rm_read_access;
GRANT USAGE ON SCHEMA uacqid TO rm_read_access;
GRANT USAGE ON SCHEMA ddl_version TO rm_read_access;

GRANT SELECT ON ALL TABLES IN SCHEMA casev3 TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA casev3 TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA exceptionmanager TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA exceptionmanager TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA uacqid TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA uacqid TO rm_read_access;
GRANT SELECT ON ALL TABLES IN SCHEMA ddl_version TO rm_read_access;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_read_access;

ALTER DEFAULT PRIVILEGES IN SCHEMA casev3 GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA exceptionmanager GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA uacqid GRANT SELECT ON TABLES TO rm_read_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT SELECT ON TABLES TO rm_read_access;
---------------------------

-- rm_superuser role
CREATE ROLE rm_superuser;

GRANT CONNECT ON DATABASE rm TO rm_superuser;

GRANT USAGE ON SCHEMA casev3 TO rm_superuser;
GRANT USAGE ON SCHEMA uacqid TO rm_superuser;
GRANT USAGE ON SCHEMA exceptionmanager TO rm_superuser;
GRANT USAGE ON SCHEMA ddl_version TO rm_superuser;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA casev3 TO rm_superuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA casev3 TO rm_superuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA uacqid TO rm_superuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA uacqid TO rm_superuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA exceptionmanager TO rm_superuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA exceptionmanager TO rm_superuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA ddl_version TO rm_superuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_superuser;
GRANT ALL PRIVILEGES ON DATABASE rm TO rm_superuser;

ALTER DEFAULT PRIVILEGES IN SCHEMA casev3 GRANT ALL PRIVILEGES ON TABLES TO rm_superuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA uacqid GRANT ALL PRIVILEGES ON TABLES TO rm_superuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA exceptionmanager GRANT ALL PRIVILEGES ON TABLES TO rm_superuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT ALL PRIVILEGES ON TABLES TO rm_superuser;
---------------------------

-- rm_superuser role
CREATE ROLE rm_support;

GRANT CONNECT ON DATABASE rm TO rm_support;

GRANT USAGE ON SCHEMA casev3 TO rm_support;
GRANT USAGE ON SCHEMA exceptionmanager TO rm_support;
GRANT USAGE ON SCHEMA uacqid TO rm_support;
GRANT USAGE ON SCHEMA ddl_version TO rm_support;

GRANT SELECT ON ALL TABLES IN SCHEMA casev3 TO rm_support;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA casev3 TO rm_support;
GRANT SELECT ON ALL TABLES IN SCHEMA exceptionmanager TO rm_support;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA exceptionmanager TO rm_support;
GRANT SELECT ON ALL TABLES IN SCHEMA uacqid TO rm_support;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA uacqid TO rm_support;
GRANT SELECT ON ALL TABLES IN SCHEMA ddl_version TO rm_support;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_support;

ALTER DEFAULT PRIVILEGES IN SCHEMA casev3 GRANT SELECT ON TABLES TO rm_support;
ALTER DEFAULT PRIVILEGES IN SCHEMA exceptionmanager GRANT SELECT ON TABLES TO rm_support;
ALTER DEFAULT PRIVILEGES IN SCHEMA uacqid GRANT SELECT ON TABLES TO rm_support;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT SELECT ON TABLES TO rm_support;

-- For creating/editing/deleting auto quarantine rules
GRANT SELECT, UPDATE, INSERT, DELETE ON exceptionmanager.auto_quarantine_rule TO rm_support;

-- For creating/editing/deleting RBAC users, roles, roles etc
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.users TO rm_support;
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.user_group TO rm_support;
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.user_group_admin TO rm_support;
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.user_group_member TO rm_support;
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.user_group_permission TO rm_support;
---------------------------
