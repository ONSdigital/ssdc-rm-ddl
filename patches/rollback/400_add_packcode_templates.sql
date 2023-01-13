-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Rollback seeding the packcode templates
-- Author: Adam Hawtin
-- ****************************************************************************

-- Export File Templates
DELETE FROM casev3.export_file_template WHERE pack_code = 'NL_EN_ST_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code = 'NL_CY_ST_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code = 'NL_EN_LP_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code = 'NL_CY_LP_PHM';

-- Email Templates
DELETE FROM casev3.export_file_template WHERE pack_code =  'NE_EN_Q_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code =  'NE_CY_Q_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code =  'NE_EN_T_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code =  'NE_CY_T_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code =  'RE_EN_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code =  'RE_CY_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code =  'UR_EN_PHM';
DELETE FROM casev3.export_file_template WHERE pack_code =  'UR_CY_PHM';
