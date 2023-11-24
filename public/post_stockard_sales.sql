CREATE PROCEDURE post_stockard_sales(IN id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO stockard (product_id, module_id, documentno, qty, amount, qty_bal, amount_bal, date_created)
        SELECT * FROM (SELECT
            sl.product_id,
            s.module_id,
            s.documentno,
            (sl.qty)*-1,
            (sl.total_amount)*-1,
            stockard.qty_bal + (sl.qty*-1) AS qty_bal,
            stockard.amt_bal + (sl.total_amount*-1) AS amount_bal,
            now() date_created

        FROM sales s
        INNER JOIN salesline sl ON s.sales_id = sl.sales_id
        INNER JOIN view_product_stockard_balance AS stockard ON stockard.product_id = sl.product_id
        WHERE s.sales_id = id)AS to_insert_stockard
        WHERE NOT exists(SELECT * FROM stockard AS existing_stockard
                      WHERE existing_stockard.product_id = to_insert_stockard.product_id
                      AND existing_stockard.documentno = to_insert_stockard.documentno
                      AND existing_stockard.module_id = to_insert_stockard.module_id);

         RAISE NOTICE 'Successfully posted stockard for SI!';
    END;
$$;

ALTER PROCEDURE post_stockard_sales(BIGINT) OWNER TO postgres;

