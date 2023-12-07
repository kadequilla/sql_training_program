CREATE PROCEDURE reset_stockard_test()
    LANGUAGE plpgsql
AS
$$
    BEGIN
    -- RESET GR TRANSACTION
    TRUNCATE gr CASCADE ;
    TRUNCATE grline CASCADE;
    ALTER SEQUENCE gr_gr_id_seq RESTART WITH 1;
    ALTER SEQUENCE grline_grline_id_seq RESTART WITH 1;
    UPDATE module SET stub_curno = 0 where module_id =  (SELECT module_id from get_module('GR'));

    -- RESET SALES TRANSACTION
    TRUNCATE sales CASCADE ;
    TRUNCATE salesline CASCADE;
    ALTER SEQUENCE sales_sales_id_seq RESTART WITH 1;
    ALTER SEQUENCE salesline_salesline_id_seq RESTART WITH 1;
    UPDATE module SET stub_curno = 0 where module_id =  (SELECT module_id from get_module('SI'));

    -- RESET STOCKARD
    TRUNCATE stockard CASCADE;
    ALTER SEQUENCE stockard_stockard_id_seq RESTART WITH 1;
    END
$$;

ALTER PROCEDURE reset_stockard_test() OWNER TO postgres;

