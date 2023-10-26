create table public.grline
(
    grline_id    bigserial
        primary key,
    gr_id        bigserial
        references public.gr,
    product_id   bigserial
        references public.product,
    qty          numeric(12, 2),
    amount       numeric(12, 2),
    total_amount numeric(12, 2),
    date_created timestamp with time zone default now()
);

alter table public.grline
    owner to postgres;

