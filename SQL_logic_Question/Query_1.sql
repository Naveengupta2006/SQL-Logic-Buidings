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

-- Basic Level Questions


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

-- Filtering & Conditions

-- Find employees from delhi or mumbai.

select *
from employees
where city in ('delhi','mumbai')

-- Find employees not working in HR.
select *
from employees
where department != 'HR'

-- Display employees with salary >=50000.
select *
from employees
where salary >= 50000

-- count total number of employees.
select count(*)
from employees

-- count employees in each department.
select count(*), department
from employees
GROUP BY department

-- find unique cities.
select DISTINCT city
from employees

-- find the highest salary.
select MAX(salary)
from employees

-- find the lowest salary.
select min(salary)
from employees

-- find average salary.
select avg(salary)
from employees

-- find total salary expense.
select sum(salary)
from employees

-- Group By logic


-- department wise employees count
select department, count(emp_id)
from employees
GROUP BY department

-- department wise average salary
select department, avg(salary)
from employees
group by department

-- city wise highest salary
select city, max(salary)
from employees
group by city

-- gender wise employee count
select gender, count(emp_id)
from employees
group by gender

-- department having more than 1 employees
select department, count(*)
from employees
GROUP BY department
having count(*) > 1

-- city wise total salary
select city, sum(salary)
from employees
group by city

-- department wise minimum salary
select department, min(salary)
from employees
group by department



-- Date & String Logic


-- Extract year from join_date.
select EXTRACT(year from join_date) as join_date
from employees

-- Find employees who joined in 2022.
select *
from employees
where extract(year from join_date) = 2022