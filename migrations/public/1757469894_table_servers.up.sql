CREATE TABLE IF NOT EXISTS public.servers (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    name text,
    domain text,
    code text,
    is_production boolean,
    need_restart boolean
);
CREATE UNIQUE INDEX idx_servers_code ON public.servers USING btree (code);
CREATE UNIQUE INDEX idx_servers_name ON public.servers USING btree (name);
