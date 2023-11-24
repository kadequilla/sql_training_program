CREATE FUNCTION get_stockard_bal_per_product(prod_id bigint) RETURNS bigint
    LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN (SELECT
                max(max_stockard.stockard_id)
                FROM stockard max_stockard
                WHERE max_stockard.product_id = prod_id);
    END;
$$;

ALTER FUNCTION get_stockard_bal_per_product(BIGINT) OWNER TO postgres;

