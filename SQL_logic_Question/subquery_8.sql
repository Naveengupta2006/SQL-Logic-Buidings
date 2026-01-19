create DATABASE company

use company

create table employees(
    emp_id INT,
    emp_name varchar(50),
    dept_id int,
    salary int,
    manager_id int,
    join_date date
)

insert into employees(emp_id,emp_name,dept_id,salary,manager_id,join_date)
VALUES
(1,'rahul',10,50000,3,'2021-01-10'),
(2,'amit',20,60000,5,'2020-03-15'),
(3,'neha',10,75000,null,'2019-07-22'),
(4,'pooja',30,45000,6,'2022-05-18'),
(5,'karan',20,80000,null,'2018-09-12')

create table department(
    dept_id int,
    dept_name varchar(50)
)

insert into department (dept_id, dept_name)
VALUES
(10,'HR'),
(20,'IT'),
(30,'finance')

--Correlated Subquery.

-- find employees who earn more than their manager.
select *
from employees as e
where salary = (
    select salary
    from employees as m
    where dept_id = e.manager_id
)

-- find employees who earn the highest salary in their department.
select emp_id, emp_name, salary, dept_id
from employees as e 
where salary =
(
    select max(salary)
    from department as d
    where dept_id = e.dept_id
)

-- find employees who earn above department average but below company averages.
select emp_id, emp_name, salary, dept_id
from employees as e 
where salary > (
    select avg(salary)
    from employees
    where dept_id = e.dept_id
)
and salary < (
    select avg(salary)
    from employees
)

-- Find employees who joined earlier than the average join date of their department.

select *
from employees as e
where join_date < (
    select avg(join_date)
    from employees
    where dept_id = e.dept_id
)

-- Find employees who earn more than all employees in Finance department.
select *
from employees 
where salary >
(
    select max(salary)
    from employees as e
    join department as d
    on e.dept_id = d.dept_id
    where d.dept_name = 'Finance'
)