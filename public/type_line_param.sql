CREATE TYPE type_line_param AS
(
    id        BIGINT,
    prod_id   BIGINT,
    param_qty NUMERIC,
    mod_code  CHAR
);

ALTER TYPE type_line_param OWNER TO postgres;

