CREATE TABLE public.product
(
    product_id       BIGSERIAL
        PRIMARY KEY,
    product_group_id BIGSERIAL
        REFERENCES public.product_group,
    skucode          VARCHAR(30) NOT NULL
        UNIQUE,
    barcode          VARCHAR(30),
    product_name     TEXT        NOT NULL,
    unit             CHAR(10)    NOT NULL,
    date_created     TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.product
    OWNER TO postgres;

