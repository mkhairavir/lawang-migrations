DELETE FROM permissions p
USING menus m
WHERE p.menu_id = m.id
  AND m.id IN ('353eaa19-f6c2-4030-b952-34fa773ada1f');

DELETE FROM public.menus
WHERE code='353eaa19-f6c2-4030-b952-34fa773ada1f';