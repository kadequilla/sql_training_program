CREATE PROCEDURE delete_product_group(IN param_group_id bigint, INOUT result character varying DEFAULT NULL::character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        IF NOT exists(SELECT*FROM product_group WHERE product_group_id = param_group_id) THEN
                result:='Group not found!';
        ELSE
            DELETE FROM product_group WHERE product_group_id = param_group_id;
            result:='Successfully Deleted!';
       END IF;
    END
$$;

ALTER PROCEDURE delete_product_group(BIGINT, INOUT VARCHAR) OWNER TO postgres;

