--Q1)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
v_emp_id employees.employee_id%TYPE;
v_first_name employees.first_name%TYPE;
v_emp_salary employees.salary%TYPE;

Cursor emp_cursor is
Select employee_id, first_name, salary From Employees   

BEGIN
Open emp_cursor;
Loop
Fetch emp_cursor into v_emp_id, v_first_name, v_salary;
Exit When emp_cursor%NOTFOUND 
BEGIN           
            
IF v_emp_salary / 0 THEN
RAISE ZERO_DIVIDE;


EXCEPTION
WHEN ZERO_DIVIDE THEN
DBMS_OUTPUT.PUT_LINE('Error: Cannot divide salary by 0 for: ' || v_emp_name);
                
           
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error: ' || v_emp_name || ': ' || SQLERRM);
END;
END LOOP;
    
  
CLOSE emp_cursor;
    

EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error occured: ' SQLERRM);

END;


--Q3)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
Type emp_table Is type of employees.first_name %TYPE
index by binary integer

Cursor emp_cursor is
Select first_name from employees;
emp_names emp_type

BEGIN
Open emp_cursor;
For i in 1..100 LOOP
Fetch emp_cursor into emp_names(i);
Exit when emp_cursor%NOTFOUND
End loop;

Close emp_cursor;

Dbms_Output.Put_Line('Employee Names:');
For I IN 1..Employee_Name.Count LOOP
Dbms_Output.Put_Line(Employee_Name(I));
End loop;

EXCEPTION
When Others then
Dbms_Output.Put_Line('Error: ' || Sqlerrm);

END


--Q4)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
Cursor emp_cursor is
Select salary from employees
where salary > 10000;

v_first_name employees.first_name%TYPE;
v_salary employees.salary%TYPE;


BEGIN
open emp_cursor
Loop
Fetch emp_cursor into v_first_name, v_salary;
Exit when emp_cursor%NOTFOUND;
Dbms_Output.Put_Line(v_first_name ||' have salary greater than 10000: ' || v_salary)

End loop;
Close emp_cursor;



EXCEPTION
When others then
DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        
END;



--Q5)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
v_employee_id Employees.Employee_Id%Type;
v_first_name Employees.First_Name%Type;
v_last_name Employees.Last_Name%Type;

BEGIN
Select employee_id, first_name, last_name Into v_employee_id, v_first_Name, v_last_Name
From Employees 
Where Employee_Id = 1234;
Dbms_Output.Put_Line('Employee ID: '|| v_employee_id);
Dbms_Output.Put_Line('First Name: '|| v_first_name);
Dbms_Output.Put_Line('Last Name: '|| v_last_name);

EXCEPTION
When No_Data_Found Then
Raise_Application_Error(-20101, 'No employees found for the given criteria.');
        
When Others Then
DBMS_OUTPUT.PUT_LINE('Error: '|| SQLERRM);
END;


--Q6)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE  
v_emp_id employees.employee_id%TYPE;
v_salary employees.salary%TYPE

BEGIN
Update Employees
Set salary = v_salary
where employee_id = v_emp_id;

if sql%ROWCOUNT > 1
Raise_application_error (-20102, 'More than one employee found for the given criteria.');
elsif sql%ROWCOUNT = 0
Raise_application_error(-20103, 'No employee found for the given criteria.');

EXCEPTION
When Others Then
Raise_Application_Error(-20000, 'An error occurred: ' || Sqlerrm);

END;


--Q7)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
v_emp_id employees.employee_id%TYPE;
v_first_name employees.first_name%TYPE;
v_salary employees.salary%TYPE;

BEGIN
v_emp_id := &employee_id;

IF v_emp_id < 0 THEN
Raise_application_error (-20202, 'Invalid employee ID entered.');
End if;

Select first_name, salary
into v_first_name, v_salary
from employees
where employee_id = v_emp_id;



Dbms_output.put_line('Employee Name: '|| v_first_name);
Dbms_output.put_line('Employee Salary: '|| v_salary);


EXCEPTION
When NO_DATA_FOUND then
RAISE_APPLICATION_ERROR(-20201, 'Employee ID not found.');

When others then
RAISE_APPLICATION_ERROR(-20000, 'An error occurred: '|| SQLERRM);

END;



--Q8)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
v_dept_id departments.department_id%TYPE;
v_dept_name departments.department_name%TYPE;

BEGIN
Insert Into Departments (Department_Id, Department_Name) Values (v_dept_Id, v_dept_name);
Dbms_Output.Put_Line('Department created successfully.');

EXCEPTION
When Dup_Val_On_Index Then
Raise_Application_Error(-20301, 'Department ID already exists.');
When others then
Raise_Application_Error(-20000, 'An error occurred: '|| Sqlerrm);

END;
