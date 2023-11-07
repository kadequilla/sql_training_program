CREATE VIEW public.view_all_product_group(product_group_id, group_name, date_created) AS
SELECT product_group.product_group_id,
       product_group.group_name,
       product_group.date_created
FROM product_group;

ALTER TABLE public.view_all_product_group
    OWNER TO postgres;

