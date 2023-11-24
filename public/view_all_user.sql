CREATE VIEW view_all_user (nvt_user_id, firstname, middlename, lastname, username, password, datecreated) AS
SELECT nvt_user_id,
       firstname,
       middlename,
       lastname,
       username,
       password,
       datecreated
FROM nvt_user;

ALTER TABLE view_all_user
    OWNER TO postgres;

