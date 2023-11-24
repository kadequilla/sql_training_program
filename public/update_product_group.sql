CREATE PROCEDURE update_product_group(IN param_group_id bigint, IN param_group_name character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        UPDATE product_group
        SET group_name = param_group_name
        WHERE product_group_id = param_group_id;
        RAISE NOTICE 'Successfully Updated!';
    END
$$;

ALTER PROCEDURE update_product_group(BIGINT, VARCHAR) OWNER TO postgres;

