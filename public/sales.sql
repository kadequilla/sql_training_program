CREATE TABLE public.sales
(
    sales_id              BIGSERIAL
        PRIMARY KEY,
    module_id             BIGSERIAL
        REFERENCES public.module,
    documentno            VARCHAR(30),
    tradetype             tradetype_enum,
    proccessed_by_user_id BIGSERIAL
        REFERENCES public.nvt_user,
    date_created          TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.sales
    OWNER TO postgres;

