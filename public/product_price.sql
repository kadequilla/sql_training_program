CREATE TABLE public.product_price
(
    product_price_id BIGSERIAL
        PRIMARY KEY,
    product_id       BIGSERIAL
        REFERENCES public.product,
    price            NUMERIC(12, 2),
    tradetype        tradetype_enum,
    date_created     TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.product_price
    OWNER TO postgres;

