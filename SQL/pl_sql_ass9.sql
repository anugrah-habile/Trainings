--Q1)
CREATE OR REPLACE TRIGGER update_salary_trigger
After insert on salary_change
For each row

BEGIN
Update employees
Set new_salary = salary * 1.1
where employee_id = :NEW.employee_id;

END;


--Q2)
CREATE OR REPLACE TRIGGER check_inventory_trigger
Before insert on orders
For each row

DECLARE
v_avl_quan Number

BEGIN
Select avl_quan
into v_avl
From products
where products.id = :NEW.products.id;

IF :NEW.ordered_quan > v_avl_quan Then
RAISE_APPLICATION_ERROR(-20001, 'Ordered quantity exceeds available quantity');
END IF;

END;



--Q3)
CREATE OR REPLACE TRIGGER audit_inserts_trigger
After insert on customer
For each row

BEGIN
insert into audit_log(user_name, customer_id, timestamp)
Values (USER, :New.customer_id, SYSDATE);

END;


--Q4)
CREATE OR REPLACE TRIGGER discount_trigger
Before insert or update on orders
For each row

BEGIN
IF :NEW.total_amt > 1000 Then
:NEW.discount := 0.15;
ELSE :NEW.discount := 0.05;
End if;

END;


--Q5)
CREATE OR REPLACE TRIGGER update_total_trigger
Before insert or update on orders
For each row

BEGIN





--Q6)
CREATE OR REPLACE TRIGGER update_manager_salary
After update of salary on employees
For each row

BEGIN
Update employees
Set salary = salary * 1.1
where employee_id = :NEW.manager_id

END;



--Q7)
CREATE OR REPLACE TRIGGER check_credit_limit_trigger
Before insert on orders
For each row

BEGIN

