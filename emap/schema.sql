CREATE TABLE IF NOT EXISTS ports (
    name VARCHAR(64) NOT NULL,
    wire INTEGER NOT NULL,
    direction VARCHAR(16) NOT NULL
);

CREATE TABLE IF NOT EXISTS ay_cells (
    type VARCHAR(16),
    a INTEGER,
    y INTEGER NOT NULL,
    PRIMARY KEY (type, a, y)
);

CREATE TABLE IF NOT EXISTS aby_cells (
    type VARCHAR(16),
    a INTEGER,
    b INTEGER,
    y INTEGER NOT NULL,
    PRIMARY KEY (type, a, b, y)
);

CREATE TABLE IF NOT EXISTS absy_cells (
    type VARCHAR(16),
    a INTEGER,
    b INTEGER,
    s INTEGER,
    y INTEGER NOT NULL,
    PRIMARY KEY (type, a, b, s, y)
);

CREATE TABLE IF NOT EXISTS dffes (
    d INTEGER,
    e INTEGER,
    clk INTEGER,
    q INTEGER NOT NULL,
    PRIMARY KEY (d, e, clk, q)
);

CREATE TABLE IF NOT EXISTS muxtrees (
    raw_data JSON,
    addr JSON,
    read_data INTEGER NOT NULL,
    PRIMARY KEY (raw_data, addr)
);

CREATE TABLE IF NOT EXISTS decoders (
    addr_const JSON PRIMARY KEY,
    y INTEGER NOT NULL
);