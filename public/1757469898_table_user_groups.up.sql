CREATE TABLE IF NOT EXISTS public.user_groups (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    name text,
    code text
);
CREATE UNIQUE INDEX idx_user_groups_code ON public.user_groups USING btree (code);
