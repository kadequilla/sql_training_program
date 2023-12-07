CREATE VIEW view_gr_with_lines(documentno, product_id, qty, cost, total_amount) AS
SELECT gr.documentno,
       gline.product_id,
       gline.qty,
       gline.cost,
       gline.total_amount
FROM gr
         LEFT JOIN grline gline ON gr.gr_id = gline.gr_id;

ALTER TABLE view_gr_with_lines
    OWNER TO postgres;

