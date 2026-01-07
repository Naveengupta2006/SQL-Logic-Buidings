CREATE DATABASE company;
use company;

CREATE TABLE employees(
    emp_id int PRIMARY KEY,
    name VARCHAR(50),
    age int,
    gender char,
    city VARCHAR(50),
    salary int,
    department VARCHAR(50),
    join_date DATE
)

insert into employees(emp_id, name,age,gender,city,salary,department,join_date)
values
(1,'amit',25,'m','delhi',30000,'IT','2022-01-10'),
(2,'neha',30,'f','mumbai',50000,'HR','2021-06-10'),
(3,'rahul',35,'m','pune', 60000, 'IT','2020-03-20'),
(4,'priya',28,'f','delhi',45000,'finance','2022-08-01'),
(5,'rohan',40,'m','mumbai',70000,'HR','2019-11-12');

-- Select all records from the table.
select * from employees;

-- show only employee name and salaries.
select name, salary
from employees

-- find employees whose salary is greater than 40000.
select *
from employees
where salary > 40000

-- find employees who live in delhi.
select *
from employees
where city = 'delhi'

-- get employees from IT department.
select * 
from employees
where department = 'IT'

-- find employees older than 30.
select *
from employees
where age > 30

--  display employee whose salary is between 40000 and 60000.
select *
from employees
where salary BETWEEN 40000 and 60000

-- show employees whose name start with 'R'
select *
from employees
where name LIKE 'r%'

-- find employees who joined after 2021.
select *
from employees
where join_date > '2021-06-10'

-- sort employees by salary (highest first)
select *
from employees
order by salary DESC

