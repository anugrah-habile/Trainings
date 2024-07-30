Create or replace Procedure sp_populate_users(p_etl_user_id in Varchar2) is
v_id Varchar2 (100);
v_first_name Varchar2(100);
v_last_name Varchar2(100);
v_middle_name Varchar2(100);
v_gender Varchar2(100) := 'M';
v_is_active Varchar2(100) := 'True';
v_contact_no src_users.contact_number%TYPE;
v_manabadi_email Varchar2(100);
v_prsnl_email Varchar2(100);
v_address_id Varchar2(100);
v_address Varchar2(100);

Cursor users_cursor is
Select first_name, last_name, middle_name, contact_number, manabadi_id, email, address
From src_users;


BEGIN
Open users_cursor;
Loop

Fetch users_cursor into v_first_name, v_last_name, v_middle_name, v_contact_no, v_manabadi_email, v_prsnl_email, v_address;
Exit when users_cursor%NOTFOUND;
v_id := sys_guid();

Insert into tar_users(id, first_name, last_name, middle_name, gender, is_active, contact_no, manabadi_email, prsnl_email, address_id, created_by, updated_by)
Values(v_id, v_first_name, v_last_name, v_middle_name, v_gender, v_is_active, v_contact_no, v_manabadi_email, v_prsnl_email, v_address_id, p_etl_user_id, p_etl_user_id);

Select id into v_address_id From tar_address 
where address = v_address;

End Loop;
Close users_cursor;
Commit;



End sp_populate_users;




DECLARE
v_etl_user_id varchar2(100) := 100;
BEGIN
sp_populate_users(v_etl_user_id);
END;

