create database company;

use company

create table employee(
    emp_id INT,
    emp_name varchar(50),
    dept_id INT,
    salary int
)

insert into employee(emp_id,emp_name,dept_id,salary)
VALUES
(1,'rahul',10,50000),
(2,'amit',10,60000),
(3,'neha',10,60000),
(4,'pooja',20,45000),
(5,'karan',20,80000),
(6,'riya',20,80000),
(7,'arjun',30,70000)

--Basic Rank logic question.
select *,
rank() over(order by salary desc) as ran_salary
from employee

--find employees with rank = 1.
select *
from (
    select *,
    rank() over(order by salary desc) as rank_salary
    from employee
) t
where rank_salary = 1

-- fetch employees whose salary rank is 2.
select *
from(
    select *,
    rank() over(order by salary desc) as rak
    from employee
) t
where rak = 2

-- find employees earning the third highest salary.
select *
from(
    select *,
    rank() over(order by salary desc) as rak
    from employee
) t
where rak = 3

-- find employees whose rank is less than 3.
select *
from(
    select *,
    rank() over(order by salary desc) as rak

)t
where rak < 3

-- show rank department wise based on salary.
select *
from (
    select *,
    rank() over(PARTITION BY dept_id order by salary desc) as rak
    from employee
)  t


