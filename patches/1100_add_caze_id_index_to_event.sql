-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1100
-- Purpose: Add an index on the caze_id column on the casev3.event table
-- Author: Gavin Edwards
-- ****************************************************************************


CREATE INDEX IF NOT EXISTS event_caseid_idx ON casev3.event (caze_id);