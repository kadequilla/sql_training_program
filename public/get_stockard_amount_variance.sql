CREATE FUNCTION get_stockard_amount_variance(amount_bal numeric, qty_bal numeric, mac numeric) RETURNS numeric
    LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN (
            SELECT
            amount_bal +
            (qty_bal*mac) -
            amount_bal AS amount_bal
        );
    END;
$$;

ALTER FUNCTION get_stockard_amount_variance(NUMERIC, NUMERIC, NUMERIC) OWNER TO postgres;

