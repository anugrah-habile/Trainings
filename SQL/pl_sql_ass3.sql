--Q1)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
v_emp_id employees.employee_id%TYPE;
v_first_name employees.first_name%TYPE;
v_last_name employees.last_name%TYPE;
v_salary employees.salary%TYPE;

CURSOR emp_cursor is
Select employee_id, first_name, last_name, salary
From employees;

BEGIN
Open emp_cursor;
for i in 1..3 loop
fetch emp_cursor into v_emp_id, v_first_name, v_last_name, v_salary;

dbms_output.put_line('Employee id :'|| v_emp_id);
dbms_output.put_line('First Name :'|| v_first_name);
dbms_output.put_line('Last Name :'|| v_last_name);
dbms_output.put_line('Salary :'|| v_salary);

Close emp_cursor;

END;


--Q2)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;

DECLARE
v_first_name employees.first_name%TYPE;
v_emp_salary employees.salary%TYPE;

BEGIN
For emp_cur in (Select first_name, salary From Employees)LOOP
v_first_name := &emp_cur.first_name;
v_salary := &emp_cur.salary;
v_salary := v_salary *1.1;

dbms_output.put_line('First Name :'|| UPPER(v_first_name));
dbms_output.put_line('Updated Salary :'|| v_salary);
End loop;

END;


--Q3)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;

DECLARE
v_dept_id departments.department_id%TYPE
v_dept_name departments.department_name%TYPE
v_loc_id departments.location_id%TYPE

CURSOR dept_cursor IS
Select department_id, department_name, location_id
From Departments;


BEGIN
Open dept_cursor;
Loop
Fetch dept_cursor into v_dept_id, v_dept_name, v_loc_id;
Exit when dept_cursor%NOTFOUND;

dbms_output.put_line('Dept Name :'|| v_dept_name);
dbms_output.put_line('Dept id :'|| v_dept_id);
dbms_output.put_line('Location id :'|| v_loc_id);

End Loop;
Close dept_cursor;

End;


--Q4)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
  CURSOR department_cursor IS
  SELECT department_id, department_name FROM departments;
  dept_id departments.department_id%TYPE;
  dept_name departments.department_name%TYPE;
  emp_name employees.employee_name%TYPE;
BEGIN
  FOR dept_rec IN department_cursor
  LOOP
    dbms_output.put_line('Department: '|| dept_rec.department_name);
    CURSOR employee_cursor(department_id departments.department_id%TYPE)
    IS
      SELECT employee_name FROM employees WHERE department_id = 
    

END;




