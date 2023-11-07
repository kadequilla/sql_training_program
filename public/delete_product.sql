CREATE PROCEDURE public.delete_product(IN param_prodid bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM product where product_id = param_prodid;
    END
$$;

ALTER PROCEDURE public.delete_product(BIGINT) OWNER TO postgres;

