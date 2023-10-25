create table public.nvt_user
(
    nvt_user_id bigserial
        primary key,
    firstname   varchar(30),
    middlename  varchar(30),
    lastname    varchar(30),
    username    varchar(30) not null
        unique,
    password    varchar(30) not null,
    datecreated timestamp with time zone
);

alter table public.nvt_user
    owner to postgres;

