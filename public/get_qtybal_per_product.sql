CREATE FUNCTION public.get_qtybal_per_product(prod_id bigint) RETURNS numeric
    LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN (SELECT qty_bal FROM view_product_stockard_balance WHERE product_id = prod_id);
    END;
$$;

ALTER FUNCTION public.get_qtybal_per_product(BIGINT) OWNER TO postgres;

