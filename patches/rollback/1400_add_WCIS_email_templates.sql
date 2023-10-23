-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK INSERT SCRIPT
-- ****************************************************************************
-- Number: 1400
-- Purpose: Delete WCIS email templates
-- Author: Adam Hawtin
-- ****************************************************************************

DELETE FROM casev3.email_template
WHERE pack_code IN ('MNE_EN_WCIS', 'MRE_EN_WCIS', 'FNE_EN_WCIS', 'FRE_EN_WCIS');
