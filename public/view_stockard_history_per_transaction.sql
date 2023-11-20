CREATE VIEW public.view_stockard_history_per_transaction
            (product_id, skucode, product_name, documentno, qty, amount, qty_bal, amount_bal) AS
SELECT product.product_id,
       product.skucode,
       product.product_name,
       stockard.documentno,
       stockard.qty,
       stockard.amount,
       stockard.qty_bal,
       stockard.amount_bal
FROM stockard
         JOIN product ON stockard.product_id = product.product_id
ORDER BY product.product_id, stockard.stockard_id;

ALTER TABLE public.view_stockard_history_per_transaction
    OWNER TO postgres;

