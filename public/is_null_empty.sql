CREATE FUNCTION is_null_empty(param character varying, def character varying) RETURNS character varying
    LANGUAGE plpgsql
AS
$$
    BEGIN
        RETURN (CASE WHEN param='' OR param IS NULL THEN def ELSE param END);
    END;
$$;

ALTER FUNCTION is_null_empty(VARCHAR, VARCHAR) OWNER TO postgres;

