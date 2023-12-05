CREATE VIEW view_stockard_history_per_transaction
            (product_id, skucode, product_name, documentno, qty, amount, qty_bal, amount_bal, date_created, islatest) AS
SELECT product.product_id,
       product.skucode,
       product.product_name,
       stockard.documentno,
       stockard.qty,
       TO_CHAR(stockard.amount, 'FM999,999,999.00'::TEXT)     AS amount,
       stockard.qty_bal,
       TO_CHAR(stockard.amount_bal, 'FM999,999,999.00'::TEXT) AS amount_bal,
       TO_CHAR(stockard.date_created, 'YYYY-MM-DD'::TEXT)     AS date_created,
       stockard.stockard_id = latest_stockard.stockard_id     AS islatest
FROM stockard
         JOIN product ON stockard.product_id = product.product_id
         LEFT JOIN stockard latest_stockard
                   ON latest_stockard.stockard_id = get_stockard_bal_per_product(product.product_id)
ORDER BY product.product_id, stockard.stockard_id;

ALTER TABLE view_stockard_history_per_transaction
    OWNER TO postgres;

