CREATE TABLE stockard
(
    stockard_id  BIGSERIAL
        PRIMARY KEY,
    product_id   BIGSERIAL
        REFERENCES product,
    module_id    BIGSERIAL
        REFERENCES module,
    documentno   VARCHAR(30),
    cost         NUMERIC(12, 2),
    qty          NUMERIC(12, 2),
    amount       NUMERIC(12, 2),
    qty_bal      NUMERIC(12, 2),
    amount_bal   NUMERIC(12, 2),
    mac          NUMERIC(12, 2),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE stockard
    OWNER TO postgres;

