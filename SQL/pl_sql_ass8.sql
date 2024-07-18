--Q1)
CREATE OR REPLACE Function Calculate_area (len IN number, width in number)
Return Number is
area number;

BEGIN
area := len * width;
Return area;

END;

DECLARE
area_1 NUMBER;
area_2 NUMBER;
area_3 NUMBER;
BEGIN
area_1 := calculate_area(10, 5);
area_2 := calculate_area(7, 3);
area_3 := calculate_area(15, 10);
    
DBMS_OUTPUT.PUT_LINE('Area of rectangle (10 x 5): ' || area_1);
DBMS_OUTPUT.PUT_LINE('Area of rectangle (7 x 3): ' || area_2);
DBMS_OUTPUT.PUT_LINE('Area of rectangle (15 x 10): ' || area_3);
END;


--Q2)
CREATE OR REPLACE function reverse_string (input in varchar2)
Return varchar2 is 
reversed_str varchar2(100) := '';

BEGIN
For i in reverse 1..Length(input) Loop
reversed_str := reversed_str || Substr(input, i, 1);
End Loop;
Return reversed_str;

END;

DECLARE
ex_str VARCHAR2(100);
res_str VARCHAR2(100);
BEGIN
ex_str := 'Anugrah Srivastava';
res_str := reverse_string(test_str);
DBMS_OUTPUT.PUT_LINE('Original: ' || ex_str || ' | Reversed: ' || res_str);

END;


--Q3)
CREATE OR REPLACE function safe_division(num in Number, den in Number)
Return Number is

BEGIN
If den = 0 then
Return Null;
Else 
Return num/den;
End if;

End;


DECLARE
res NUMBER;
BEGIN
res := safe_division(10, 2);
DBMS_OUTPUT.PUT_LINE('10 / 2 = '|| res);

res := safe_division(10, 0);
DBMS_OUTPUT.PUT_LINE('10 / 0 = '|| res);

END;


--Q4)
CREATE OR REPLACE function get_employee_count(dept_id departments.department_id %TYPE)
Return departments.department_id %TYPE is
emp_count departments.department_id %TYPE;

BEGIN
Select count(*) into emp_count
From employees
Where dept_id = department_id;

Return emp_count;

End;


--Q5)
CREATE OR REPLACE FUNCTION get_emp_salary(emp_id IN employees.eployee_id %TYPE)
RETURN employees.eployee_id %TYPE IS
emp_salary employees.eployee_id %TYPE;

employee_not_found EXCEPTION;

BEGIN
Select salary into emp_salary
From employees
where emp_id = employee_id;

Return emp_salary;

EXCEPTION
When NO_DATA_FOUND Then
Raise employee_not_found;

END;


DECLARE
emp_id NUMBER := 101;  
salary NUMBER;
BEGIN
salary := get_employee_salary(emp_id);
DBMS_OUTPUT.PUT_LINE('Salary of employee '| emp_id || ': ' || salary);

EXCEPTION
WHEN employee_not_found THEN
DBMS_OUTPUT.PUT_LINE('Error: Employee ID '|| emp_id || ' not found.');

END;




--Q6)
CREATE OR REPLACE FUNCTION calculate_discount(total_amount IN NUMBER)
RETURN NUMBER IS
discount_amount NUMBER := 0;
BEGIN
IF total_amount < 1000 THEN
discount_amount := total_amount * 0.05; 
ELSIF total_amount >= 1000 AND total_amount <= 5000 THEN
discount_amount := total_amount * 0.10;  
ELSIF total_amount > 5000 THEN
discount_amount := total_amount * 0.15;  
END IF;

RETURN discount_amount;
END;



--Q7)
CREATE OR REPLACE Package employee_pkg as
Procedure insert_employee (
p_emp_id in Number,
p_first_name in Varchar2,
p_salary in Number,
p_job_title in Varchar2,
p_dept_id in Number);


FUNCTION calculate_salary (
p_hours in Number,
p_rate in Number)
Return number;


Procedure update_job (
p_emp_id in Number,
p_new_job in Varchar2);


Function get_empcount (
p_dept_id in Number)
Return Number;

End employee_pkg;




CREATE OR REPLACE Package body employee_pkg as
Procedure insert_employee (
p_emp_id in Number,
p_first_name in Varchar2,
p_salary in Number,
p_job_title in Varchar2,
p_dept_id in Number) is

BEGIN 
Insert into (employee_id, first_name, salary, job_title, dept_id)
Values (p_emp_id, p_first_name, p_salary, p_job_title, p_dept_id)


EXCEPTION
When DUP_VAL_ON_INDEX Then
RAISE_APPLICATION_ERROR(-20001, 'Employee already exists.');

END insert_employee;


FUNCTION calculate_salary (
p_hours in Number,
p_rate in Number)
Return number is

BEGIN 
Return p_hours * p_rate;
END calculate_salary;


Procedure update_job (
p_emp_id in Number,
p_new_job in Varchar2) is

BEGIN
UPDATE employees
Set job_title = p_new_job
Where emp_id = p_emp_id;

If SQL%ROWCOUNT = 0 Then
RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found.');
END IF;
END update_job_title;

FUNCTION get_employee_count (
p_department_id IN NUMBER)
Return Number is
v_count NUMBER;

BEGIN
Select Count(*) into v_count
From employees
Where department_id = p_department_id;

Return v_count;
End get_employee_count;

END employee_pkg;




--Q8)
CREATE OR REPLACE Package bank_operations_pkg as
Procedure deposit (
p_acc_id in Number,
p_amount in Number);

Procedure withdraw (
p_acc_id in Number,
p_amount in Number);

Function interest (
p_rate in Number,
p_time in Number,
p_acc_id in Number)
Return Number;

Procedure transfer (
p_acc1 in Number,
p_acc2 in Number,
p_acc_id in Number);

End bank_operations_pkg;


CREATE OR REPLACE Package body bank_operations_pkg as
Procedure deposit (
p_acc_id in Number,
p_amount in Number) is
BEGIN
Update accounts
Set balance = balance + p_amount
where account_id = p_acc_id;

If SQL%ROWCOUNT = 0 Then
RAISE_APPLICATION_ERROR(-20002, 'Employee ID not found.')
End if;

End deposit;

Procedure withdraw (
p_acc_id in Number,
p_amount in Number) is
v_bal Number;
BEGIN
Select balance into v_bal
From accounts
where accound_id = p_acc_id;

If(v_bal < p_amount) Then
RAISE_APPLICATION_ERROR(-20002, 'Insufficient balance remaining')
End If;

End withdraw;


Function interest (
p_rate in Number,
p_time in Number,
p_acc_id in Number) 
Return Number Is

v_bal Number;
v_interest Number;

BEGIN
Select balance into v_bal
From accounts
where accound_id = p_acc_id;

v_interest := v_bal * (v_time/100) * v_rate
Return v_interest;

END interest;


Procedure transfer (
p_acc_id1 in Number,
p_acc_id2 in Number,
p_amount in Number) is

v_bal1 Number;
v_bal2 Number;

Begin
Select balance into v_bal1
From accounts
where account_id = p_acc_id1;

If(v_bal1 < p_amount) Then
RAISE_APPLICATION_ERROR(-20002, 'Insufficient balance remaining')
End If;

Update accounts
set balance = balance - p_amount
where account_id = p_acc_id1;

Update accounts
set balance = balance + p_amount
where account_id = p_acc_id2;

If SQL%ROWCOUNT = 0 Then
RAISE_APPLICATION_ERROR(-20003, 'ID not found.')
End if;
END transfer;

END bank_operations_pkg;



