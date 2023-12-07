CREATE VIEW view_all_product
            (product_id, product_group_id, group_name, skucode, barcode, product_name, unit, date_created) AS
SELECT product.product_id,
       product.product_group_id,
       UPPER(product_group.group_name::TEXT)             AS group_name,
       UPPER(product.skucode::TEXT)                      AS skucode,
       UPPER(product.barcode::TEXT)                      AS barcode,
       INITCAP(product.product_name)                     AS product_name,
       UPPER(product.unit::TEXT)                         AS unit,
       TO_CHAR(product.date_created, 'YYYY-MM-DD'::TEXT) AS date_created
FROM product
         JOIN product_group ON product.product_group_id = product_group.product_group_id
ORDER BY product.product_id DESC;

ALTER TABLE view_all_product
    OWNER TO postgres;

