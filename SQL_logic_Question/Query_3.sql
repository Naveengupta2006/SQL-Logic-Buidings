select * from employees

/* Subquery & nested logic*/
 -- Find employees earning more than department average salary

select *
from employees as e
where salary >
(
    select avg(salary)
    from employees
    where  department = e.department
)

-- find second highest salary in each department 
select max(salary) as second_highest_salary
from employees
where salary <(
    select max(salary)
    from employees
)

-- find department with maximum employees count
select department
from employees
group by department
having count(*) = (
    select max(emp_cnt)
    from (
        select count(*) as emp_cnt
        from employees
        group by department
    ) t
)

-- find employees who joined earliest
select *
from employees
where join_date = (
    select min(join_date)
    from employees
)

--find employees who joined latest
select *
from employees
where join_date = (
    select max(join_date)
    from employees
)

-- find employees earning top 10 % salary
select * 
from employees
where salary >=(
    select salary
    from employees
    order by salary DESC
    limit(
        select count(*) * 0.10
        from employees
    ),1
);