INSERT INTO public.settings (id, active, created_at, updated_at, param, value)
VALUES
    (gen_random_uuid(), true, NOW(), NOW(), 'LAWANG_APP_VERSION', 'v3.0'),
    (gen_random_uuid(), true, NOW(), NOW(), 'LAWANG_APP_YEAR', '2026')
ON CONFLICT (param) DO NOTHING;
