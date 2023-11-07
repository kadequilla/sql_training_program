CREATE PROCEDURE public.create_module(IN param_mod_code character varying, IN param_mod_name character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO module (module_code, module_name, stub_curno, date_created)
        VALUES (param_mod_code, param_mod_name, 0, now());
    END
$$;

ALTER PROCEDURE public.create_module(VARCHAR, VARCHAR) OWNER TO postgres;

