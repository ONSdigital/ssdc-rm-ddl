-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1500
-- Purpose: Create Action Template tables and link to Collection Exercise
-- Author: Serena Crocker
-- ****************************************************************************

CREATE TABLE casev3.action_template (
    id uuid NOT NULL,
    name varchar(255) NOT NULL,
    survey_id uuid NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uq_action_template_name UNIQUE (name)
);

CREATE TABLE casev3.action_template_row (
    id uuid NOT NULL,
    action_type varchar(255) NOT NULL CHECK (action_type IN ('EXPORT_FILE','OUTBOUND_TELEPHONE','FACE_TO_FACE','DEACTIVATE_UAC','SMS','EMAIL','EQ_FLUSH')),
    cohort integer,
    time_offset integer,
    trigger_time timestamp(6) with time zone,
    action_template_id uuid NOT NULL,
    email_template_pack_code varchar(255),
    PRIMARY KEY (id),
    CONSTRAINT fk_action_template_row_action_template FOREIGN KEY (action_template_id) REFERENCES casev3.action_template (id),
    CONSTRAINT fk_action_template_row_email_template FOREIGN KEY (email_template_pack_code) REFERENCES casev3.email_template (pack_code)
);

ALTER TABLE IF EXISTS casev3.collection_exercise ADD COLUMN template_id uuid;
ALTER TABLE IF EXISTS casev3.collection_exercise ADD CONSTRAINT fk_collection_exercise_action_template FOREIGN KEY (template_id) REFERENCES casev3.action_template (id);