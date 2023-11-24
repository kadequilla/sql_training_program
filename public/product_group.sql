CREATE TABLE product_group
(
    product_group_id BIGSERIAL
        PRIMARY KEY,
    group_name       VARCHAR(30) NOT NULL
        UNIQUE,
    date_created     TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE product_group
    OWNER TO postgres;

