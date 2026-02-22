DELETE FROM permissions p
USING menus m
WHERE p.menu_id = m.id
  AND m.id IN ('77546d7c-8f87-4e19-8651-e53634ffcb00');

DELETE FROM menus
WHERE id IN ('77546d7c-8f87-4e19-8651-e53634ffcb00');