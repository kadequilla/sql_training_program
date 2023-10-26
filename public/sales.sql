create table public.sales
(
    sales_id              bigserial
        primary key,
    module_id             bigserial
        references public.module,
    documentno            varchar(30),
    proccessed_by_user_id bigserial
        references public.nvt_user,
    date_created          timestamp with time zone default now()
);

alter table public.sales
    owner to postgres;

