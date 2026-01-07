CREATE TABLE IF NOT EXISTS public.client_quota (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    client_id text,
    type text,
    quota bigint,
    valid_until timestamp with time zone
);
