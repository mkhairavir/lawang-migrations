CREATE TABLE IF NOT EXISTS public.prices (
    id text NOT NULL PRIMARY KEY,
    active boolean,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone DEFAULT NULL,
    deleted_by text,
    name text,
    amount bigint NOT NULL DEFAULT 0
);

CREATE UNIQUE INDEX idx_prices_name ON public.prices (name) WHERE deleted_at IS NULL;

-- NULL = endpoint gratis
ALTER TABLE public.endpoints ADD COLUMN IF NOT EXISTS price_id text;

INSERT INTO public.menus
    (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by,
     "label", icon, code, parent_id, href, is_showable, order_number)
VALUES
    ('c1f4a5d2-93b7-4e08-8a61-2d5f7b0c9e34', true, now(), now(), NULL, NULL, NULL, NULL,
     'Pricing', 'Wallet', 'prices', '', '/prices', true, 9);

INSERT INTO public.permissions
    (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by,
     user_group_id, menu_id, permission_id, writable, viewable, editable, deletable)
VALUES
    ('e8b2c740-5a19-4f36-9c72-1b0d4a6e8f52', true, now(), now(), NULL, NULL, NULL, NULL,
     '194cccb1-7fef-45b1-82a7-673f5fa0242c', 'c1f4a5d2-93b7-4e08-8a61-2d5f7b0c9e34', '',
     true, true, true, true);

INSERT INTO public.permissions
    (id, active, user_group_id, menu_id, viewable, writable, editable, deletable, created_at, updated_at)
SELECT
    gen_random_uuid()::text,
    true,
    g.id,
    m.id,
    false,
    false,
    false,
    false,
    now(),
    now()
FROM user_groups g
CROSS JOIN menus m
WHERE g.deleted_at IS NULL
  AND m.deleted_at IS NULL
  AND m.id = 'c1f4a5d2-93b7-4e08-8a61-2d5f7b0c9e34'
  AND g.id != '194cccb1-7fef-45b1-82a7-673f5fa0242c'
  AND NOT EXISTS (
      SELECT 1 FROM permissions p
      WHERE p.user_group_id = g.id
        AND p.menu_id       = m.id
        AND p.deleted_at IS NULL
  );
