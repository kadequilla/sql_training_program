CREATE TABLE public.module
(
    module_id    BIGSERIAL
        PRIMARY KEY,
    module_code  CHAR(10) NOT NULL
        UNIQUE,
    module_name  VARCHAR(30),
    stub_curno   INTEGER                  DEFAULT 0,
    date_created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.module
    OWNER TO postgres;

