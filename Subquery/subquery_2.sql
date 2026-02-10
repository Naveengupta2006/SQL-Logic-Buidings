select * from employees

-- find employees who earn more than the average salary of their department.

select *
from employees as e
where salary >= (
    select avg(salary)
    from employees
    where department = e.department
)

-- find employees who earn the highest salary in each department.
SELECT *
from employees as e
where salary = (SELECT max(salary)
from employees
where department = e.department )

-- find employees who earn the lowest salary in each department.
select * 
from employees as e 
where salary = (select min(salary)
from employees
where department = e.department)

-- find department where average salary is greater than overall average salary.
select department 
from employees
group by department 
having  avg(salary) > (select avg(salary)
from employees)

-- find employees who are not earning the maximum salary in their department.
select *
from employees as e
where salary < (select max(salary)
from employees
where department = e.department)

-- find the department with the highest average salary.
select department
from employees
group by department
having max(salary) > (select avg(salary)
from employees)

-- find the department with the maximum number of employees.
select department
from employees
group by department
having count(*) = (select max(emp_count)
from (
    select count(*) as emp_count
    from employees
    group by department
) t
)

