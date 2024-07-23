Create or replace Procedure sp_populate_address(p_etl_user_id in varchar2) is
v_id Varchar2 (100);
v_city Constant Varchar2 (100) := 'NY';
v_country Constant Varchar2 (100) := 'USA';
v_state Constant Varchar2 (100) := 'Manhattan';
v_zip_code Constant Varchar2 (100) := '10001';

Cursor address_cursor is
Select address from src_users
union 
Select address from src_centers
union
Select academic_school as address 
from src_course_enrollment;

src_address Varchar2(500);

BEGIN
Open address_cursor;
Loop
Fetch address_cursor into src_address;
Exit when address_cursor%NOTFOUND;
v_id := sys_guid();

Insert into tar_address(id, address, city, country, state, zipcode, created_by, updated_by)
Values(v_id, src_address, v_city, v_country, v_state, v_zip_code, p_etl_user_id, p_etl_user_id);

End loop;
Close address_cursor;
Commit;


EXCEPTION
When others then
Close address_cursor;
Raise;
End sp_populate_address;


DECLARE
v_etl_user_id varchar2(100) := 100;
BEGIN
sp_populate_address(v_etl_user_id);
END;
