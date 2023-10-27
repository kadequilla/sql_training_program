CREATE FUNCTION public.get_module(mcode character)
    RETURNS TABLE(module_id bigint, document_no character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN QUERY SELECT
            mod.module_id,
            cast(concat(trim(mod.module_code), to_char(stub_curno+1, 'fm00000')) as varchar) as document_no
        FROM module mod where mod.module_code = mcode;
    END
$$;

ALTER FUNCTION public.get_module(CHAR) OWNER TO postgres;

