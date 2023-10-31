CREATE FUNCTION public.check_transline_duplicates(trans_id bigint, prod_id bigint, mod_code character) RETURNS boolean
    LANGUAGE plpgsql
AS
$$
    DECLARE hasDuplicate BOOLEAN;
    BEGIN
        hasDuplicate := (SELECT
                        count(trans.id) cnt
                        FROM (SELECT
                            gr.gr_id id,
                            mod.module_code,
                            gl.product_id
                        FROM gr
                        INNER JOIN grline gl ON gr.gr_id = gl.gr_id
                        INNER JOIN module mod ON gr.module_id = mod.module_id
                        UNION ALL
                        SELECT
                            s.sales_id id,
                            mod.module_code,
                            gl.product_id
                        FROM sales s
                        INNER JOIN salesline gl ON s.sales_id = gl.sales_id
                        INNER JOIN module mod ON s.module_id = mod.module_id) AS trans
                        WHERE trans.product_id = prod_id
                        AND trans.module_code = mod_code
                        and trans.id = trans_id) > 0;
        RETURN hasDuplicate;
    END
$$;

ALTER FUNCTION public.check_transline_duplicates(BIGINT, BIGINT, CHAR) OWNER TO postgres;

