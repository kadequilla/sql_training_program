CREATE VIEW view_grlines (grline_id, gr_id, skucode, product_name, unit, qty, cost, total_amount, product_id) AS
SELECT grline.grline_id,
       grline.gr_id,
       product.skucode,
       product.product_name,
       product.unit,
       grline.qty,
       grline.cost,
       grline.total_amount,
       grline.product_id
FROM grline
         JOIN product ON grline.product_id = product.product_id
ORDER BY grline.grline_id;

ALTER TABLE view_grlines
    OWNER TO postgres;

