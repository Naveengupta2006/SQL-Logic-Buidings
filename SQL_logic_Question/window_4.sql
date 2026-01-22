select * from employee

-- Find employees who appear in top 2 using RANK() but not using ROW_NUMBER().

select *
from(
    select *,
    dense_rank() over(ORDER BY salary desc) as salary_rak
    from employee
) t
where salary_rak <= 2

-- Find employees who are ranked 3 using RANK() but ranked 2 using DENSE_RANK().
select *
from(
    select *,
    RANK() over(order by salary desc) as rnk,
    DENSE_RANK() over(order by salary desc) as dense_rak
    from employee
) t
where rnk = 3 
and dense_rak = 2