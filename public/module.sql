CREATE TABLE module
(
    module_id    BIGSERIAL
        PRIMARY KEY,
    module_code  CHAR(10) NOT NULL
        UNIQUE,
    module_name  VARCHAR(30),
    stub_curno   INTEGER                  DEFAULT 0,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE module
    OWNER TO postgres;

