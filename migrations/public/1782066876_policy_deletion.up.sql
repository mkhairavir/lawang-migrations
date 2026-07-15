BEGIN;

DROP TABLE public.policies; 

DELETE FROM permissions p USING menus m WHERE p.menu_id = m.id AND m.id IN ('83670085-3975-4d1d-9641-2fd4de59284f');
DELETE FROM public.menus WHERE id='83670085-3975-4d1d-9641-2fd4de59284f';

COMMIT;