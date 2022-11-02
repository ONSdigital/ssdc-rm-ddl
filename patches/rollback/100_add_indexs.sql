-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK EXAMPLE
-- ****************************************************************************
-- Number: 100
-- Purpose: Rollback script for indexes
-- Author: Luke Loze
-- ****************************************************************************


DROP INDEX IF EXISTS casev3.case_sample_idx;

DROP INDEX IF EXISTS casev3.uac_metadata_idx;

DROP INDEX IF EXISTS casev3.qid_idx;