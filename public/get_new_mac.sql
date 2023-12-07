CREATE FUNCTION get_new_mac(prod_id bigint, new_cost numeric, new_qty numeric) RETURNS numeric
    LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN (
            -- MAC = (Previous MAC × previous quantity + new purchase cost*qty) / total quantity
            coalesce(
                (SELECT
                (coalesce(mac, 0.00)*coalesce(qty_bal,0.00) + (new_cost*new_qty)) / (coalesce(qty_bal,0.00)+new_qty)
                FROM stockard where stockard_id = get_stockard_bal_per_product(prod_id)),
                new_cost
            )
        );
    END;
$$;

ALTER FUNCTION get_new_mac(BIGINT, NUMERIC, NUMERIC) OWNER TO postgres;

