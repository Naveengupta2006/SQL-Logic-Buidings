select * from employee

-- Rank employees within each department.
select *
from(
    select *,
    rank() over(PARTITION BY dept) as dept_wise
    from employee
)t

-- Find highest salary per department.

select *
from(
    select *,
    rank() over(PARTITION BY dept order by salary desc) as dept_wise
    from employee
) TABLE

