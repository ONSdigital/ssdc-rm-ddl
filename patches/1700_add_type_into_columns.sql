-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 1700
-- Purpose: Add CHECK constraint to table columns
-- Author: Ryan Grundy
-- ****************************************************************************


ALTER TABLE casev3.action_rule
ADD CHECK ( type in ('EXPORT_FILE','OUTBOUND_TELEPHONE','FACE_TO_FACE','DEACTIVATE_UAC','SMS','EMAIL','EQ_FLUSH') );

ALTER TABLE casev3.cases
ADD CHECK ( refusal_received in ('HARD_REFUSAL','EXTRAORDINARY_REFUSAL','SOFT_REFUSAL','WITHDRAWAL_REFUSAL') );

ALTER TABLE casev3.event
ADD CHECK (type in ('NEW_CASE','RECEIPT','REFUSAL','ERASE_DATA','EQ_LAUNCH','INVALID_CASE','UAC_AUTHENTICATION','TELEPHONE_CAPTURE','PRINT_FULFILMENT','EXPORT_FILE','DEACTIVATE_UAC','UPDATE_SAMPLE','UPDATE_SAMPLE_SENSITIVE','SMS_FULFILMENT','ACTION_RULE_SMS_REQUEST','EMAIL_FULFILMENT','ACTION_RULE_EMAIL_REQUEST','ACTION_RULE_SMS_CONFIRMATION','ACTION_RULE_EMAIL_CONFIRMATION'));

ALTER TABLE casev3.Job
ADD CHECK (job_status in ('FILE_UPLOADED','STAGING_IN_PROGRESS','VALIDATION_IN_PROGRESS','VALIDATED_OK','VALIDATED_WITH_ERRORS','VALIDATED_TOTAL_FAILURE','PROCESSING_IN_PROGRESS','PROCESSED','CANCELLED'));

ALTER TABLE casev3.Job
ADD CHECK ( job_type in ('SAMPLE','BULK_REFUSAL','BULK_UPDATE_SAMPLE_SENSITIVE','BULK_INVALID','BULK_UPDATE_SAMPLE') );

ALTER TABLE casev3.job_row
ADD CHECK ( job_row_status in ('STAGED','VALIDATED_OK','VALIDATED_ERROR','PROCESSED') );

ALTER TABLE casev3.user_group_permission
ADD CHECK ( authorised_activity in ('SUPER_USER','LIST_SURVEYS','VIEW_SURVEY','CREATE_SURVEY','CREATE_EXPORT_FILE_TEMPLATE','CREATE_SMS_TEMPLATE','CREATE_EMAIL_TEMPLATE','LIST_COLLECTION_EXERCISES','VIEW_COLLECTION_EXERCISE','CREATE_COLLECTION_EXERCISE','ALLOW_EXPORT_FILE_TEMPLATE_ON_ACTION_RULE','LIST_ALLOWED_EXPORT_FILE_TEMPLATES_ON_ACTION_RULES','ALLOW_SMS_TEMPLATE_ON_ACTION_RULE','LIST_ALLOWED_SMS_TEMPLATES_ON_ACTION_RULES','ALLOW_EMAIL_TEMPLATE_ON_ACTION_RULE','LIST_ALLOWED_EMAIL_TEMPLATES_ON_ACTION_RULES','ALLOW_EXPORT_FILE_TEMPLATE_ON_FULFILMENT','LIST_ALLOWED_EXPORT_FILE_TEMPLATES_ON_FULFILMENTS','ALLOW_SMS_TEMPLATE_ON_FULFILMENT','LIST_ALLOWED_SMS_TEMPLATES_ON_FULFILMENTS','ALLOW_EMAIL_TEMPLATE_ON_FULFILMENT','LIST_ALLOWED_EMAIL_TEMPLATES_ON_FULFILMENTS','SEARCH_CASES','VIEW_CASE_DETAILS','LIST_ACTION_RULES','CREATE_EXPORT_FILE_ACTION_RULE','CREATE_FACE_TO_FACE_ACTION_RULE','CREATE_OUTBOUND_PHONE_ACTION_RULE','CREATE_DEACTIVATE_UAC_ACTION_RULE','CREATE_SMS_ACTION_RULE','CREATE_EMAIL_ACTION_RULE','CREATE_EQ_FLUSH_ACTION_RULE','LOAD_SAMPLE','VIEW_SAMPLE_LOAD_PROGRESS','LOAD_BULK_REFUSAL','VIEW_BULK_REFUSAL_PROGRESS','LOAD_BULK_UPDATE_SAMPLE_SENSITIVE','LOAD_BULK_INVALID','LOAD_BULK_UPDATE_SAMPLE','VIEW_BULK_UPDATE_SAMPLE_SENSITIVE_PROGRESS','VIEW_BULK_INVALID_PROGRESS','VIEW_BULK_UPDATE_SAMPLE_PROGRESS','DEACTIVATE_UAC','CREATE_CASE_REFUSAL','CREATE_CASE_INVALID_CASE','CREATE_CASE_EXPORT_FILE_FULFILMENT','CREATE_CASE_SMS_FULFILMENT','CREATE_CASE_EMAIL_FULFILMENT','UPDATE_SAMPLE','UPDATE_SAMPLE_SENSITIVE','LIST_EXPORT_FILE_TEMPLATES','LIST_EXPORT_FILE_DESTINATIONS','LIST_SMS_TEMPLATES','LIST_EMAIL_TEMPLATES','CONFIGURE_FULFILMENT_TRIGGER','EXCEPTION_MANAGER_VIEWER','EXCEPTION_MANAGER_PEEK','EXCEPTION_MANAGER_QUARANTINE','LIST_USERS'));