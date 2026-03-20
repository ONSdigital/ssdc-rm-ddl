-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 1200
-- Purpose: Add an index on the collection_exercise_id column on the casev3.cases table
-- Author: Prem Buczkowski
-- ****************************************************************************


DROP INDEX IF EXISTS casev3.cases_collex_id_idx;
