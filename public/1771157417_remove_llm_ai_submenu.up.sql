DELETE FROM permissions p
USING menus m
WHERE p.menu_id = m.id
  AND m.id IN ('c997f207-a19d-498e-8092-741fa09f08d4');

DELETE FROM menus
WHERE id IN ('c997f207-a19d-498e-8092-741fa09f08d4');