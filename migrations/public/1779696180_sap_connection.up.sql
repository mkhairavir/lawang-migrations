INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES('c3f6c451-25f2-4391-a150-69e95506d941', true, '2026-05-11 23:54:28.541', '2026-05-11 23:54:28.541', NULL, NULL, NULL, NULL, 'SAP', '', 'sap', '501cb40d-d1a2-4a2a-b9d9-a483d55297ae', '/connection/sap', false, 11);

INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('bebfec46-ae34-45e6-9266-216f05abd0d4', true, '2026-05-11 23:54:28.587', '2026-05-11 23:55:10.391', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', 'c3f6c451-25f2-4391-a150-69e95506d941', '', true, true, true, true);

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