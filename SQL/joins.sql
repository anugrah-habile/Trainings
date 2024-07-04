--Q1)
Select e.last_name, d.department_id, d.department_name
From employees e
Join departments d ON e.department_id = d.department_id
Order by e.last_name;

--Q2)
Select distinct j.job_title, l.city
Join employees e
On j.job_id = e.job_id
Join locations l
on d.location_id = l.location_id
From jobs j
Join departments d
On e.department_id = d.department_id

Where d.department_id = 8;


--Q3)
Select e.last_name, d.department_name, l.location_id, l.city
from employees e
join department d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id


--Q4)
Select e.last_name, d.department_name
from employees e
join departments d 
on e.department_id = d.department_id
Where LOWER(e.last_name) LIKE '%a%';


--Q5)
Select e.last_name, j.job_id, d.department_id, d.department_name
from jobs j
join employees e
on e.job_id = j.job_d
join departments d
on e.department_id = d.department_id
join locations l
on l.location_id = d.location_id;
where l.city = 'Toronto';


--Q6)
select e1.last_name as Employee, e1.employee_id as "Emp#",
e2.last_name as Manager, e2.employee_id as "Mgr#"
from employees e1
join employees e1 on e.manager_id = e2.employee_id;


--Q7)
select e.last_name as Employee, e1.employee_id as "Emp#",
e2.last_name as Manager, e.manager_id as "Mgr#"
from employees e
left join employees m on e.manager_id = m.employee_id
order bye.employee_id;


--Q8)
Select e1.last_name as "Employee Last Name", e1.department_id as "Employee Department",
e2.last_name, e2.department_id 
from employees e1
join employees e2
on e1.department_id = e2.department_id
order by e1.last_name, e2.last_name;


--Q10)
Select e.first_name as "Employee Name",
       e.hire_date as "Hire Date"
from employees e
Where e.hire_date > (select hire_date from employees where last_name = 'Daniel')
Order by e.hire_date;



--Q11)
Select e1.first_name as "Employee", e1.hire_date as "Employee Hired",
e2.first_name as "Manager", e2.hire_date as "Manager Hired"
From employees e1
Join employees e2
on e1.manager_id = e2.employee_id
Where e1.hire_date < e2.hire_date
Order by e1.hire_date;


--Q13)
Select ROUND(max(salary)) as "Maximum", ROUND(min(salary)) as "Minimum",
ROUND(sum(salary)) as "Sum", ROUND(avg(salary)) as "Average"
From employees;


--Q14)
Select j.job_title,ROUND(min(e.salary)) as "Minimum",ROUND(MAX(e.salary)) AS "Maximum",
ROUND(sum(e.salary)) as "Sum", ROUND(avg(e.salary)) as "Average"
from employees e
Join jobs j
on e.job_id = j.job_id
group by j.job_title;


--Q15)
Select job_title, Count(*) AS total
From employees e
Join jobs j on e.job_id = j.job_id
group by job_title
order by total DESC;


--Q17)
Select max(salary) - min(salary) as DIFFERENCE
from employees;


--Q18)








