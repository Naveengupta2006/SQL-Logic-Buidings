create table department(
    dept_id INT,
    dept_name varchar(50)
)

insert into department(dept_id, dept_name)
VALUES
(10,'HR'),
(20,'IT'),
(30,'finance')

/* SQL Subquery Practice Questions

Basic Subquery */

-- find employees whose salary is greater than the average salary of all employees.

select *
from employees
where salary > (
    select avg(salary)
    from employees
)

-- find employees who earn the maximum salary in the company.
select * 
from employees
where salary = (
    select max(salary)
    from employees
)

-- find employee who joined before the average join_date.
select *
from employees
where join_date < (
    select avg(join_date)
    from employees
)

-- find employee whose salary is less than the maximum salary.
select *
from employees
where salary < (
    select max(salary)
    from employees
)

