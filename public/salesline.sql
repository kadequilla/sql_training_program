CREATE TABLE salesline
(
    salesline_id BIGSERIAL
        PRIMARY KEY,
    sales_id     BIGSERIAL
        REFERENCES sales,
    product_id   BIGSERIAL
        REFERENCES product,
    qty          NUMERIC(12, 2),
    cost         NUMERIC(12, 2),
    total_amount NUMERIC(12, 2),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE salesline
    OWNER TO postgres;

