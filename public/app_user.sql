create table app_user
(
    user_id  serial
        primary key,
    username varchar(50) not null
        unique,
    password varchar(50) not null
);

alter table app_user
    owner to postgres;

