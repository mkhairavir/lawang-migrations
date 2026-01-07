CREATE TABLE IF NOT EXISTS public.request_validators (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    name text,
    validator text
);
