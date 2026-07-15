CREATE TABLE IF NOT EXISTS public.job_histories (
    id VARCHAR(50) DEFAULT gen_random_uuid() NOT NULL,
    active boolean,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    deleted_by VARCHAR(50),
    job_id VARCHAR(100),
    code VARCHAR(50),
    run_id VARCHAR(50),
    job_status TEXT,
    error_message TEXT,
    is_running boolean,
    start_at TIMESTAMP WITH TIME ZONE,
    finish_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT job_histories_pkey PRIMARY KEY (id)
);
