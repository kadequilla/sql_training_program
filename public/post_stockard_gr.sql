CREATE PROCEDURE post_stockard_gr(IN id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO stockard (product_id, module_id, documentno, qty, amount, qty_bal, amount_bal, date_created)
        SELECT * FROM (SELECT
            grl.product_id,
            gr.module_id,
            gr.documentno,
            grl.qty,
            grl.total_amount,
            stockard.qty_bal + abs(grl.qty) AS qty_bal,
            stockard.amt_bal + abs(grl.total_amount) AS amount_bal,
            now() date_created

        FROM gr
        INNER JOIN grline grl ON gr.gr_id = grl.gr_id
        INNER JOIN view_product_stockard_balance AS stockard ON stockard.product_id = grl.product_id
        WHERE gr.gr_id = id)AS to_insert_stockard
        WHERE NOT exists(SELECT * FROM stockard AS existing_stockard
                      WHERE existing_stockard.product_id = to_insert_stockard.product_id
                      AND existing_stockard.documentno = to_insert_stockard.documentno
                      AND existing_stockard.module_id = to_insert_stockard.module_id);

         RAISE NOTICE 'Successfully posted stockard for GR!';
    END;
$$;

ALTER PROCEDURE post_stockard_gr(BIGINT) OWNER TO postgres;

