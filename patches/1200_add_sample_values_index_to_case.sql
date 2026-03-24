-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1200
-- Purpose: Add a GIN index on collex_id and flattened sample values
-- Author: Prem Buczkowski
-- ****************************************************************************

-- This extension allows indexing arbitrary substrings.
CREATE EXTENSION IF NOT EXISTS pg_trgm SCHEMA public;
-- This extension allows a GIN index on collection_exercise.
CREATE EXTENSION IF NOT EXISTS btree_gin SCHEMA public;

-- Helper function returning all values in sample and sample_sensitive, separated by 0x1
CREATE OR REPLACE FUNCTION casev3.flatten_sample_for_search(sample jsonb, sample_sensitive jsonb)
  RETURNS TEXT IMMUTABLE LANGUAGE sql AS $$
    SELECT LOWER(REPLACE(
      string_agg(val, E'\x1F'), -- values separated by a nonprintable character
      ' ', ''                   -- spaces stripped so search is not sensitive to them
    ))
    FROM jsonb_each_text(
      COALESCE(sample, '{}'::jsonb) || COALESCE(sample_sensitive, '{}'::jsonb)
    ) AS x(ky, val)
  $$;

-- Add an index on collex_id and the flattened sample.
-- fastupdate must be off, otherwise the planner won't pick it. Inserts are still fast.
CREATE INDEX IF NOT EXISTS cases_collex_sample_idx ON casev3.cases
    USING GIN (
               collection_exercise_id,
               casev3.flatten_sample_for_search(
                       sample,
                       sample_sensitive
               ) public.gin_trgm_ops
              )
    WITH (fastupdate = off);

-- Drop unused GIN indices.
-- The operators that can use them (@>, <@, ?, ?|, ?&) are not used anywhere in the RM and self-service tools.
DROP INDEX IF EXISTS casev3.case_sample_idx;
DROP INDEX IF EXISTS casev3.uac_metadata_idx;
