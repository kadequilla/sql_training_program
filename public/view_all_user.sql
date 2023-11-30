CREATE VIEW view_all_user (nvt_user_id, firstname, middlename, lastname, username, password, datecreated) AS
SELECT nvt_user_id,
       INITCAP(firstname::TEXT)                 AS firstname,
       INITCAP(middlename::TEXT)                AS middlename,
       INITCAP(lastname::TEXT)                  AS lastname,
       username,
       password,
       TO_CHAR(datecreated, 'YYYY-MM-DD'::TEXT) AS datecreated
FROM nvt_user;

ALTER TABLE view_all_user
    OWNER TO postgres;

