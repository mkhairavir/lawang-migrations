CREATE TABLE IF NOT EXISTS public.settings (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    param text,
    value text
);
CREATE UNIQUE INDEX idx_settings_param ON public.settings USING btree (param);
