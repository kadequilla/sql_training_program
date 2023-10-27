CREATE TABLE public.salesline
(
    salesline_id BIGSERIAL
        PRIMARY KEY,
    sales_id     BIGSERIAL
        REFERENCES public.sales,
    product_id   BIGSERIAL
        REFERENCES public.product,
    qty          NUMERIC(12, 2),
    amount       NUMERIC(12, 2),
    total_amount NUMERIC(12, 2),
    date_created TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.salesline
    OWNER TO postgres;

