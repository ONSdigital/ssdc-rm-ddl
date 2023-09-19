-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK INSERT SCRIPT
-- ****************************************************************************
-- Number: 1300
-- Purpose: Delete old templates
-- Author: Gavin Edwards
-- ****************************************************************************

DELETE FROM casev3.export_file_template
WHERE pack_code IN ('NL_EN_ST_CRIS', 'NL_CY_ST_CRIS', 'NL_EN_LP_CRIS', 'NL_CY_LP_CRIS');

DELETE FROM casev3.email_template
WHERE pack_code IN ('NE_EN_CRIS', 'NE_CY_CRIS', 'RE_EN_CRIS', 'RE_CY_CRIS', 'UR_EN_CRIS', 'UR_CY_CRIS','RE_UAC_EN_CRIS','RE_UAC_CY_CRIS');