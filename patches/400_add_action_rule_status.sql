-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Add a status for the Action Rules and prepopulate for existing ARs
-- Author: Kacper Prywata
-- ****************************************************************************

CREATE TYPE action_rule_status_enum AS ENUM ('SCHEDULED','SELECTING_CASES','PROCESSING_CASES','COMPLETED','ERRORED');
ALTER TABLE casev3.action_rule ADD status action_rule_status_enum;

ALTER casev3.action_rule 
SET status = "SCHEDULED"
WHERE hasTriggered = 'false';

ALTER casev3.action_rule 
SET status = "COMPLETED"
WHERE hasTriggered = 'true';