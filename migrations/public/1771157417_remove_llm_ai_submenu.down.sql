INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES('c997f207-a19d-498e-8092-741fa09f08d4', true, '2025-01-28 23:54:28.541', '2025-01-28 23:54:28.541', NULL, NULL, NULL, NULL, 'LLM (Chat AI)', '', 'llm_(chat)_ai', '501cb40d-d1a2-4a2a-b9d9-a483d55297ae', '/connection/llm', true, 10) ON CONFLICT (code) DO NOTHING;

INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('a6860a6e-cd80-46f9-8091-c869aa49fb8b', true, '2025-01-28 23:54:28.587', '2025-01-28 23:55:10.391', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', 'c997f207-a19d-498e-8092-741fa09f08d4', '', true, true, true, true);

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
  )