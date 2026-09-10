BEGIN;

INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES ('0e7fa3ea-3930-41db-9eaa-d7def4df3701', true, '2025-09-10 02:03:11.675139+00', '2025-09-10 02:03:11.675139+00', NULL, NULL, NULL, NULL, 'Import Swagger', 'Upload', 'import_swagger', '', '/import-swagger', true, 9);
INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('7481b555-6072-4a1d-aa45-575df767850e', true, '2025-09-10 02:03:11.696858+00', '2025-09-10 02:03:11.696858+00', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', '0e7fa3ea-3930-41db-9eaa-d7def4df3701', '', true, true, true, true);

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
  AND m.id IN (
      '0e7fa3ea-3930-41db-9eaa-d7def4df3701'
  )
  AND g.id != '194cccb1-7fef-45b1-82a7-673f5fa0242c'
  AND NOT EXISTS (
      SELECT 1 FROM permissions p
      WHERE p.user_group_id = g.id
        AND p.menu_id       = m.id
        AND p.deleted_at IS NULL
  );

COMMIT;