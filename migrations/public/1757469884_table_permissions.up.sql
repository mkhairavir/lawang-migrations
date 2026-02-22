CREATE TABLE IF NOT EXISTS public.permissions (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    user_group_id text,
    menu_id text,
    permission_id text,
    writable boolean,
    viewable boolean,
    editable boolean,
    deletable boolean
);
