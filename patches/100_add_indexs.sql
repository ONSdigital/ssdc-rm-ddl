-- ****************************************************************************
-- RM SQL DATABASE UPDATE EXAMPLE SCRIPT
-- ****************************************************************************
-- Number: 100
-- Purpose: add missing indexes
-- Author: Test
-- ****************************************************************************

CREATE INDEX IF NOT EXISTS cases_case_ref_idx ON cases (case_ref);

CREATE INDEX IF NOT EXISTS case_sample_idx ON casev3.cases USING GIN(sample);

CREATE INDEX IF NOT EXISTS uac_metadata_idx ON casev3.uac_qid_link USING GIN(metadata);



