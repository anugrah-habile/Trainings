Create or Replace Procedure sp_populate_examcentre(p_etl_user_id in Varchar2) is
v_id Varchar2(36);
v_name src_centers.name%TYPE;
v_is_active Number(1,0);
v_address_id Varchar2(36);
v_location_id Varchar2(36);

BEGIN
For rec in (
Select name, active_status, address
From src_centers
)
Loop
v_id := sys_guid();
v_name := rec.name;

If rec.active_status = 'True' then
v_is_active := 'True';
Else
v_is_active := 'False';
End if;

Select id into v_address_id
From tar_address
Where address = rec.address;

Select id into v_location_id
From tar_location
Where name = rec.name;

Insert into tar_exam_centre (id, first_name, is_active, addresses_id, location_id, created_by, updated_by, deleted_by)
Values (v_id, v_name, v_is_active, v_address_id, v_location_id, p_etl_user_id, p_etl_user_id, NULL);

Commit;
End Loop;

EXCEPTION
When Others then
DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
Rollback; 
Raise;
End sp_populate_examcentre;