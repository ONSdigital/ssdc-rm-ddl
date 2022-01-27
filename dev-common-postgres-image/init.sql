create schema if not exists casev3;
set schema 'casev3';

    create table action_rule (
       id uuid not null,
        classifiers bytea,
        created_by varchar(255) not null,
        email_column varchar(255),
        has_triggered BOOLEAN DEFAULT false not null,
        phone_number_column varchar(255),
        trigger_date_time timestamp with time zone not null,
        type varchar(255) not null,
        uac_metadata jsonb,
        collection_exercise_id uuid not null,
        email_template_pack_code varchar(255),
        export_file_template_pack_code varchar(255),
        sms_template_pack_code varchar(255),
        primary key (id)
    );

    create table action_rule_survey_email_template (
       id uuid not null,
        email_template_pack_code varchar(255) not null,
        survey_id uuid not null,
        primary key (id)
    );

    create table action_rule_survey_export_file_template (
       id uuid not null,
        export_file_template_pack_code varchar(255) not null,
        survey_id uuid not null,
        primary key (id)
    );

    create table action_rule_survey_sms_template (
       id uuid not null,
        sms_template_pack_code varchar(255) not null,
        survey_id uuid not null,
        primary key (id)
    );

    create table cases (
       id uuid not null,
        meta_data jsonb,
        case_ref int8,
        created_at timestamp with time zone,
        invalid BOOLEAN DEFAULT false not null,
        last_updated_at timestamp with time zone,
        refusal_received varchar(255),
        sample jsonb,
        sample_sensitive jsonb,
        secret_sequence_number serial,
        collection_exercise_id uuid not null,
        primary key (id)
    );

    create table case_to_process (
       id  bigserial not null,
        batch_id uuid not null,
        batch_quantity int4 not null,
        action_rule_id uuid not null,
        caze_id uuid not null,
        primary key (id)
    );

    create table cluster_leader (
       id uuid not null,
        host_last_seen_alive_at timestamp with time zone not null,
        host_name varchar(255) not null,
        primary key (id)
    );

    create table collection_exercise (
       id uuid not null,
        collection_instrument_selection_rules jsonb not null,
        end_date timestamp with time zone not null,
        metadata jsonb,
        name varchar(255) not null,
        reference varchar(255) not null,
        start_date timestamp with time zone not null,
        survey_id uuid not null,
        primary key (id)
    );

    create table email_template (
       pack_code varchar(255) not null,
        description varchar(255) not null,
        metadata jsonb,
        notify_template_id uuid not null,
        template jsonb not null,
        primary key (pack_code)
    );

    create table event (
       id uuid not null,
        channel varchar(255) not null,
        correlation_id uuid not null,
        created_by varchar(255),
        date_time timestamp with time zone not null,
        description varchar(255) not null,
        message_id uuid not null,
        message_timestamp Timestamp with time zone not null,
        payload jsonb,
        processed_at timestamp with time zone not null,
        source varchar(255) not null,
        type varchar(255) not null,
        caze_id uuid,
        uac_qid_link_id uuid,
        primary key (id)
    );

    create table export_file_row (
       id  bigserial not null,
        batch_id uuid not null,
        batch_quantity int4 not null,
        export_file_destination varchar(255) not null,
        pack_code varchar(255) not null,
        row varchar(255) not null,
        primary key (id)
    );

    create table export_file_template (
       pack_code varchar(255) not null,
        description varchar(255) not null,
        export_file_destination varchar(255) not null,
        metadata jsonb,
        template jsonb not null,
        primary key (pack_code)
    );

    create table fulfilment_next_trigger (
       id uuid not null,
        trigger_date_time timestamp with time zone not null,
        primary key (id)
    );

    create table fulfilment_survey_email_template (
       id uuid not null,
        email_template_pack_code varchar(255) not null,
        survey_id uuid not null,
        primary key (id)
    );

    create table fulfilment_survey_export_file_template (
       id uuid not null,
        export_file_template_pack_code varchar(255) not null,
        survey_id uuid not null,
        primary key (id)
    );

    create table fulfilment_survey_sms_template (
       id uuid not null,
        sms_template_pack_code varchar(255) not null,
        survey_id uuid not null,
        primary key (id)
    );

    create table fulfilment_to_process (
       id  bigserial not null,
        batch_id uuid,
        batch_quantity int4,
        correlation_id uuid not null,
        originating_user varchar(255),
        uac_metadata jsonb,
        caze_id uuid not null,
        export_file_template_pack_code varchar(255) not null,
        primary key (id)
    );

    create table job (
       id uuid not null,
        cancelled_at timestamp with time zone,
        cancelled_by varchar(255),
        created_at timestamp with time zone,
        created_by varchar(255) not null,
        error_row_count int4 not null,
        fatal_error_description varchar(255),
        file_id uuid not null,
        file_name varchar(255) not null,
        file_row_count int4 not null,
        job_status varchar(255) not null,
        job_type varchar(255) not null,
        last_updated_at timestamp with time zone,
        processed_at timestamp with time zone,
        processed_by varchar(255),
        processing_row_number int4 not null,
        staging_row_number int4 not null,
        validating_row_number int4 not null,
        collection_exercise_id uuid not null,
        primary key (id)
    );

    create table job_row (
       id uuid not null,
        job_row_status varchar(255) not null,
        original_row_data bytea not null,
        original_row_line_number int4 not null,
        row_data jsonb,
        validation_error_descriptions bytea,
        job_id uuid not null,
        primary key (id)
    );

    create table message_to_send (
       id uuid not null,
        destination_topic varchar(255) not null,
        message_body bytea not null,
        primary key (id)
    );

    create table response_period (
       id uuid not null,
        meta_data jsonb,
        name varchar(255),
        response_period_state int4,
        caze_id uuid,
        primary key (id)
    );
