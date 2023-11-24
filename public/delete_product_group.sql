CREATE PROCEDURE delete_product_group(IN param_group_id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM product_group where product_group_id = param_group_id;
        RAISE NOTICE 'Successfully Deleted!';
    END
$$;

ALTER PROCEDURE delete_product_group(BIGINT) OWNER TO postgres;

