INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES('77546d7c-8f87-4e19-8651-e53634ffcb00', true, '2026-01-28 23:54:28.541', '2026-01-28 23:54:28.541', NULL, NULL, NULL, NULL, 'Job', '', 'job', 'd512271c-5dbe-4f3b-a2c6-51ed6da3b60d', '/scheduler/job', true, 2);

INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('273b05a3-613e-45cf-9edf-f4ce5401be87', true, '2026-01-28 23:54:28.587', '2026-01-28 23:55:10.391', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', '77546d7c-8f87-4e19-8651-e53634ffcb00', '', true, true, true, true);

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