BEGIN;

INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES ('83670085-3975-4d1d-9641-2fd4de59284f', true, '2025-09-10 02:03:11.675139+00', '2025-09-10 02:03:11.675139+00', NULL, NULL, NULL, NULL, 'Policy', '', 'policy', 'b4eef47b-a387-41b9-8a2f-910a72f18ad0', '/filter/policy', false, 1);
INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('a0a8dca1-51e1-4bf5-9f5a-137165b3eb48', true, '2025-09-10 02:03:11.696858+00', '2025-09-10 02:03:11.696858+00', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', '83670085-3975-4d1d-9641-2fd4de59284f', '', true, true, true, true);

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
      '83670085-3975-4d1d-9641-2fd4de59284f'
  )
  AND g.id != '194cccb1-7fef-45b1-82a7-673f5fa0242c'
  AND NOT EXISTS (
      SELECT 1 FROM permissions p
      WHERE p.user_group_id = g.id
        AND p.menu_id       = m.id
        AND p.deleted_at IS NULL
  );

CREATE TABLE IF NOT EXISTS public.policies (
    id text NOT NULL,
    active boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    created_by text,
    updated_by text,
    deleted_at timestamp with time zone,
    deleted_by text,
    name text,
    scope text,
    javascript text,
    CONSTRAINT policies_pkey PRIMARY KEY (id)
);

COMMIT;