CREATE TABLE ddl_version.patches (patch_number integer PRIMARY KEY, applied_timestamp timestamp with time zone NOT NULL);
CREATE TABLE ddl_version.version (version_tag varchar(256) PRIMARY KEY, updated_timestamp timestamp with time zone NOT NULL);

-- Version and patch number for the current ground zero,
-- NOTE: These must be updated every time the repo is tagged
-- NOTE: the CURRENT_VERSION in /patch_database.py must also be updated to match this version_tag
INSERT INTO ddl_version.patches (patch_number, applied_timestamp) VALUES (1800, current_timestamp);
INSERT INTO ddl_version.version (version_tag, updated_timestamp) VALUES ('v1.3.0', current_timestamp);
