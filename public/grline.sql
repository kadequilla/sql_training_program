CREATE TABLE grline
(
    grline_id    BIGSERIAL
        PRIMARY KEY,
    gr_id        BIGSERIAL
        REFERENCES gr,
    product_id   BIGSERIAL
        REFERENCES product,
    qty          NUMERIC(12, 2),
    amount       NUMERIC(12, 2),
    total_amount NUMERIC(12, 2),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE grline
    OWNER TO postgres;

