CREATE PROCEDURE public.delete_product_group(IN param_group_id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM product_group where product_group_id = param_group_id;
    END
$$;

ALTER PROCEDURE public.delete_product_group(BIGINT) OWNER TO postgres;

