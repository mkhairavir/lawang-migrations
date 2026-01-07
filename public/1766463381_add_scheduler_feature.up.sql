CREATE TABLE IF NOT EXISTS public.schedulers (
    id varchar(50) DEFAULT gen_random_uuid() NOT NULL,
    active boolean,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE,
    created_by TEXT,
    updated_by TEXT,
    deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    deleted_by TEXT,
    name VARCHAR(50),
    cron_syntax  VARCHAR(64),
    script TEXT,
    timeout INT NOT NULL,
    pin_job BOOLEAN DEFAULT FALSE,
    overlap_skip BOOLEAN DEFAULT TRUE,
    next_scheduler_id varchar(50) NULL
);

ALTER TABLE ONLY public.schedulers
    ADD CONSTRAINT schedulers_pkey PRIMARY KEY (id);


ALTER TABLE public.server_settings
    ADD COLUMN log_scheduler_path TEXT DEFAULT '/var/log/lawang/lawang_schedulers.log',
    ADD COLUMN log_scheduler_max_size BIGINT DEFAULT 1024,
    ADD COLUMN log_scheduler_max_backups BIGINT DEFAULT 3,
    ADD COLUMN log_scheduler_max_age BIGINT DEFAULT 7,
    ADD COLUMN log_scheduler_compress BOOLEAN DEFAULT TRUE;

ALTER TABLE public.servers
    ADD COLUMN set_as_scheduler BOOLEAN DEFAULT FALSE;