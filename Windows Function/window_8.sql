select * from employee

-- Rank employees based on salary.
select *
from(
    select *,
    rank() over(order by salary desc) as rn
    from employee
)t

-- Fetch employees with rank = 1.
select *
from(
    select *,
    rank() OVER(order by salary desc) as rn
    from employee
)t
where rn = 1

-- Find employees earning the second highest salary.
select *
from (
    select *,
    rank() over(order by salary desc) as rn
    from employee
)t
where rn = 2

-- Fetch employees whose rank is less than 3.
select *
from(
    select *,
    rank() over(order by salary desc) as rn
    from employee
)t
where rn < 3

-- rank employees department wise.
select *
from(
    select *,
    rank () over(partition by dept_id order by salary desc) as rn
    from employee
) t 
