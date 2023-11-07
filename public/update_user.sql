CREATE PROCEDURE public.update_user(IN param_fname character varying, IN param_mname character varying, IN param_lname character varying, IN param_uname character varying, IN param_password character varying, IN user_id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        UPDATE nvt_user
        SET firstname = param_fname,
            middlename = param_mname,
            lastname = param_lname,
            username = param_uname,
            password  = param_password
        WHERE nvt_user_id = user_id;
    END
$$;

ALTER PROCEDURE public.update_user(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, BIGINT) OWNER TO postgres;

