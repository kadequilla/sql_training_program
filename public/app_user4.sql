create table app_user4
(
    user_id   serial
        primary key,
    username  varchar(50) not null
        unique,
    password  varchar(50) not null,
    firstname varchar(50) not null
);

alter table app_user4
    owner to postgres;

