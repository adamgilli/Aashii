CREATE TABLE IF NOT EXISTS users (
    user_id BIGINT PRIMARY KEY,
    username TEXT,
    full_name TEXT NOT NULL,
    blocked BOOL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS from_admins (
    message_id INTEGER NOT NULL,
    user_id BIGINT REFERENCES users,
    dest_message_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS from_users (
    user_id BIGINT REFERENCES users,
    message_id INTEGER NOT NULL,
    dest_message_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS invite_links (
    user_id BIGINT REFERENCES users,
    message_id INTEGER NOT NULL,
    links_count INTEGER NOT NULL DEFAULT 1,
    pending BOOL NOT NULL DEFAULT FALSE
);
