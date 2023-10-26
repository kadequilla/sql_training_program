create table public.salesline
(
    salesline_id bigserial
        primary key,
    sales_id     bigserial
        references public.sales,
    product_id   bigserial
        references public.product,
    qty          numeric(12, 2),
    amount       numeric(12, 2),
    total_amount numeric(12, 2),
    date_created timestamp with time zone default now()
);

alter table public.salesline
    owner to postgres;

