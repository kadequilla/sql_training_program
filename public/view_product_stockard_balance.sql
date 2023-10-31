CREATE VIEW public.view_product_stockard_balance(product_id, skucode, product_name, qty_bal, amt_bal) AS
SELECT prod.product_id,
       prod.skucode,
       prod.product_name,
       COALESCE(stockard.qty_bal, 0.00)    AS qty_bal,
       COALESCE(stockard.amount_bal, 0.00) AS amt_bal
FROM product prod
         LEFT JOIN stockard ON stockard.stockard_id = ((SELECT MAX(max_stockard.stockard_id) AS max
                                                        FROM stockard max_stockard
                                                        WHERE max_stockard.product_id = prod.product_id));

ALTER TABLE public.view_product_stockard_balance
    OWNER TO postgres;

