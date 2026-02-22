ALTER TABLE server_settings
    ADD COLUMN wa_recipient_number VARCHAR(20) DEFAULT '';

UPDATE server_settings
SET
    wa_recipient_number = '';