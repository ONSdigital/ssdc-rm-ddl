-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 300
-- Purpose: Add a description for the Action Rules
-- Author: Kacper Prywata
-- ****************************************************************************

ALTER TABLE casev3.action_rule ADD selected_case_count VARCHAR(50);
