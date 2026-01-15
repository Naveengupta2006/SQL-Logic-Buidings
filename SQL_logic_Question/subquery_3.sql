-- city wise subquery question.

select * from employees
 -- find emloyees who earn more than the average salary of their city.
select *
from employees as e
where salary >= (select avg(salary)
from employees
where city = e.city)

-- find city with the highest average salary.
select city 
from employees
group by city
having avg(salary) = (
    select max(avg_salary)
    from (
        select avg(salary) as avg_salary
        from employees
        group by city 
    ) t
)

-- find employees from the city having maximum employees
select *
from employees
where city IN (
    select city
    from employees
    group by city
    having count(*) = (
        select max(count_emp)
        from(
            select count(*) count_emp
            from employees
            group by city
        ) t
    )
)

-- find employees who earn the highest salary in their city.
select * 
from employees as e
where salary = (select max(salary)
from employees
where city = e.city)

-- find cities where average salary is less than overrall average salary.
select city 
from employees
group by city
having avg(salary) < 
(select avg(salary) from employees)
