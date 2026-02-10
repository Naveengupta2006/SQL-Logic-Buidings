select * from employees

/* Advanced logic*/

-- find the 2nd highest salary using a subquery.
select max(salary)
from employees
where salary < (
    select max(salary)
    from employees
)

-- find employee whose salary rank is greater than 2
select *
from(
    select *,
    DENSE_RANK() over(order by salary desc) as salary_rank
    from employees
    
) t 
where salary_rank > 2

-- find employees who earn above department average but below comapany max salary.
select *
from employees as e
where e.salary > (
    select avg(salary)
    from employees
    where department = e.department
    
)
and e.salary <(
    select max(salary)
    from employees
)

-- find employees who joined earlier joiner in finance
select *
from employees
where join_date < (
    select min(join_date)
    from employees
    where department = 'finance'

)

-- find employees who earn salary equal to any employee in HR.
select *
from employees
where salary IN  (
    select salary 
    from employees
    where department = 'HR'
)