CREATE VIEW view_all_module(module_id, module_code, module_name, date_created) AS
SELECT module_id,
       UPPER(module_code::TEXT)                  AS module_code,
       INITCAP(module_name::TEXT)                AS module_name,
       TO_CHAR(date_created, 'YYYY-MM-DD'::TEXT) AS date_created
FROM module;

ALTER TABLE view_all_module
    OWNER TO postgres;

