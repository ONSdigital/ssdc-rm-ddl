-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 1300
-- Purpose: Rollback adding an index on the uac_qid_link_id column to the casev3.event table
-- Author: Gavin Edwards
-- ****************************************************************************


DROP INDEX IF EXISTS event_uac_qid_link_id_idx;