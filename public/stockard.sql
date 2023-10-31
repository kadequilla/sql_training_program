CREATE TABLE public.stockard
(
    stockard_id  BIGSERIAL
        PRIMARY KEY,
    product_id   BIGSERIAL
        REFERENCES public.product,
    module_id    BIGSERIAL
        REFERENCES public.module,
    documentno   VARCHAR(30),
    qty          NUMERIC(12, 2),
    amount       NUMERIC(12, 2),
    qty_bal      NUMERIC(12, 2),
    amount_bal   NUMERIC(12, 2),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.stockard
    OWNER TO postgres;

