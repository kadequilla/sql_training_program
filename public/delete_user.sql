CREATE PROCEDURE public.delete_user(IN user_id bigint)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM nvt_user where nvt_user_id = user_id;
        RAISE NOTICE 'Successfully Deleted!';
    END
$$;

ALTER PROCEDURE public.delete_user(BIGINT) OWNER TO postgres;

