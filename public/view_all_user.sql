CREATE VIEW public.view_all_user (nvt_user_id, firstname, middlename, lastname, username, password, datecreated) AS
SELECT nvt_user.nvt_user_id,
       nvt_user.firstname,
       nvt_user.middlename,
       nvt_user.lastname,
       nvt_user.username,
       nvt_user.password,
       nvt_user.datecreated
FROM nvt_user;

ALTER TABLE public.view_all_user
    OWNER TO postgres;

