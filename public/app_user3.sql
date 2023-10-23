create table app_user3
(
    user_id   serial
        primary key,
    username  varchar(50) not null
        unique,
    password  varchar(50) not null,
    firstname varchar(50) not null
);

alter table app_user3
    owner to postgres;

