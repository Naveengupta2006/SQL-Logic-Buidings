-- Active: 1768293064226@@localhost@3306@company
-- Active: 1768293064226@@localhost@3306@company
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

-- convert name to uppercase
select UPPER(name)
from employees

-- find lenght of employees names
select LENGTH(name)
from employees

-- concatenate name and city
select concat(name, '-', city)
from employees

-- find employees whose name contain 'a'
select *
from employees
where name like "%a%"

-- Case & Conditional logic

-- Create a column salary_status

-- High → salary ≥ 50,000
-- Low → salary < 50,000
select *,
        case
            when salary > 50000 then 'High'
            else 'low'
        end as salary_status
from employees

-- create age_group
-- young - age < 30,
-- adult - 30-40,
-- senior - > 40

select *,
        case
            when age < 30 then 'Young'
            when age between 30 and 40 then 'Adult'
            else 'Senior'
        end as age_group

from employees            
-- Subquery logic

-- Find Employees earing more than averge salary.
select *
from employees
where salary > (select avg(salary) from employees)

-- find employees with maximun salary

select *
from employees
where salary = (select max(salary) from employees)

-- Find employees earning second highest salary
select *
from employees
where salary = (
    select max(salary)
    from employees
    where salary < (select max(salary) from employees)
)

select *
from employees
where department = (
    select department
    from employees
    group by department
    order by avg(salary) desc
    limit 1
)


-- Basic Logic Buiding question.


-- find employees whose salary is greater than the average salary
select *
from employees
where salary > (select avg(salary) from employees)

-- find employees whose age is between 25 and 35.
select *
from employees
where age BETWEEN 25 and 35

-- fetch employees whose department is IT and city is delhi.

select *
from employees
where department = 'IT' and  
city = 'Delhi'

-- fetch employees whose department is IT or finance.
select *
from employees
where department in ('IT' , 'Finance')

-- find employees whose name ends with 'a'
select *
from employees
where name like '%a'

-- Find employees whose name does not contain 'o'
select *
from employees
where name not like '%o%'

-- find employees with null values.
select *
from employees
where salary > 0

-- replace null salary with 0 in output
select *,COALESCE(salary, 0)
from employees

select *
from employees
order by department asc, salary desc;

-- Aggregation & GROUP BY Logic

-- department wise totol salary

select department, sum(salary) as total_salary
from employees
group by department

-- department wise maximun salary
select department, max(salary)
from employees
group by department

-- department wise minimum salary
select department, min(salary)
from employees
group by department

-- department wise average salary
select department, avg(salary)
from employees
group by department

-- find department where average salary > 50000.
select department, avg(salary)
from employees
group by department
having avg(salary) > 50000

-- city wise employees count
select city, count(emp_id)
from employees
group by city

-- city-wise average salary
select city, avg(salary)
from employees
group by city

-- gender wise average salary
select gender, avg(salary)
from employees
group by gender

-- find department with highest total salary
select department, sum(salary) as total_salary
from employees
group by department
order by total_salary desc
limit 1

-- find city with lowest average salary.
select city, avg(salary) as lowest_salary
from employees
group by city
order by lowest_salary asc
limit 1

use company

-- Having vs where 

-- Find department having moe=re than 2 employees
select department, count(*) as employee_count
from employees
group by department
having count(*) > 2

-- find cities where total salary > 100000
select city, sum(salary) as total_salary
from employees
group by city
having total_salary > 100000

-- find department where max salary >= 70000.
select department, max(salary) as max_salary
from employees
group by department
having max_salary >= 70000

-- find genders with average age > 30.
select gender, avg(age) as avg_age
from employees
group by gender
having avg_age > 30

-- find department having employee count = 1
select department, count(*)
from employees
group by department
having count(*) = 1


-- String & Date Logic

-- Find employees whose name starts with vowels

select *
from employees
where left(UPPER(name), 1) in ('A','E','I','O','U')

-- find employees whose name length > 4
select *
from employees
where LENGTH(name) > 4

-- Extract month from join_date
select EXTRACT(month from join_date) as join_date
from employees

-- find employees who joined in january.
select *
from employees
where month(join_date) = 1

-- find employees who joined before 2020.
select *
from employees
where year(join_date) = '2020'

-- find number of employees joined each year.
select year(join_date) as join_year, count(*) as total_emp
from employees
group by year(join_date)
order by join_year

-- display join_date in DD_MM_YYYY format
select DATE_FORMAT(join_date, '%d-%m-%y')
from employees

-- replace city name delhi - newdelhi
select REPLACE(city, 'delhi','new delhi')
from employees

-- find employees whose name has exactly 5 characters
select *
from employees
where LENGTH(name) =  5

-- reverse employee names
select REVERSE(name)
from employees