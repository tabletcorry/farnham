CREATE SCHEMA core;

SET search_path = 'core'

CREATE TYPE op_mode AS ENUM ('nfm', 'am');
CREATE TYPE tone_mode AS ENUM ('tone');
CREATE TYPE dcs_polarity AS ENUM ('normal', 'invert', 'both');
CREATE TYPE tx_power AS ENUM('low1', 'low2', 'low3', 'high');
CREATE TYPE vibrator AS ENUM('busy', 'signaling');

CREATE TABLE channels (
    id BIGSERIAL PRIMARY KEY,
    rx NUMERIC(8,5) NOT NULL,
    tx NUMERIC(8,5) NOT NULL,
    offset NUMERIC(8,5),
    op_mode op_mode NOT NULL DEFAULT 'NFM',
    full_name TEXT,
    short_name VARCHAR(17),
    description TEXT,
    tone_mode tone_mode,
    ctcss NUMERIC(4,1) NOT NULL DEFAULT 81.5,
    dcs SMALLINT NOT NULL DEFAULT 23,
    dcs_polarity_rx dcs_polarity NOT NULL DEFAULT 'normal',
    dcs_polarity_tx dcs_polarity NOT NULL DEFAULT 'normal',
    user_ctcss SMALLINT NOT NULL DEFAULT 1600,
    tx_power tx_power NOT NULL DEFAULT 'high',
    skip BOOLEAN NOT NULL DEFAULT FALSE,
    step NUMERIC(5,2),
    s_meter_sql SMALLINT,
    bell BOOLEAN NOT NULL DEFAULT FALSE,
    vibrator vibrator,
    harf_dev BOOLEAN NOT NULL DEFAULT FALSE,
    clock_shift BOOLEAN NOT NULL DEFAULT FALSE,
    comment TEXT
);


