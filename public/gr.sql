CREATE TABLE gr
(
    gr_id                 BIGSERIAL
        PRIMARY KEY,
    module_id             BIGSERIAL
        REFERENCES module,
    documentno            VARCHAR(30)
        UNIQUE,
    tradetype             tradetype_enum,
    proccessed_by_user_id BIGSERIAL
        REFERENCES nvt_user,
    date_created          TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE gr
    OWNER TO postgres;

