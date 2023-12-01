CREATE FUNCTION func_login(param_uname character varying, param_pw character varying)
    RETURNS TABLE(ret_id bigint, ret_firstname character varying, ret_lastname character varying, ret_username character varying)
    LANGUAGE plpgsql
AS
$$

    BEGIN
          IF NOT exists(SELECT*FROM nvt_user WHERE username = param_uname AND password = param_pw) THEN
              RAISE EXCEPTION 'User not found!';
          END IF;

        RETURN QUERY
            SELECT
            nvt_user_id as ret_id,
            firstname as ret_firstname,
            lastname as ret_lastname,
            username as ret_username
            FROM nvt_user WHERE username = param_uname AND password = param_pw;
    END
$$;

ALTER FUNCTION func_login(VARCHAR, VARCHAR) OWNER TO postgres;

