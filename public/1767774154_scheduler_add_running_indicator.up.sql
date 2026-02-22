ALTER TABLE schedulers
    ADD COLUMN is_running boolean,
    ADD COLUMN start_at TIMESTAMP WITH TIME ZONE,
    ADD COLUMN finish_at TIMESTAMP WITH TIME ZONE,
    ADD COLUMN last_running_at TIMESTAMP WITH TIME ZONE,
    ADD COLUMN last_status varchar(50),
    ADD COLUMN error_message text;