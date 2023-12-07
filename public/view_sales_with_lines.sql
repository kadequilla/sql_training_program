CREATE VIEW view_sales_with_lines(tradetype, documentno, product_id, qty, cost, total_amount) AS
SELECT sales.tradetype,
       sales.documentno,
       sline.product_id,
       sline.qty,
       sline.cost,
       sline.total_amount
FROM sales
         LEFT JOIN salesline sline ON sales.sales_id = sline.sales_id;

ALTER TABLE view_sales_with_lines
    OWNER TO postgres;

