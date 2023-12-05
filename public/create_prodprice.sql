CREATE PROCEDURE create_prodprice(IN param_prodid bigint, IN param_price numeric, IN param_trade_type tradetype_enum)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        IF param_price IS NULL OR param_trade_type IS NULL THEN
            RAISE EXCEPTION 'NO PRICE FOUND';
        ELSE
            INSERT INTO product_price (product_id, price, tradetype, date_created)
            VALUES (param_prodid, param_price, param_trade_type, now());
            RAISE NOTICE 'Successfully Created!';
        END IF;
    END
$$;

ALTER PROCEDURE create_prodprice(BIGINT, NUMERIC, tradetype_enum) OWNER TO postgres;

