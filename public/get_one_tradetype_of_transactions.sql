CREATE FUNCTION get_one_tradetype_of_transactions(trans_id bigint, mod_code character) RETURNS tradetype_enum
    LANGUAGE plpgsql
AS
$$
    DECLARE var_tradetype tradetype_enum;
    BEGIN
        var_tradetype := (
            SELECT
            trans.tradetype
            FROM (
                --transaction
                SELECT sales_id id, tradetype, module_id FROM sales
                UNION ALL
                SELECT gr_id id, tradetype, module_id FROM gr
            ) AS trans
            INNER JOIN module mod ON trans.module_id = mod.module_id
            WHERE trans.id = trans_id
            AND mod.module_code = mod_code
        );
        RETURN var_tradetype;
    END
$$;

ALTER FUNCTION get_one_tradetype_of_transactions(BIGINT, CHAR) OWNER TO postgres;

