CREATE PROCEDURE create_transaction_line(IN id bigint, IN prod_id bigint, IN param_qty numeric, IN mod_code character, IN param_cost numeric)
    LANGUAGE plpgsql
AS
$$
    DECLARE
        var_has_duplicate_prod BOOLEAN := check_transline_duplicates(id, prod_id, mod_code);
        var_qty_bal DECIMAL := get_qtybal_per_product(prod_id);
        var_cost DECIMAL := get_mac(prod_id );
    BEGIN
        IF var_qty_bal < param_qty AND  mod_code = 'SI' THEN
            ROLLBACK;
            RAISE EXCEPTION 'Not enough inventory balance!';

        --GR
        ELSEIF mod_code = 'GR' THEN
            IF var_has_duplicate_prod THEN
                UPDATE grline up_gl
                SET qty = qty+param_qty
                WHERE gr_id = id AND product_id = prod_id;
            ELSE
                INSERT INTO grline (gr_id, product_id, qty, cost, total_amount, date_created)
                VALUES (id, prod_id, param_qty, param_cost,  param_cost*param_qty, now());
            END IF;
            RAISE NOTICE 'Successfully created GR line!';

        --SI
        ELSEIF mod_code = 'SI' THEN
            IF var_has_duplicate_prod THEN
                UPDATE salesline up_sl
                SET qty = up_sl.qty + param_qty
                WHERE sales_id = id AND product_id = prod_id;
            ELSE
                INSERT INTO salesline (sales_id, product_id, qty, cost, total_amount, date_created)
                VALUES (id, prod_id, param_qty, var_cost, var_cost*param_qty, now());
            END IF;
            RAISE NOTICE 'Successfully created sales invoice line!';
        END IF;

        CALL post_stockard_gr(id);
        --post gr price adjust if balance amount has variance upon changing product price
        CALL post_stockard_gr_adj(id);
        CALL post_stockard_sales(id);


        EXCEPTION
        WHEN OTHERS THEN
        RAISE NOTICE 'Error: %', SQLERRM;
    END
$$;

ALTER PROCEDURE create_transaction_line(BIGINT, BIGINT, NUMERIC, CHAR, NUMERIC) OWNER TO postgres;

