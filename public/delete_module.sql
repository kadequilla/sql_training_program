CREATE PROCEDURE public.delete_module(IN param_mod_id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM module WHERE module_id = param_mod_id;
        RAISE NOTICE 'Successfully Deleted!';
    END
$$;

ALTER PROCEDURE public.delete_module(BIGINT) OWNER TO postgres;

