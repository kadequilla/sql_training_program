CREATE VIEW public.view_product_price_history
            (product_price_id, product_id, skucode, product_name, unit, tradetype, price, date_created) AS
SELECT prdprice.product_price_id,
       prod.product_id,
       prod.skucode,
       prod.product_name,
       prod.unit,
       prdprice.tradetype,
       prdprice.price,
       date(prdprice.date_created) AS date_created
FROM product_price prdprice
         JOIN product prod ON prdprice.product_id = prod.product_id
ORDER BY prod.product_id, prdprice.tradetype, prdprice.date_created;

ALTER TABLE public.view_product_price_history
    OWNER TO postgres;

