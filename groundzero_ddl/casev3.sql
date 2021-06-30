
    create table cases (
       id uuid not null,
        address_invalid BOOLEAN DEFAULT false not null,
        case_ref int8,
        created_at timestamp with time zone,
        last_updated_at timestamp with time zone,
        receipt_received BOOLEAN DEFAULT false not null,
        refusal_received varchar(255),
        sample jsonb,
        secret_sequence_number serial,
        survey_launched BOOLEAN DEFAULT false not null,
        collection_exercise_id uuid,
        primary key (id)
    );

    create table case_to_process (
       id  bigserial not null,
        batch_id uuid,
        batch_quantity int4 not null,
        caze_id uuid,
        wave_of_contact_id uuid,
        primary key (id)
    );

    create table cluster_leader (
       id uuid not null,
        host_last_seen_alive_at timestamp with time zone,
        host_name varchar(255),
        primary key (id)
    );

    create table collection_exercise (
       id uuid not null,
        name varchar(255),
        survey_id uuid,
        primary key (id)
    );

    create table event (
       id uuid not null,
        event_channel varchar(255),
        event_date timestamp with time zone,
        event_description varchar(255),
        event_payload jsonb,
        event_source varchar(255),
        event_transaction_id uuid,
        event_type varchar(255),
        message_timestamp Timestamp with time zone,
        rm_event_processed timestamp with time zone,
        caze_id uuid,
        uac_qid_link_id uuid,
        primary key (id)
    );

    create table fulfilment_next_trigger (
       id uuid not null,
        trigger_date_time timestamp with time zone,
        primary key (id)
    );

    create table fulfilment_template (
       fulfilment_code varchar(255) not null,
        print_supplier varchar(255),
        template jsonb,
        primary key (fulfilment_code)
    );

    create table fulfilment_to_process (
       id  bigserial not null,
        batch_id uuid,
        batch_quantity int4,
        fulfilment_code varchar(255),
        caze_id uuid,
        primary key (id)
    );

    create table job (
       id uuid not null,
        created_at timestamp with time zone,
        created_by varchar(255),
        fatal_error_description varchar(255),
        file_id uuid,
        file_name varchar(255),
        file_row_count int4,
        job_status varchar(255),
        last_updated_at timestamp with time zone,
        processing_row_number int4,
        staging_row_number int4,
        collection_exercise_id uuid,
        primary key (id)
    );

    create table job_row (
       id uuid not null,
        job_row_status varchar(255),
        original_row_data bytea,
        original_row_line_number int4,
        row_data jsonb,
        validation_error_descriptions varchar(255),
        job_id uuid,
        primary key (id)
    );

    create table survey (
       id uuid not null,
        name varchar(255),
        sample_validation_rules jsonb,
        primary key (id)
    );

    create table uac_qid_link (
       id uuid not null,
        active BOOLEAN DEFAULT true not null,
        created_at timestamp with time zone,
        last_updated_at timestamp with time zone,
        qid varchar(255),
        uac varchar(255),
        caze_id uuid,
        primary key (id)
    );

    create table users (
       id uuid not null,
        email varchar(255),
        primary key (id)
    );

    create table users_survey (
       user_id uuid not null,
        surveys_id uuid not null
    );

    create table wave_of_contact (
       id uuid not null,
        classifiers bytea not null,
        has_triggered BOOLEAN DEFAULT false not null,
        pack_code varchar(255),
        print_supplier varchar(255),
        template jsonb,
        trigger_date_time timestamp with time zone,
        type varchar(255),
        collection_exercise_id uuid,
        primary key (id)
    );
create index cases_case_ref_idx on cases (case_ref);

    alter table if exists users_survey 
       add constraint UK_6m5sfm18vispsa7os6vhrt09r unique (surveys_id);

    alter table if exists cases 
       add constraint FKrl77p02uu7a253tn2ro5mitv5 
       foreign key (collection_exercise_id) 
       references collection_exercise;

    alter table if exists case_to_process 
       add constraint FK104hqblc26y5xjehv2x8dg4k3 
       foreign key (caze_id) 
       references cases;

    alter table if exists case_to_process 
       add constraint FKao8gf723128xjhos3vjh2h475 
       foreign key (wave_of_contact_id) 
       references wave_of_contact;

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

    alter table if exists fulfilment_to_process 
       add constraint FK9cu8edtrwirw777f4x1qej03m 
       foreign key (caze_id) 
       references cases;

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

    alter table if exists users_survey 
       add constraint FKlru4axdl8yjkpa9srv4xu814s 
       foreign key (surveys_id) 
       references survey;

    alter table if exists users_survey 
       add constraint FKedd4y3ae5jnsinluncc2e22u2 
       foreign key (user_id) 
       references users;

    alter table if exists wave_of_contact 
       add constraint FKcdvs1vhl3wiurb8w4o1h67gib 
       foreign key (collection_exercise_id) 
       references collection_exercise;
