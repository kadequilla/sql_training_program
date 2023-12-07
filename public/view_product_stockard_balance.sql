CREATE VIEW view_product_stockard_balance(product_id, skucode, product_name, qty_bal, amt_bal, mac) AS
SELECT prod.product_id,
       prod.skucode,
       prod.product_name,
       COALESCE(stockard.qty_bal, 0.00)    AS qty_bal,
       COALESCE(stockard.amount_bal, 0.00) AS amt_bal,
       COALESCE(stockard.mac, 0.00)        AS mac
FROM product prod
         LEFT JOIN stockard ON stockard.stockard_id = get_stockard_bal_per_product(prod.product_id)
ORDER BY prod.product_id DESC;

ALTER TABLE view_product_stockard_balance
    OWNER TO postgres;

