select * from employees

-- Age & Salary logic 

-- find employees whose age is greater than average age.

select * 
from employees
where age > (select avg(age)
from employees)

-- find employees whose salary is greater than salary of employees 'amit'
select * 
from employees
where salary > (select salary
from employees
where name = 'Amit')

-- find employees whose salary is same as someone else
select *
from employees
where salary in (
    select salary
    from employees
    group by salary
    having count(*) > 1
)

-- find employees who earn more than at least one employee in HR.
select *
from employees
where salary > ANY (
    select salary
    from employees
    where department = "HR"
)

-- find employees who earn more than all employees in HR.
select *
from employees
where salary > all (
    select salary
    from employees
    where department = 'HR'
)

