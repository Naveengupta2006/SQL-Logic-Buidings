select * from employee

-- Assign dense rank based on salary.
select *
from(
    select *,
    dense_rank() over(order by salary desc) as rnk
    from employee
)t

-- Fetch employees with dense_rank = 2.
select *
from(
    select *,
    DENSE_RANK() over(ORDER BY salary desc) as rnk
    from employee
)t
where rnk = 2
