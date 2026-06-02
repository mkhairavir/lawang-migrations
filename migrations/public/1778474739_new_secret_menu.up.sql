CREATE TABLE IF NOT EXISTS public.secrets (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    active BOOLEAN,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE,
    created_by TEXT,
    updated_by TEXT,
    deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    deleted_by TEXT,
    name VARCHAR(50),
    code VARCHAR(50),
    client_id VARCHAR(50),
    use_hsm BOOLEAN DEFAULT FALSE,
    bit_long INTEGER,
    secret VARCHAR(128) NOT NULL 
);

INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES('a175b88e-1611-444f-9532-8390172bb335', true, '2026-05-11 23:54:28.541', '2026-05-11 23:54:28.541', NULL, NULL, NULL, NULL, 'Secret', 'KeyRound', 'secret', '', '/secret', true, 8);

INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('f0d69320-30bd-46d9-9dda-714b479a523e', true, '2026-05-11 23:54:28.587', '2026-05-11 23:55:10.391', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', 'a175b88e-1611-444f-9532-8390172bb335', '', true, true, true, true);

INSERT INTO permissions (
    id,
    active,
    user_group_id,
    menu_id,
    viewable,
    writable,
    editable,
    deletable,
    created_at,
    updated_at
)
SELECT
    gen_random_uuid(),
    true,
    g.id,
    m.id,
    false,
    false,
    false,
    false,
    NOW(),
    NOW()
FROM user_groups g
CROSS JOIN menus m
WHERE g.deleted_at IS NULL
  AND m.deleted_at IS NULL
  AND NOT EXISTS (
      SELECT 1
      FROM permissions p
      WHERE p.user_group_id = g.id
        AND p.menu_id       = m.id
        AND p.deleted_at IS NULL
  );