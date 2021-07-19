-- ****************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                 ***
-- ****************************************************************************
-- *** Number: 100                                                          ***
-- *** Purpose: Add GIN index to sample column, can't do it in Hibernate    ***
-- *** Author: Luke Loze                                                    ***
-- ****************************************************************************


CREATE INDEX IF NOT EXISTS case_sample_idx ON casev3.cases USING GIN(sample);
