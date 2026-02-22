ALTER TABLE server_settings
    ADD COLUMN wa_enable_notification BOOLEAN DEFAULT FALSE,
    ADD COLUMN wa_number VARCHAR(255) DEFAULT '',
    ADD COLUMN wa_scan_qr BOOLEAN DEFAULT FALSE,
    ADD COLUMN wa_api_key VARCHAR(255) DEFAULT '',
    ADD COLUMN telegram_enable_notification BOOLEAN DEFAULT FALSE,
    ADD COLUMN telegram_trade_id BIGINT  DEFAULT 0,
    ADD COLUMN email_enable_notification BOOLEAN DEFAULT FALSE,
    ADD COLUMN email_username VARCHAR(255) DEFAULT '',
    ADD COLUMN email_password VARCHAR(255) DEFAULT '',
    ADD COLUMN email_host VARCHAR(255) DEFAULT '',
    ADD COLUMN email_port VARCHAR(50) DEFAULT '',
    ADD COLUMN email_to VARCHAR(50) DEFAULT '',
    ADD COLUMN notification_min_http_code INT DEFAULT 0,
    ADD COLUMN notification_max_response_time INT DEFAULT 0;

UPDATE server_settings
SET
    wa_enable_notification = FALSE,
    wa_number = '',
    wa_scan_qr = FALSE,
    wa_api_key = '',
    telegram_enable_notification = FALSE,
    telegram_trade_id = 0,
    email_enable_notification = FALSE,
    email_username = '',
    email_password = '',
    email_host = '',
    email_port = '',
    email_to = '',
    notification_min_http_code = 0,
    notification_max_response_time = 0;