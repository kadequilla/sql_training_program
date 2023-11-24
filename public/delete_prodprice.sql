CREATE PROCEDURE delete_prodprice(IN param_prodprice_id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM product_price WHERE product_price_id = param_prodprice_id;
        RAISE NOTICE 'Successfully Deleted!';
    END
$$;

ALTER PROCEDURE delete_prodprice(BIGINT) OWNER TO postgres;

