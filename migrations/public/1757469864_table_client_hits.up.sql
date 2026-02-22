CREATE TABLE IF NOT EXISTS public.client_hits (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    client_id text,
    gateway_id text
);
