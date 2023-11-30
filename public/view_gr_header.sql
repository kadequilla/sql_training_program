CREATE VIEW view_gr_header
            (gr_id, module_id, module_code, documentno, tradetype, nvt_user_id, firstname, middlename, lastname,
             date_created) AS
SELECT gr.gr_id,
       gr.module_id,
       module.module_code,
       gr.documentno,
       gr.tradetype,
       nvt_user.nvt_user_id,
       nvt_user.firstname,
       nvt_user.middlename,
       nvt_user.lastname,
       gr.date_created
FROM gr
         JOIN nvt_user ON gr.proccessed_by_user_id = nvt_user.nvt_user_id
         JOIN module ON gr.module_id = module.module_id;

ALTER TABLE view_gr_header
    OWNER TO postgres;

