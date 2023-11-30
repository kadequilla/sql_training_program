CREATE VIEW view_sales_header
            (sales_id, module_id, module_code, documentno, tradetype, nvt_user_id, firstname, middlename, lastname,
             date_created) AS
SELECT sales.sales_id,
       sales.module_id,
       module.module_code,
       sales.documentno,
       sales.tradetype,
       nvt_user.nvt_user_id,
       nvt_user.firstname,
       nvt_user.middlename,
       nvt_user.lastname,
       sales.date_created
FROM sales
         JOIN nvt_user ON sales.proccessed_by_user_id = nvt_user.nvt_user_id
         JOIN module ON sales.module_id = module.module_id;

ALTER TABLE view_sales_header
    OWNER TO postgres;

