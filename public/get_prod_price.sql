CREATE FUNCTION public.get_prod_price(prod_id bigint, param_tradetype tradetype_enum) RETURNS numeric
    LANGUAGE plpgsql
AS
$$
    DECLARE prod_price DECIMAL;
    BEGIN
        prod_price := (SELECT
            price
        FROM product prod
        INNER JOIN product_price prodprice ON prod.product_id = prodprice.product_id
        AND prodprice.product_price_id =(SELECT
                                        max(product_price_id)
                                        FROM product_price subQprice
                                        WHERE subQprice.product_id = prod.product_id
                                        AND subQprice.tradetype = param_tradetype)
        WHERE prod.product_id = prod_id);
        return prod_price;
    END
$$;

ALTER FUNCTION public.get_prod_price(BIGINT, tradetype_enum) OWNER TO postgres;

