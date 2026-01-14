select * from employees

-- Basic Subquery questions

-- find employees whose salary is greater than the average salary.
select *
from employees
where salary >= (
    select avg(salary)
from employees)

-- find employees whose salary is equal to the maixmum salary.
select *
from employees
where salary = (select max(salary)
from employees)

-- find employees whose salary is equal to the minimum salary.

select *
from employees
where salary = (select min(salary)
from employees)

-- find employees who earn less than the average salary.
select *
from employees
where salary < (select min(salary)
from employees)

-- find the second highest salary using a subquery.
select max(salary)
from employees
where salary < (select max(salary)
from employees)

-- find employees who earn the second highest salary.
select name, salary
from employees
where salary = (select max(salary)
from employees
where salary < (select max(salary) from employees))


select *
from employees
where join_date > (select min(join_date)
from employees)

select *
from employees
where join_date < (select max(join_date)
from employees)