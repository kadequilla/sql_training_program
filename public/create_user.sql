CREATE PROCEDURE public.create_user(IN param_fname character varying, IN param_mname character varying, IN param_lname character varying, IN param_uname character varying, IN param_password character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO nvt_user (firstname, middlename, lastname, username, password, datecreated)
        VALUES (param_fname, param_mname, param_lname, param_uname, param_password, now());
        RAISE NOTICE 'Successfully added new user!';
    END
$$;

ALTER PROCEDURE public.create_user(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR) OWNER TO postgres;

