DO $$
BEGIN
CREATE ROLE rm_support;
EXCEPTION WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END
$$;

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
