Create or Replace Procedure sp_populate_location_coord (p_etl_user_id in Varchar2) is
v_id VARCHAR2(36);
v_is_primary NUMBER(1,0);
v_location_id Varchar2(36);
v_user_id Varchar2(36);

BEGIN
v_is_primary :=1;

For rec in (
Select coordinators, region
From src_centers)
Loop
v_id := sys_guid();

Select id into v_location_id
From tar_location
Where name = rec.region;

Select id into v_user_id
From tar_users
Where manabadi_email = rec.coordinators;

If v_is_primary =0 then
v_is_primary := 1;
Else
v_is_primary := 0;
End if;

Insert into tar_location_coord (id, is_active, locations_id, user_id, created_by, updated_by, deleted_by)
Values (v_id, v_is_primary, v_location_id, v_user_id, p_etl_user_id, p_etl_user_id, NULL);

Commit;
End Loop;

EXCEPTION
When Others then
DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
Rollback; 
Raise;

End sp_populate_location_coord;