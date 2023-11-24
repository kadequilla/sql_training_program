CREATE PROCEDURE update_prodprice(IN param_prodprice_id bigint, IN param_prodid bigint, IN param_price numeric, IN param_trade_type tradetype_enum)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        UPDATE product_price
        SET product_id = param_prodid,
            price = param_price,
            tradetype = param_trade_type
        WHERE product_price_id = param_prodprice_id;
        RAISE NOTICE 'Successfully Updated!';
    END
$$;

ALTER PROCEDURE update_prodprice(BIGINT, BIGINT, NUMERIC, tradetype_enum) OWNER TO postgres;

