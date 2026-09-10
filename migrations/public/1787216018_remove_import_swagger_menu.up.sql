BEGIN;

DELETE FROM permissions p USING menus m WHERE p.menu_id = m.id AND m.id IN ('0e7fa3ea-3930-41db-9eaa-d7def4df3701');
DELETE FROM public.menus WHERE id='0e7fa3ea-3930-41db-9eaa-d7def4df3701';

COMMIT;