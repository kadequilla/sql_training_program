CREATE VIEW view_all_module(module_id, module_code, module_name, stub_curno, date_created) AS
SELECT module_id,
       module_code,
       module_name,
       stub_curno,
       date_created
FROM module;

ALTER TABLE view_all_module
    OWNER TO postgres;

