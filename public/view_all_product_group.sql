CREATE VIEW view_all_product_group(product_group_id, group_name, date_created) AS
SELECT product_group_id,
       group_name,
       date_created
FROM product_group;

ALTER TABLE view_all_product_group
    OWNER TO postgres;

