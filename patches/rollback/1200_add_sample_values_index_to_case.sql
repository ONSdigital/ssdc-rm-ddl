-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 1200
-- Purpose: Add a GIN index on collex_id and flattened sample values
-- Author: Prem Buczkowski
-- ****************************************************************************


DROP INDEX IF EXISTS casev3.cases_collex_sample_idx;
DROP FUNCTION IF EXISTS casev3.flatten_sample_for_search;
DROP EXTENSION IF EXISTS btree_gin;
DROP EXTENSION IF EXISTS pg_trgm;

CREATE INDEX IF NOT EXISTS case_sample_idx ON casev3.cases USING GIN(sample);
CREATE INDEX IF NOT EXISTS uac_metadata_idx ON casev3.uac_qid_link USING GIN(metadata);
