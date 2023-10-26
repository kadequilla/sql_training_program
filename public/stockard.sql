create table public.stockard
(
    stockard_id  bigserial
        primary key,
    module_id    bigserial
        references public.module,
    documentno   varchar(30),
    qty          numeric(12, 2),
    amount       numeric(12, 2),
    qty_bal      numeric(12, 2),
    amount_bal   numeric(12, 2),
    date_created timestamp with time zone default now()
);

alter table public.stockard
    owner to postgres;

