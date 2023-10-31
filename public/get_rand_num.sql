CREATE FUNCTION public.get_rand_num(from_num integer, to_num integer) RETURNS numeric
    LANGUAGE plpgsql
AS
$$
    DECLARE randnum DECIMAL;
    BEGIN
        SELECT cast(random() * to_num + from_num as DECIMAL(12,2)) into randnum;
        return randnum;
    END;
$$;

ALTER FUNCTION public.get_rand_num(INTEGER, INTEGER) OWNER TO postgres;

