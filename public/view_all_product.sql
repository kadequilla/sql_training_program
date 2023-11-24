CREATE VIEW view_all_product
            (product_id, product_group_id, group_name, skucode, barcode, product_name, unit, date_created) AS
SELECT product.product_id,
       product.product_group_id,
       product_group.group_name,
       product.skucode,
       product.barcode,
       product.product_name,
       product.unit,
       product.date_created
FROM product
         JOIN product_group ON product.product_group_id = product_group.product_group_id;

ALTER TABLE view_all_product
    OWNER TO postgres;

