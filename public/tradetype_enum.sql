create type public.tradetype_enum as enum ('WHOLESALE', 'RETAIL');

alter type public.tradetype_enum owner to postgres;

