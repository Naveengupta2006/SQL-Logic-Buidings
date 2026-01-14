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
