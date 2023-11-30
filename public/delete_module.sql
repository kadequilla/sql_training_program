CREATE PROCEDURE delete_module(IN param_mod_id bigint, INOUT result character varying DEFAULT NULL::character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
         IF NOT exists(SELECT*FROM module WHERE module_id = param_mod_id) THEN
                result:='Module not found!';
        ELSE
            DELETE FROM module WHERE module_id = param_mod_id;
                result:='Successfully Deleted!';
       END IF;
    END
$$;

ALTER PROCEDURE delete_module(BIGINT, INOUT VARCHAR) OWNER TO postgres;

