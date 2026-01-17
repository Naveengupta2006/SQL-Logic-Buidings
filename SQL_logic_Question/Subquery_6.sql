select * from employees;
select * from department

/* Subquery with IN */

-- find employees who work in department located in the department table.
select *
from employees
where department in (
    select department
    from employees
)

-- find employees working in department where at least one employee earns more than 70000.
select *
from employees
where department IN (
    select DISTINCT department
    from employees
    where salary > 70000
)

-- find employees whose dept_id is in the department named IT.
select *
from employees
where dept_id in (
    select department
    from departemnt
    where dept_id = "IT"
)
