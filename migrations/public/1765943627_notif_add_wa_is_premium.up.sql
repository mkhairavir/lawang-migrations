ALTER TABLE server_settings
    ADD COLUMN wa_is_premium BOOLEAN DEFAULT FALSE;

UPDATE server_settings
SET
    wa_is_premium = FALSE;