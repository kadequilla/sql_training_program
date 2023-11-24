CREATE PROCEDURE update_product(IN param_prodid bigint, IN param_prod_group_id bigint, IN param_skucode character varying, IN param_barcode character varying, IN param_prodname character varying, IN param_unit character)
    LANGUAGE plpgsql
AS
$$
    BEGIN
        UPDATE product
        SET product_group_id = param_prod_group_id,
            skucode = param_skucode,
            barcode = param_barcode,
            product_name = param_prodname,
            unit = param_unit,
            date_created = now()
        WHERE product_id  = param_prodid;
        RAISE NOTICE 'Successfully Updated!';
    END
$$;

ALTER PROCEDURE update_product(BIGINT, BIGINT, VARCHAR, VARCHAR, VARCHAR, CHAR) OWNER TO postgres;

