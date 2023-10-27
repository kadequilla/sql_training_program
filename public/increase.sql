CREATE PROCEDURE public.increase(INOUT i integer)
    LANGUAGE plpgsql
AS
$$
begin
    i = get_rand_num(1,1000);
    return;
end ;
$$;

ALTER PROCEDURE public.increase(INOUT INTEGER) OWNER TO postgres;

