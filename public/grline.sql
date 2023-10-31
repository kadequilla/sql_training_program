CREATE TABLE public.grline
(
    grline_id    BIGSERIAL
        PRIMARY KEY,
    gr_id        BIGSERIAL
        REFERENCES public.gr,
    product_id   BIGSERIAL
        REFERENCES public.product,
    qty          NUMERIC(12, 2),
    amount       NUMERIC(12, 2),
    total_amount NUMERIC(12, 2),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.grline
    OWNER TO postgres;

