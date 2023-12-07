CREATE FUNCTION get_mac(prod_id bigint) RETURNS numeric
    LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN (
            SELECT
                coalesce(stockard.mac,0.00) as mac
            FROM stockard where stockard.stockard_id = get_stockard_bal_per_product(prod_id)
        );
    END;
$$;

ALTER FUNCTION get_mac(BIGINT) OWNER TO postgres;

