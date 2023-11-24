CREATE PROCEDURE update_module(IN param_mod_id bigint, IN param_mod_code character varying, IN param_mod_name character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        UPDATE module
        SET module_code = param_mod_code,
            module_name = param_mod_name
        WHERE module_id = param_mod_id;
        RAISE NOTICE 'Successfully Updated!';
    END
$$;

ALTER PROCEDURE update_module(BIGINT, VARCHAR, VARCHAR) OWNER TO postgres;

