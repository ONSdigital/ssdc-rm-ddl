-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1300
-- Purpose: Add an index on the uac_qid_link_id column to the casev3.event table
-- Author: Gavin Edwards
-- ****************************************************************************


CREATE INDEX IF NOT EXISTS event_uac_qid_link_id_idx ON casev3.event (uac_qid_link_id);