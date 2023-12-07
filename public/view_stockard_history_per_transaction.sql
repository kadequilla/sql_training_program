CREATE VIEW view_stockard_history_per_transaction
            (product_id, skucode, product_name, documentno, cost, qty, amount, qty_bal, amount_bal, mac, date_created,
             islatest) AS
SELECT product.product_id,
       product.skucode,
       product.product_name,
       stockard.documentno,
       stockard.cost,
       stockard.qty,
       stockard.amount,
       stockard.qty_bal,
       stockard.amount_bal,
       COALESCE(stockard.mac, 0.00)                       AS mac,
       TO_CHAR(stockard.date_created, 'YYYY-MM-DD'::TEXT) AS date_created,
       stockard.stockard_id = latest_stockard.stockard_id AS islatest
FROM stockard
         JOIN product ON stockard.product_id = product.product_id
         LEFT JOIN stockard latest_stockard
                   ON latest_stockard.stockard_id = get_stockard_bal_per_product(product.product_id)
ORDER BY product.product_id, stockard.stockard_id;

ALTER TABLE view_stockard_history_per_transaction
    OWNER TO postgres;

