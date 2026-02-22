ALTER TABLE server_settings
    ADD COLUMN system_monitoring_notification text,
    ADD COLUMN system_notification text,
    ADD COLUMN error_notification text,
    ADD COLUMN slow_notification text,
    ADD COLUMN deployment_notification text,
    ADD COLUMN panic_notification text;

UPDATE server_settings
    SET
    system_monitoring_notification = '',
    system_notification = '',
    error_notification = '',
    slow_notification = '',
    deployment_notification = '',
    panic_notification = '';
