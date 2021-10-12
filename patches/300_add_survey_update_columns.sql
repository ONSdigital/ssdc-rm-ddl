-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 300
-- Purpose: Add columns to survey table for survey update events
-- Author: Nick Grant
-- ****************************************************************************

ALTER TABLE casev3.survey
    ADD COLUMN IF NOT EXISTS metadata jsonb;

ALTER TABLE casev3.survey
    ADD COLUMN IF NOT EXISTS sample_definition_url varchar(255);

UPDATE casev3.survey SET sample_definition_url='http://time.for.a.data.wipe/yesItsLongOverdue';

ALTER TABLE casev3.survey ALTER COLUMN sample_definition_url SET NOT NULL;