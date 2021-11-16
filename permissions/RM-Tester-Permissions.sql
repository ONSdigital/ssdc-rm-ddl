DO $$
BEGIN
CREATE ROLE rm_tester;
EXCEPTION WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END
$$;

GRANT CONNECT ON DATABASE rm TO rm_tester;

GRANT USAGE ON SCHEMA casev3 TO rm_tester;
GRANT USAGE ON SCHEMA exceptionmanager TO rm_tester;
GRANT USAGE ON SCHEMA uacqid TO rm_tester;
GRANT USAGE ON SCHEMA ddl_version TO rm_tester;

GRANT SELECT ON ALL TABLES IN SCHEMA casev3 TO rm_tester;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA casev3 TO rm_tester;
GRANT SELECT ON ALL TABLES IN SCHEMA exceptionmanager TO rm_tester;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA exceptionmanager TO rm_tester;
GRANT SELECT ON ALL TABLES IN SCHEMA uacqid TO rm_tester;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA uacqid TO rm_tester;
GRANT SELECT ON ALL TABLES IN SCHEMA ddl_version TO rm_tester;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA ddl_version TO rm_tester;

ALTER DEFAULT PRIVILEGES IN SCHEMA casev3 GRANT SELECT ON TABLES TO rm_tester;
ALTER DEFAULT PRIVILEGES IN SCHEMA exceptionmanager GRANT SELECT ON TABLES TO rm_tester;
ALTER DEFAULT PRIVILEGES IN SCHEMA uacqid GRANT SELECT ON TABLES TO rm_tester;
ALTER DEFAULT PRIVILEGES IN SCHEMA ddl_version GRANT SELECT ON TABLES TO rm_tester;

-- For creating/editing/deleting auto quarantine rules
GRANT SELECT, UPDATE, INSERT, DELETE ON exceptionmanager.auto_quarantine_rule TO rm_tester;

-- For creating/editing/deleting RBAC users, groups, permissions etc
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.users TO rm_tester;
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.user_group TO rm_tester;
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.user_group_admin TO rm_tester;
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.user_group_member TO rm_tester;
GRANT SELECT, UPDATE, INSERT, DELETE ON casev3.user_group_permission TO rm_tester;
