create table public.product
(
    product_id       bigserial
        primary key,
    product_group_id bigserial
        references public.product_group,
    skucode          varchar(30) not null,
    barcode          varchar(30),
    product_name     text        not null,
    unit             char(10)    not null,
    date_created     timestamp with time zone default now()
);

alter table public.product
    owner to postgres;

