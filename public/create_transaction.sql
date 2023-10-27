CREATE PROCEDURE public.create_transaction(INOUT id bigint, IN mod_code character, IN param_tradetype tradetype_enum)
    LANGUAGE plpgsql
AS
$$
    DECLARE
        var_module_id BIGINT := (SELECT module_id from get_module(mod_code));
        var_document_no varchar := (SELECT document_no from get_module(mod_code));
    BEGIN
        IF mod_code = 'GR' THEN
            INSERT INTO gr (module_id, documentno, tradetype, proccessed_by_user_id, date_created)
            VALUES (var_module_id,var_document_no, param_tradetype, id, now())
            RETURNING gr_id INTO id;
             --UPDATE stubno +1 after the creation of transaction header
            UPDATE module SET stub_curno = stub_curno+1 where module_id = var_module_id;
        END IF ;
        IF mod_code = 'SI' THEN
            INSERT INTO sales (module_id, documentno, tradetype, proccessed_by_user_id, date_created)
            VALUES (var_module_id,var_document_no, param_tradetype, id, now())
            RETURNING sales_id INTO id;
             --UPDATE stubno +1 after the creation of transaction header
            UPDATE module SET stub_curno = stub_curno+1 where module_id = var_module_id;
        END IF ;

        RETURN;

        EXCEPTION
        WHEN OTHERS THEN
        RAISE NOTICE 'Error: %', SQLERRM;
    END
$$;

ALTER PROCEDURE public.create_transaction(INOUT BIGINT, CHAR, tradetype_enum) OWNER TO postgres;

