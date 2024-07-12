--Q1)
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE GET_EMPLOYEES(
p_first_name OUT employees.first_name %TYPE
p_last_name OUT employees.last_name %TYPE
p_salary OUT employees.salary %TYPE)
IS

BEGIN    
FOR emp_rec IN (SELECT employee_id, first_name, salary FROM employees) LOOP

DBMS_OUTPUT.PUT_LINE('Employee ID: '|| emp_rec.employee_id);
DBMS_OUTPUT.PUT_LINE('Name: '|| emp_rec.first_name || ' ' || emp_rec.last_name);
DBMS_OUTPUT.PUT_LINE('Salary: '|| emp_rec.salary);
END LOOP;

END;


--Q2)
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE GET_EMPLOYEES(
p_dept_id IN employees.department_id%TYPE
p_first_name OUT employees.first_name %TYPE
p_last_name OUT employees.last_name %TYPE
p_salary OUT employees.salary %TYPE)
IS

BEGIN    
FOR emp_rec IN (SELECT employee_id, first_name, salary FROM employees WHERE department_id = p_dept_id) LOOP
        
DBMS_OUTPUT.PUT_LINE('Employee ID: '|| emp_rec.employee_id);
DBMS_OUTPUT.PUT_LINE('Name: '|| emp_rec.first_name || ' ' || emp_rec.last_name);
DBMS_OUTPUT.PUT_LINE('Email: '|| emp_rec.email);
END LOOP;

END;



--Q3)
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE GET_EMPLOYEES_IN_DEPT(
p_dept_id IN employees.department_id %TYPE
p_first_name OUT employees.first_name %TYPE
p_salary OUT employees.salary %TYPE)
IS

CURSOR emp_cursor IS
SELECT first_name, salary
FROM employees
WHERE department_id = p_dept_id;

V_first_name employees.first_name %TYPE
v_salary employees.salary %TYPE

BEGIN
OPEN emp_cursor
LOOP
FETCH emp_cursor into v_first_name, v_salary;
EXIT WHEN emp_cursor%NOTFOUND;

Dbms_output.put_line('Name: '|| v_first_name);
Dbms_output.put_line('Salary: '|| v_salary);

END LOOP;    
CLOSE emp_cursor;

EXCEPTION
WHEN NO_DATA_FOUND THEN
Dbms_output.put_line('No employees found for the specified department.');
END;




--Q5)

