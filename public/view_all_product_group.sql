CREATE VIEW view_all_product_group(product_group_id, group_name, date_created) AS
SELECT product_group_id,
       UPPER(group_name::TEXT)                   AS group_name,
       TO_CHAR(date_created, 'YYYY-MM-DD'::TEXT) AS date_created
FROM product_group;

ALTER TABLE view_all_product_group
    OWNER TO postgres;

