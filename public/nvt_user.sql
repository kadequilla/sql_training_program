CREATE TABLE public.nvt_user
(
    nvt_user_id BIGSERIAL
        PRIMARY KEY,
    firstname   VARCHAR(30),
    middlename  VARCHAR(30),
    lastname    VARCHAR(30),
    username    VARCHAR(30) NOT NULL
        UNIQUE,
    password    VARCHAR(30) NOT NULL,
    datecreated TIMESTAMP WITH TIME ZONE
);

ALTER TABLE public.nvt_user
    OWNER TO postgres;

