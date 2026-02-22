ALTER TABLE server_settings
    ADD COLUMN wa_scan_qr BOOLEAN DEFAULT FALSE,
    ADD COLUMN telegram_trade_id BIGINT  DEFAULT 0;


UPDATE server_settings
SET
    wa_scan_qr = FALSE,
    telegram_trade_id = 0;