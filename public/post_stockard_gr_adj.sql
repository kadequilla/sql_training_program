CREATE PROCEDURE post_stockard_gr_adj(IN id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO stockard (product_id, module_id, documentno, qty, cost, amount, qty_bal, amount_bal, mac, date_created)
        SELECT * FROM (
            SELECT
            grl.product_id,
            gr.module_id,
            concat(gr.documentno,'-ADJ') as documentno,
            0.00 as qty,
            0.00 as cost,
            (stockard.qty_bal*stockard.mac) - stockard.amount_bal as amount,
            stockard.qty_bal AS qty_bal,
            get_stockard_amount_variance(stockard.amount_bal,stockard.qty_bal,stockard.mac) AS amount_bal,
            stockard.mac,
            now() as date_created
            FROM gr
            INNER JOIN grline grl ON gr.gr_id = grl.gr_id
            INNER JOIN stockard on stockard_id = get_stockard_bal_per_product(grl.product_id)
            WHERE gr.gr_id = id
            AND (stockard.qty_bal*stockard.mac) - stockard.amount_bal != 0
        )AS to_insert_stockard;

         RAISE NOTICE 'Successfully posted stockard for GR-ADJ!';
    END;
$$;

ALTER PROCEDURE post_stockard_gr_adj(BIGINT) OWNER TO postgres;

