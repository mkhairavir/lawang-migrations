CREATE TABLE IF NOT EXISTS public.admins (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    username text,
    password text,
    full_name text,
    last_login timestamp with time zone,
    user_group_id text
);
CREATE UNIQUE INDEX idx_admins_username ON public.admins USING btree (username);
