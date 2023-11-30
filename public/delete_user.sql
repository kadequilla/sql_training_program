CREATE PROCEDURE delete_user(IN user_id bigint, OUT result character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        IF NOT exists(SELECT*FROM nvt_user WHERE nvt_user_id = user_id) THEN
                result:='User not found!';
        ELSE
            DELETE FROM nvt_user WHERE nvt_user_id = user_id;
                result:='Successfully Deleted!';
       END IF;



    END
$$;

ALTER PROCEDURE delete_user(BIGINT, OUT VARCHAR) OWNER TO postgres;

CREATE PROCEDURE delete_user(IN user_id bigint, INOUT result character varying DEFAULT NULL::character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        IF NOT exists(SELECT*FROM nvt_user WHERE nvt_user_id = user_id) THEN
                result:='User not found!';
        ELSE
            DELETE FROM nvt_user WHERE nvt_user_id = user_id;
                result:='Successfully Deleted!';
       END IF;



    END
$$;

ALTER PROCEDURE delete_user(BIGINT, INOUT VARCHAR) OWNER TO postgres;

