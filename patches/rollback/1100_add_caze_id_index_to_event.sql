-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 1100
-- Purpose: Rollback adding an index on the caze_id column on the casev3.event table
-- Author: Gavin Edwards
-- ****************************************************************************


DROP INDEX IF EXISTS casev3.uac_qid_caseid_idx;