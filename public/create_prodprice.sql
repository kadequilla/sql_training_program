CREATE PROCEDURE public.create_prodprice(IN param_prodid bigint, IN param_price numeric, IN param_trade_type tradetype_enum)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO product_price (product_id, price, tradetype, date_created)
        VALUES (param_prodid, param_price, param_trade_type, now());
        RAISE NOTICE 'Successfully Created!';
    END
$$;

ALTER PROCEDURE public.create_prodprice(BIGINT, NUMERIC, tradetype_enum) OWNER TO postgres;

