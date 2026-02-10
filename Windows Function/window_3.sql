-- Active: 1768293064226@@localhost@3306@company
select * from employee

-- assign dense rank to employees based on salary descending.
select *,
DENSE_RANK() over(order by salary desc) as salary_rank
from employee

-- find employees with dense rank = 2
select *
from(
    select *,
    DENSE_RANK() over(order by salary desc) as salary_rak
    from employee
) t
where salary_rak = 2

-- fetch employees earning the second highest distinct salary.
select *
from(
    select *,
    DENSE_RANK() over(order by salary desc) as salary_rak
    from employee
) t
where salary_rak = 2

-- fetch top 3 salaries using dense_rank().
select *
from(
    select *,
    dense_rank() over(order by salary desc ) as salary_rak
    FROM employee
) t
where salary_rak <= 3

-- show dense rank department wise.
select *
from(
    select *,
    dense_rank() over(PARTITION BY dept_id ORDER BY salary desc) as dept_salary
    from employee
)t