CREATE TABLE IF NOT EXISTS public.versions (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    name text,
    prefix text
);
CREATE UNIQUE INDEX idx_versions_prefix ON public.versions USING btree (prefix);
