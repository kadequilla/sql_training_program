create table public.product_group
(
    product_group_id bigserial
        primary key,
    group_name       varchar(30) not null
        unique,
    date_created     timestamp with time zone default now()
);

alter table public.product_group
    owner to postgres;

