-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1200
-- Purpose: Add an index on the collection_exercise_id column on the casev3.cases table
-- Author: Prem Buczkowski
-- ****************************************************************************


CREATE INDEX IF NOT EXISTS cases_collex_id_idx ON casev3.cases (collection_exercise_id);