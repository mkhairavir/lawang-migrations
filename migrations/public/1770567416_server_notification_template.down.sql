ALTER TABLE server_settings
    DROP COLUMN IF EXISTS email_notification_template,
    DROP COLUMN IF EXISTS telegram_notification_template,
    DROP COLUMN IF EXISTS wa_notification_template;