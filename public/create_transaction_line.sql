CREATE PROCEDURE public.create_transaction_line(IN id bigint, IN prod_id bigint, IN param_qty numeric, IN mod_code character)
    LANGUAGE plpgsql
AS
$$
    DECLARE
        var_trade_type tradetype_enum := (get_one_tradetype_of_transactions(id,mod_code));
        var_amount DECIMAL := get_prod_price(prod_id,var_trade_type);
        var_total_amount DECIMAL := var_amount * param_qty;
        var_has_duplicate_prod BOOLEAN := check_transline_duplicates(id, prod_id, mod_code);
    BEGIN
        IF mod_code = 'GR' THEN
            IF var_has_duplicate_prod THEN
                UPDATE grline up_gl
                SET qty = qty+param_qty
                WHERE gr_id = id AND product_id = prod_id;
            ELSE
                INSERT INTO grline (gr_id, product_id, qty, amount, total_amount, date_created)
                VALUES (id, prod_id, param_qty, var_amount, var_total_amount, now());
            END IF;
        ELSEIF mod_code = 'SI' THEN
            IF var_has_duplicate_prod THEN
                UPDATE salesline up_sl
                SET qty = up_sl.qty + param_qty
                WHERE sales_id = id AND product_id = prod_id;
            ELSE
                INSERT INTO salesline (sales_id, product_id, qty, amount, total_amount, date_created)
                VALUES (id, prod_id, param_qty, var_amount, var_total_amount, now());
            END IF;
        END IF;

        EXCEPTION
        WHEN OTHERS THEN
        RAISE NOTICE 'Error: %', SQLERRM;
    END
$$;

ALTER PROCEDURE public.create_transaction_line(BIGINT, BIGINT, NUMERIC, CHAR) OWNER TO postgres;

