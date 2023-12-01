CREATE VIEW view_product_price(product_id, skucode, product_name, tradetype, price, date_created) AS
SELECT prod.product_id,
       prod.skucode,
       prod.product_name,
       prodprice.tradetype,
       prodprice.price,
       TO_CHAR(prodprice.date_created, 'YYYY-MM-DD'::TEXT) AS date_created
FROM product prod
         JOIN product_price prodprice ON prod.product_id = prodprice.product_id
WHERE (prodprice.product_price_id IN (SELECT MAX(subqprice.product_price_id) AS max
                                      FROM product_price subqprice
                                      GROUP BY subqprice.product_id, subqprice.tradetype))
ORDER BY prodprice.product_price_id DESC;

ALTER TABLE view_product_price
    OWNER TO postgres;

