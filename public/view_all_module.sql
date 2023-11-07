CREATE VIEW public.view_all_module(module_id, module_code, module_name, stub_curno, date_created) AS
SELECT module.module_id,
       module.module_code,
       module.module_name,
       module.stub_curno,
       module.date_created
FROM module;

ALTER TABLE public.view_all_module
    OWNER TO postgres;

