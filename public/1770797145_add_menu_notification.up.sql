INSERT INTO public.menus
(id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number)
VALUES('353eaa19-f6c2-4030-b952-34fa773ada1f', true, '2025-12-03 15:23:51.847', '2025-12-03 15:23:51.847', NULL, NULL, NULL, NULL, 'Notification', '', 'notification', '5f809d2a-f50d-445b-ae58-77c89d3a1876', '/setting/notification', false, 5) ON CONFLICT (code) DO NOTHING;


INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('3fd70b29-e91d-41db-8adb-11ccc4b35858', true, '2026-01-28 23:54:28.587', '2026-01-28 23:55:10.391', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', '353eaa19-f6c2-4030-b952-34fa773ada1f', '', true, true, true, true);

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
