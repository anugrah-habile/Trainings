--Q2)
SET SERVEROUTPUT ON;
set verify on;
set modify off;

DECLARE
    v_emp_id employees.employee_id%TYPE;
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE
    v_salary employees.salary%TYPE;
    v_dept employees.department%TYPE;
BEGIN
    v_emp_id := &emp_id; 
    
    SELECT first_name, last_name, salary, department
    INTO v_first_name, v_last_name, v_salary, v_dept
    FROM employees
    WHERE employee_id = v_emp_id;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID: '|| v_emp_id);
    DBMS_OUTPUT.PUT_LINE('First Name: '|| v_first_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: '|| v_last_name);
    DBMS_OUTPUT.PUT_LINE('Salary: '|| v_salary);
    DBMS_OUTPUT.PUT_LINE('Department: '|| v_dept);
END;



--Q3)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;

DECLARE
    v_dept_name departments.department_name%TYPE;
    v_dept_loc departments.location%TYPE;
BEGIN
    DBMS_OUTPUT.PUT('Enter Department Name: ');
    ACCEPT dept_name PROMPT ' ' FORMAT A30;

    DBMS_OUTPUT.PUT('Enter Department Location: ');
    ACCEPT dept_loc PROMPT ' ' FORMAT A30;

    v_dept_name := '&dept_name';
    v_dept_loc := '&dept_loc';


    INSERT INTO departments (department_name, location)
    VALUES (v_dept_name, v_dept_loc);

    DBMS_OUTPUT.PUT_LINE('Department record inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;


--Q6)
SET SERVEROUTPUT ON;
set verify on;
set modify off;

DECLARE
    v_emp_id employees.employee_id%TYPE;
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE
    v_salary employees.salary%TYPE;
    v_dept_id employees.department%TYPE;
BEGIN
    v_dept_id := &dept_id; 
    
    SELECT employee_name, salary, department
    INTO v_emp_name, v_salary, v_dept
    FROM employees
    WHERE department_id = v_dept_id;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID: '|| v_emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name: '|| v_emp_name);
    DBMS_OUTPUT.PUT_LINE('Salary: '|| v_salary);
    DBMS_OUTPUT.PUT_LINE('Department: '|| v_dept);
    
    
END;


--Q7)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;

DECLARE

BEGIN

END;



--Q8)
SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;

DECLARE
    v_count INTEGER := 0;
BEGIN
    DELETE FROM employees
    WHERE salary < 3000 AND datediff(years, Getdate(), hiredate)<5
    v_count := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE('Number of employees deleted: ' || v_count);    
    COMMIT; 
END;












