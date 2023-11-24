CREATE PROCEDURE update_user(IN param_fname character varying, IN param_mname character varying, IN param_lname character varying, IN param_uname character varying, IN param_password character varying, IN user_id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        UPDATE nvt_user
        SET firstname = is_null_empty(param_fname, firstname),
            middlename = is_null_empty(param_mname, middlename),
            lastname = is_null_empty(param_lname, lastname),
            username = is_null_empty(param_uname, username),
            password  = is_null_empty(param_password, password)
        WHERE nvt_user_id = user_id;
        RAISE NOTICE 'Successfully Updated!';
    END
$$;

ALTER PROCEDURE update_user(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, BIGINT) OWNER TO postgres;

