CREATE INDEX IF NOT EXISTS case_sample_idx ON casev3.cases USING GIN(sample);
