CREATE TABLE IF NOT EXISTS public.schedules (
    id varchar(50) DEFAULT gen_random_uuid() NOT NULL,
    active boolean,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    deleted_by VARCHAR(50),
    name VARCHAR(100),
    code VARCHAR(50),
    cron_syntax  VARCHAR(64),
    description TEXT,
    CONSTRAINT schedules_pkey PRIMARY KEY (id)
);

INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES('e1414578-ecbf-492c-b5d0-5fe515d5ebda', true, '2026-01-27 23:54:28.541', '2026-01-27 23:54:28.541', NULL, NULL, NULL, NULL, 'Schedule', '', 'schedule', 'd512271c-5dbe-4f3b-a2c6-51ed6da3b60d', '/scheduler/schedule', true, 1);

INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('8ede776b-88f4-4d05-8716-985e52c6f9a5', true, '2026-01-27 23:54:28.587', '2026-01-27 23:55:10.391', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', 'e1414578-ecbf-492c-b5d0-5fe515d5ebda', '', true, true, true, true);

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