CREATE TABLE IF NOT EXISTS public.credentials (
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
    name text,
    api_key text,
    token text,
    ip_whitelist text,
    expired_date timestamp with time zone
);
CREATE UNIQUE INDEX idx_credentials_api_key ON public.credentials USING btree (api_key);
CREATE UNIQUE INDEX idx_credentials_token ON public.credentials USING btree (token);
