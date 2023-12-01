CREATE VIEW view_product_price_history(product_id, skucode, product_name, tradetype, price, date_created) AS
SELECT prod.product_id,
       prod.skucode,
       prod.product_name,
       prdprice.tradetype,
       prdprice.price,
       TO_CHAR(prdprice.date_created, 'YYYY-MM-DD'::TEXT) AS date_created
FROM product_price prdprice
         JOIN product prod ON prdprice.product_id = prod.product_id
ORDER BY prod.product_id, prdprice.tradetype, prdprice.date_created;

ALTER TABLE view_product_price_history
    OWNER TO postgres;

