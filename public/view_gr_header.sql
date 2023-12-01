CREATE VIEW view_gr_header
            (gr_id, module_id, module_code, documentno, tradetype, nvt_user_id, processed_by, date_created) AS
SELECT gr.gr_id,
       gr.module_id,
       module.module_code,
       gr.documentno,
       gr.tradetype,
       nvt_user.nvt_user_id,
       CONCAT(nvt_user.firstname, ' ', nvt_user.lastname) AS processed_by,
       TO_CHAR(gr.date_created, 'YYYY-MM-DD'::TEXT)       AS date_created
FROM gr
         JOIN nvt_user ON gr.proccessed_by_user_id = nvt_user.nvt_user_id
         JOIN module ON gr.module_id = module.module_id;

ALTER TABLE view_gr_header
    OWNER TO postgres;

