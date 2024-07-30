Create or replace Procedure sp_populate_region_coord (p_etl_user_id in Varchar2) is
v_is_primary Number(1) := 0;
v_region_id Number(20);
v_user_id Number(20);

Cursor reg_cursor is 
Select * From src_regions;

BEGIN
For emp in reg_cursor
Loop

Select id into v_region_id From tar_regions
Where first_name = emp.region_name;

Select id into v_region_id from tar_users
Where prsnl_email = emp.regional_coordinator;

Select Count(*) into v_is_primary from tar_region_coord;

If v_is_primary =0 then
v_is_primary := 1;
Else
v_is_primary := 0;
End if;

Insert into tar_region_coord( is_primary, region_id, user_id, created_by, updated_by)
Values (v_is_primary, v_region_id, v_user_id, p_etl_user_id, p_etl_user_id);

End loop;
END;

Begin 
sp_populate_region_coord('nsp:12c');
End;