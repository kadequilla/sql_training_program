CREATE PROCEDURE create_product(IN param_prod_group_id bigint, IN param_skucode character varying, IN param_barcode character varying, IN param_prodname character varying, IN param_unit character)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO product (product_group_id, skucode, barcode, product_name, unit, date_created)
        VALUES (param_prod_group_id, param_skucode, param_barcode, param_prodname, param_unit, now());
        RAISE NOTICE 'Successfully Created!';
    END
$$;

ALTER PROCEDURE create_product(BIGINT, VARCHAR, VARCHAR, VARCHAR, CHAR) OWNER TO postgres;

