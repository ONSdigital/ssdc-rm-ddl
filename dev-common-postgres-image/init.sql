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
        message_id uuid not null,
        originating_user varchar(255),
        personalisation jsonb,
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

    create table sms_template (
       pack_code varchar(255) not null,
        description varchar(255) not null,
        metadata jsonb,
        notify_template_id uuid not null,
        template jsonb not null,
        primary key (pack_code)
    );

    create table survey (
       id uuid not null,
        metadata jsonb,
        name varchar(255) not null,
        sample_definition_url varchar(255) not null,
        sample_separator char(1) not null,
        sample_validation_rules jsonb not null,
        sample_with_header_row boolean not null,
        primary key (id)
    );

    create table uac_qid_link (
       id uuid not null,
        active BOOLEAN DEFAULT true not null,
        collection_instrument_url varchar(255) not null,
        created_at timestamp with time zone,
        eq_launched BOOLEAN DEFAULT false not null,
        last_updated_at timestamp with time zone,
        metadata jsonb,
        qid varchar(255) not null,
        receipt_received BOOLEAN DEFAULT false not null,
        uac varchar(255) not null,
        uac_hash varchar(255) not null,
        caze_id uuid not null,
        primary key (id)
    );

    create table user_group (
       id uuid not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table user_group_admin (
       id uuid not null,
        group_id uuid not null,
        user_id uuid not null,
        primary key (id)
    );

    create table user_group_member (
       id uuid not null,
        group_id uuid not null,
        user_id uuid not null,
        primary key (id)
    );

    create table user_group_permission (
       id uuid not null,
        authorised_activity varchar(255),
        group_id uuid not null,
        survey_id uuid,
        primary key (id)
    );

    create table users (
       id uuid not null,
        email varchar(255) not null,
        primary key (id)
    );
create index cases_case_ref_idx on cases (case_ref);

    alter table if exists fulfilment_to_process 
       add constraint UK_oi6eanl9qiyiqi2p0quygsxgy unique (message_id);

    alter table if exists user_group 
       add constraint UK_kas9w8ead0ska5n3csefp2bpp unique (name);

    alter table if exists users 
       add constraint users_email_idx unique (email);

    alter table if exists action_rule 
       add constraint FK6twtf1ksysh99e4g2ejmoy6c1 
       foreign key (collection_exercise_id) 
       references collection_exercise;

    alter table if exists action_rule 
       add constraint FKssc7f5mlut14gbb20282seiyn 
       foreign key (email_template_pack_code) 
       references email_template;

    alter table if exists action_rule 
       add constraint FK9fefdqv5a7vb04vu7gn6cad19 
       foreign key (export_file_template_pack_code) 
       references export_file_template;

    alter table if exists action_rule 
       add constraint FKtnrm1hhiyehmygso5dsb6dv7a 
       foreign key (sms_template_pack_code) 
       references sms_template;

    alter table if exists action_rule_survey_email_template 
       add constraint FKfjx53yvq2f07lipml9kcm8qlb 
       foreign key (email_template_pack_code) 
       references email_template;

    alter table if exists action_rule_survey_email_template 
       add constraint FKfucekff07exgw9xd5pd6wxc80 
       foreign key (survey_id) 
       references survey;

    alter table if exists action_rule_survey_export_file_template 
       add constraint FKpeyvyyoxpqh7rvae2hxmg2wd2 
       foreign key (export_file_template_pack_code) 
       references export_file_template;

    alter table if exists action_rule_survey_export_file_template 
       add constraint FKmtao7nj3x74iki19rygx5pdcl 
       foreign key (survey_id) 
       references survey;

    alter table if exists action_rule_survey_sms_template 
       add constraint FKrtyhiquv8tgdiv0sc2e5ovqld 
       foreign key (sms_template_pack_code) 
       references sms_template;

    alter table if exists action_rule_survey_sms_template 
       add constraint FKcksec9j9chi54k0fuhsywnfne 
       foreign key (survey_id) 
       references survey;

    alter table if exists cases 
       add constraint FKrl77p02uu7a253tn2ro5mitv5 
       foreign key (collection_exercise_id) 
       references collection_exercise;

    alter table if exists case_to_process 
       add constraint FKmqcrb58vhx7a7qcyyjjvm1y31 
       foreign key (action_rule_id) 
       references action_rule;

    alter table if exists case_to_process 
       add constraint FK104hqblc26y5xjehv2x8dg4k3 
       foreign key (caze_id) 
       references cases;

    alter table if exists collection_exercise 
       add constraint FKrv1ksptm37exmrbj0yutm6fla 
       foreign key (survey_id) 
       references survey;

    alter table if exists event 
       add constraint FKhgvw8xq5panw486l3varef7pk 
       foreign key (caze_id) 
       references cases;

    alter table if exists event 
       add constraint FKamu77co5m9upj2b3c1oun21er 
       foreign key (uac_qid_link_id) 
       references uac_qid_link;

    alter table if exists fulfilment_survey_email_template 
       add constraint FK7yn9o3bjnbaor6e15h1cfolj6 
       foreign key (email_template_pack_code) 
       references email_template;

    alter table if exists fulfilment_survey_email_template 
       add constraint FKtbsv7d3607v1drb4vilugvnk8 
       foreign key (survey_id) 
       references survey;

    alter table if exists fulfilment_survey_export_file_template 
       add constraint FKjit0455kk2vnpbr6cs9wxsggv 
       foreign key (export_file_template_pack_code) 
       references export_file_template;

    alter table if exists fulfilment_survey_export_file_template 
       add constraint FK5u3w6updqcovaf7p4mkl8wtub 
       foreign key (survey_id) 
       references survey;

    alter table if exists fulfilment_survey_sms_template 
       add constraint FKqpoh4166ajt0h9qxwq43asj48 
       foreign key (sms_template_pack_code) 
       references sms_template;

    alter table if exists fulfilment_survey_sms_template 
       add constraint FKi9auhquvx2gipducjycr08ti1 
       foreign key (survey_id) 
       references survey;

    alter table if exists fulfilment_to_process 
       add constraint FK9cu8edtrwirw777f4x1qej03m 
       foreign key (caze_id) 
       references cases;

    alter table if exists fulfilment_to_process 
       add constraint FKic5eccg0ms41mlfe7aqyelje9 
       foreign key (export_file_template_pack_code) 
       references export_file_template;

    alter table if exists job 
       add constraint FK6hra36ow5xge19dg3w1m7fd4r 
       foreign key (collection_exercise_id) 
       references collection_exercise;

    alter table if exists job_row 
       add constraint FK8motlil4mayre4vvdipnjime0 
       foreign key (job_id) 
       references job;

    alter table if exists uac_qid_link 
       add constraint FKngo7bm72f0focdujjma78t4nk 
       foreign key (caze_id) 
       references cases;

    alter table if exists user_group_admin 
       add constraint FKc7secqw35qa62vst6c8fvmnkc 
       foreign key (group_id) 
       references user_group;

    alter table if exists user_group_admin 
       add constraint FK44cbs8vh8ugmfgduvjb9j02kj 
       foreign key (user_id) 
       references users;

    alter table if exists user_group_member 
       add constraint FKnyc05vqmhd9hq1hv6wexhdu4t 
       foreign key (group_id) 
       references user_group;

    alter table if exists user_group_member 
       add constraint FKjbhg45atfwht2ji7xu241m4qp 
       foreign key (user_id) 
       references users;

    alter table if exists user_group_permission 
       add constraint FKao3eqnwgryopngpoq65744h2m 
       foreign key (group_id) 
       references user_group;

    alter table if exists user_group_permission 
       add constraint FKep4hjlw1esp4s8p3row2syxjq 
       foreign key (survey_id) 
       references survey;
create schema if not exists uacqid;
set schema 'uacqid';

    create table uac_qid (
       uac varchar(255) not null,
        qid varchar(255),
        unique_number serial,
        primary key (uac)
    );
create schema if not exists ddl_version;
set schema 'ddl_version';
CREATE TABLE ddl_version.patches (patch_number integer PRIMARY KEY, applied_timestamp timestamp with time zone NOT NULL);
CREATE TABLE ddl_version.version (version_tag varchar(256) PRIMARY KEY, updated_timestamp timestamp with time zone NOT NULL);

-- Version and patch number for the current ground zero,
-- NOTE: These must be updated every time the repo is tagged
INSERT INTO ddl_version.patches (patch_number, applied_timestamp) VALUES (900, current_timestamp);
INSERT INTO ddl_version.version (version_tag, updated_timestamp) VALUES ('v1.9.0', current_timestamp);
