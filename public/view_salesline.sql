CREATE VIEW view_salesline (salesline_id, sales_id, skucode, product_name, qty, total_amount, product_id) AS
SELECT salesline.salesline_id,
       salesline.sales_id,
       product.skucode,
       product.product_name,
       salesline.qty,
       salesline.total_amount,
       salesline.product_id
FROM salesline
         JOIN product ON salesline.product_id = product.product_id
ORDER BY salesline.salesline_id;

ALTER TABLE view_salesline
    OWNER TO postgres;

