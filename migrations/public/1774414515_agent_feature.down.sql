DELETE FROM permissions p
USING menus m
WHERE p.menu_id = m.id
  AND m.id IN ('f1a93524-5bc0-4916-9d7e-6cb39b207546');

DELETE FROM menus
WHERE id IN ('f1a93524-5bc0-4916-9d7e-6cb39b207546');

DROP TABLE IF EXISTS public.agents;