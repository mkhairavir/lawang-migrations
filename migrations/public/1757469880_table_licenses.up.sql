CREATE TABLE IF NOT EXISTS public.licenses (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    name text,
    license_key text,
    expired_date timestamp with time zone,
    used_by text
);
CREATE UNIQUE INDEX idx_licenses_license_key ON public.licenses USING btree (license_key);
CREATE UNIQUE INDEX idx_licenses_name ON public.licenses USING btree (name);
