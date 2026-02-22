DELETE FROM permissions p
USING menus m
WHERE p.menu_id = m.id
  AND m.id IN ('e1414578-ecbf-492c-b5d0-5fe515d5ebda');

DELETE FROM menus
WHERE id IN ('e1414578-ecbf-492c-b5d0-5fe515d5ebda');


DROP TABLE IF EXISTS public.schedules;