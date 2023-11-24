CREATE PROCEDURE delete_product(IN param_prodid bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM product where product_id = param_prodid;
        RAISE NOTICE 'Successfully Deleted!';
    END
$$;

ALTER PROCEDURE delete_product(BIGINT) OWNER TO postgres;

