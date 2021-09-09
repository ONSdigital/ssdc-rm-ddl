ALTER TABLE exceptionmanager.quarantined_message
    ADD COLUMN IF NOT EXISTS skipping_user varchar(255);