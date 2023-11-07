CREATE PROCEDURE public.create_product_group(IN param_group_name character varying)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO product_group ( group_name, date_created)
        VALUES (param_group_name, now());
    END
$$;

ALTER PROCEDURE public.create_product_group(VARCHAR) OWNER TO postgres;

