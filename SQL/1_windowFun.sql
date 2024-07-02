select
    d.department_id,
    d.department_name,
    avg(e.salary) as average_salary,
    RANK() over (order by avg(e.salary) desc) as department_rank
from
    departments d
    join employees e on d.department_id = e.department_id
group by
    d.department_id,
    d.department_name
order by
    average_salary desc;
    
    
    
select
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_id,
    d.department_name,
    TRUNC(MONTHS_BETWEEN(sysdate, e.hire_date) / 12) as tenure_years,
    RANK() over (partition by d.department_id order by TRUNC(MONTHS_BETWEEN(sysdate, e.hire_date) / 12) desc) as department_rank
from
    employees e
    join departments d on e.department_id = d.department_id
order by
    d.department_id, department_rank;
    
    
    
    
select
    e1.employee_id,
    e1.first_name || ' ' || e1.last_name as employee_name,
    e1.salary,
    NVL(e2.salary, 0) as next_hired_salary,
    NVL(e2.salary, 0) - e1.salary as difference
from
    employees e1
    left join (
        select
            employee_id,
            hire_date,
            salary,
            LEAD(hire_date) over (order by hire_date) as next_hire_date,
            LEAD(salary) over (order by hire_date) as salary_next_hired
        from
            employees
    ) e2 on e1.hire_date = e2.hire_date
order by
    e1.hire_date;
    
    
    
    

select 
    employee_id,
    hire_date,
    salary,
    previous_salary,
    salary - previous_salary AS salary_increase
from (
    select 
        employee_id,
        hire_date,
        salary,
        LAG(salary) over (order by hire_date) as previous_salary
    from 
        employees
) ranked_employees
where 
    previous_salary is not null
order by 
    salary_increase desc
limit 1;


