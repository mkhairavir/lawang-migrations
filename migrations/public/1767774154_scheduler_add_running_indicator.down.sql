ALTER TABLE schedulers
    DROP COLUMN is_running,
    DROP COLUMN start_at,
    DROP COLUMN finish_at,
    DROP COLUMN last_running_at,
    DROP COLUMN last_status,
    DROP COLUMN error_message;