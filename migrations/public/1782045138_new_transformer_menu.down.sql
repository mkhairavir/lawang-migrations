BEGIN;

DROP INDEX IF EXISTS idx_transformers_type;

UPDATE transformers
SET request_transformer = response_transformer;

ALTER TABLE transformers DROP COLUMN IF EXISTS response_transformer;
ALTER TABLE transformers DROP COLUMN IF EXISTS type;

ALTER TABLE transformers RENAME COLUMN request_transformer TO transformer;

ALTER TABLE transformers RENAME TO response_transformers;


-- delete req & log transform perms and menus
DELETE FROM permissions p USING menus m WHERE p.menu_id = m.id AND m.id IN ('8389c371-e2b5-4f13-a709-7960fa05ccf2','c377f29b-f743-444d-83f2-d11001672a7e');
DELETE FROM menus WHERE id IN ('8389c371-e2b5-4f13-a709-7960fa05ccf2', 'c377f29b-f743-444d-83f2-d11001672a7e');
UPDATE public.menus SET label='Response Transformation', code = 'response_transformation' WHERE id = '15c7fa0f-ffcd-45f6-84c1-9e2c7c4a98c2';

UPDATE public.menus SET order_number= 4 WHERE id='f94f1f34-5c39-4877-9bbd-1d240e78a498';

COMMIT;