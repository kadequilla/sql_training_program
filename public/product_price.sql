create table public.product_price
(
    product_price_id bigserial
        primary key,
    product_id       bigserial
        references public.product,
    price            numeric(12, 2),
    tradetype        tradetype_enum,
    date_created     timestamp with time zone default now()
);

alter table public.product_price
    owner to postgres;

