--Q1)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
salary NUMBER := 5000;

BEGIN
dbms_output.put_line('Salary :'|| salary);

END;


--Q2)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
len NUMBER := 10;
wid NUMBER := 5;
area NUMBER ;

BEGIN
area := wid * len;
dbms_output.put_line('Area of the triangle is:'|| area);

END;

--Q3)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
message VARCHAR(60);
dbms_output.put('Enter a message:')

BEGIN

END;



Q4)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
num1 NUMBER;
num2 NUMBER;

BEGIN
DBMS_OUTPUT.PUT('Enter value for num1: ');
num1 := &num1_input; 
DBMS_OUTPUT.PUT('Enter value for num2: ');
num2 := &num2_input; 

DBMS_Output.Put_Line('Original values:'|| num1 ||' , '|| num2);

num1 := num1+num2;
num2 := num1-num2;
num1 := num1-num2;

DBMS_Output.Put_Line('Swapped values:'|| num1 ||' , '|| num2);
    

END;



--Q5)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
emp_count NUMBER(9) ;

BEGIN
Select Count(Employee_id) into emp_count from Employees;
dbms_output.put_line('Employee Count :'|| emp_count);

END;


--Q6)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
dept_name Varchar2(50);
v_dept_name Varchar2(50);

BEGIN
dept_name := &dept_name_input;
Select department_name  into v_dept_name 
from Departments
Where department_name=dept_name;

END;


--Q7)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
avg_salary NUMBER(10,2);

BEGIN
Select avg(salary) into avg_salary
from Employees;
dbms_output.put_line('Average Salary of employees is: ' || avg_salary);
END;


--Q8)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
employee_name varchar(100)
emp_id Employees.Employee_id%TYPE

BEGIN
emp_id := &emp_id_input
Select first_name
into employee_name
from Employees
where employee_id = emp_id;

dbms_output.put_line('Employee name is: '|| employee_name);

END;


--Q9)
Set serveroutput on;
Set verify off;
Set define on;

DECLARE
new_salary NUMBER(8,2)
emp_id employees.employee_id %Type

BEGIN
emp_id := &emp_id;
new_salary := &salary;
Update employees
Set salary = new_salary
where employee_id = emp_id

dbms_output.put_line('Updated Salary :' || salary);
Commit;

END;






