-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1600
-- Purpose: Create Action Template tables and link to Collection Exercise
-- Author: Serena Crocker
-- ****************************************************************************

ALTER TABLE IF EXISTS casev3.collection_exercise DROP CONSTRAINT IF EXISTS fk_collection_exercise_action_template;
ALTER TABLE IF EXISTS casev3.collection_exercise DROP COLUMN IF EXISTS template_id;

DROP TABLE IF EXISTS casev3.action_template_row;
DROP TABLE IF EXISTS casev3.action_template;