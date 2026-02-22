CREATE TABLE IF NOT EXISTS public.menus (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    label text,
    icon text,
    code text,
    parent_id text,
    href text,
    is_showable boolean,
    order_number bigint
);
CREATE UNIQUE INDEX idx_menus_code ON public.menus USING btree (code);
