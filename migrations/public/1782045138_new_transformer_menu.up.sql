BEGIN;

-- transformer domain

ALTER TABLE response_transformers RENAME TO transformers;

ALTER TABLE transformers RENAME COLUMN transformer TO request_transformer;

ALTER TABLE transformers ADD COLUMN response_transformer TEXT;

ALTER TABLE transformers ADD COLUMN type TEXT;

UPDATE transformers
SET
    response_transformer = request_transformer,
    request_transformer  = NULL,
    type            = 'response';

ALTER TABLE transformers ALTER COLUMN type SET NOT NULL;

CREATE INDEX idx_transformers_type ON transformers (type);

-- menus domain
INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES('8389c371-e2b5-4f13-a709-7960fa05ccf2', true, '2026-06-18 23:54:28.541', '2026-06-18 23:54:28.541', NULL, NULL, NULL, NULL, 'Request Transformer', '', 'request_transformer', 'b4eef47b-a387-41b9-8a2f-910a72f18ad0', '/filter/req-trans', false, 2);
INSERT INTO public.menus (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, "label", icon, code, parent_id, href, is_showable, order_number) VALUES('c377f29b-f743-444d-83f2-d11001672a7e', true, '2026-06-18 23:55:28.541', '2026-06-18 23:55:28.541', NULL, NULL, NULL, NULL, 'Log Transformer', '', 'log_transformer', 'b4eef47b-a387-41b9-8a2f-910a72f18ad0', '/filter/log-trans', false, 4);
UPDATE public.menus SET order_number= 1 WHERE id='f94f1f34-5c39-4877-9bbd-1d240e78a498';
UPDATE public.menus SET label='Response Transformer', code = 'response_transformer' WHERE id = '15c7fa0f-ffcd-45f6-84c1-9e2c7c4a98c2';

-- permission domain
INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('d948edc4-2e29-4327-a70b-b7074fec9fe1', true, '2026-06-18 23:54:28.587', '2026-06-18 23:55:10.391', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', '8389c371-e2b5-4f13-a709-7960fa05ccf2', '', true, true, true, true);
INSERT INTO public.permissions (id, active, created_at, updated_at, created_by, updated_by, deleted_at, deleted_by, user_group_id, menu_id, permission_id, writable, viewable, editable, deletable) VALUES('d9bf759b-32ac-432f-87b7-11d501c19970', true, '2026-06-18 23:55:28.587', '2026-06-18 23:56:10.391', NULL, NULL, NULL, NULL, '194cccb1-7fef-45b1-82a7-673f5fa0242c', 'c377f29b-f743-444d-83f2-d11001672a7e', '', true, true, true, true);

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
      '8389c371-e2b5-4f13-a709-7960fa05ccf2',
      'c377f29b-f743-444d-83f2-d11001672a7e'
  )
  AND g.id != '194cccb1-7fef-45b1-82a7-673f5fa0242c'
  AND NOT EXISTS (
      SELECT 1 FROM permissions p
      WHERE p.user_group_id = g.id
        AND p.menu_id       = m.id
        AND p.deleted_at IS NULL
  );


COMMIT;