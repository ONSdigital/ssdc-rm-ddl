-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1400
-- Purpose: Create MI snapshot tables for response rates, email requests and
--          export file requests
-- Author: Prem Buczkowski
-- ****************************************************************************


CREATE TABLE casev3.mi_response_rate (
    id bigserial NOT NULL,
    collection_exercise_id uuid NOT NULL,
    snapshot_date date NOT NULL,
    receipted_count integer NOT NULL,
    launched_count integer NOT NULL,
    total_case_count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uq_mi_response_rate UNIQUE (collection_exercise_id, snapshot_date),
    CONSTRAINT fk_mi_response_rate_collex FOREIGN KEY (collection_exercise_id) REFERENCES casev3.collection_exercise (id)
);

CREATE TABLE casev3.mi_email_request (
    id bigserial NOT NULL,
    collection_exercise_id uuid NOT NULL,
    pack_code varchar(255) NOT NULL,
    snapshot_date date NOT NULL,
    daily_email_requests integer NOT NULL,
    total_email_requests integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uq_mi_email_request UNIQUE (collection_exercise_id, pack_code, snapshot_date),
    CONSTRAINT fk_mi_email_request_collex FOREIGN KEY (collection_exercise_id) REFERENCES casev3.collection_exercise (id)
);

CREATE TABLE casev3.mi_export_file_request (
    id bigserial NOT NULL,
    collection_exercise_id uuid NOT NULL,
    pack_code varchar(255) NOT NULL,
    snapshot_date date NOT NULL,
    daily_export_file_requests integer NOT NULL,
    total_export_file_requests integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uq_mi_export_file_request UNIQUE (collection_exercise_id, pack_code, snapshot_date),
    CONSTRAINT fk_mi_export_file_request_collex FOREIGN KEY (collection_exercise_id) REFERENCES casev3.collection_exercise (id)
);