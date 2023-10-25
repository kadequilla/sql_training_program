create table public.module
(
    module_id    bigserial
        primary key,
    module_code  char(10) not null,
    module_name  varchar(30),
    stub_curno   integer                  default 0,
    date_created timestamp with time zone default now()
);

alter table public.module
    owner to postgres;

