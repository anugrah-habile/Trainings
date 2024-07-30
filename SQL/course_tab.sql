Create or Replace Procedure sp_populate_course (p_etl_user_id in Varchar2)is
v_id Varchar2(36);
v_course_name Varchar2(36);

BEGIN
For rec in (Select distinct course_name 
From src_course_enrollment )
Loop

v_id := sys_guid();
v_course_name := rec.course_name;

Insert into tar_course (id, first_name, created_by, updated_by, deleted_by)
Values (v_id, v_course_name, p_etl_user_id, p_etl_user_id, NULL);

Commit;
End Loop;

EXCEPTION
When Others then
DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
Rollback; 
Raise;

End sp_populate_course;