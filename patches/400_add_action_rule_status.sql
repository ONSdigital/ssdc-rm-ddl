-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Add a status for the Action Rules and prepopulate for existing ARs
-- Author: Kacper Prywata, Adam Hawtin
-- ****************************************************************************

ALTER TABLE casev3.action_rule ADD action_rule_status VARCHAR(255)
CHECK (action_rule_status in ('SCHEDULED','SELECTING_CASES','PROCESSING_CASES','COMPLETED','ERRORED'));

ALTER casev3.action_rule 
SET status = "SCHEDULED"
WHERE hasTriggered = 'false';

ALTER casev3.action_rule 
SET status = "COMPLETED"
WHERE hasTriggered = 'true';