-- Active: 1768293064226@@localhost@3306@practice

use practice

create table employee(
    emp_id int,
    emp_name VARCHAR(50),
    dept varchar(50),
    salary int,
    join_date date
)

insert into employee(emp_id, emp_name, dept, salary, join_date)
VALUES
(1,'rahul','IT',60000, '2020-01-10'),
(2,'amit','IT',80000, '2019-03-15'),
(3,'neha','IT',80000,'2021-07-22'),
(4,'pooja','HR',50000,'2022-05-18'),
(5,'karan','HR',70000,'2018-11-01'),
(6,'riya','finance',90000,'2020-09-12'),
(7,'arjun','finance',90000,'2019-06-25'),
(8,'sneha','finance',65000,'2021-02-14')



-- fetch the highest paid employee
select *
from(
    select *,
    row_number() over(order by salary desc) as rak_salary
    from employee
)t
where rak_salary = 1

-- fetch the second highest salary employee.
select *
FROM(
    select *,
    row_number() over(order by salary desc) as rn
    from employee
)t
where rn > 2