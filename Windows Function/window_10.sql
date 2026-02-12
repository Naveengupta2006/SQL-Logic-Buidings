select * from employee

-- Fetch top 3 distinct salaries.
select *
from(
    select DISTINCT salary,
    dense_rank() over(order by salary desc) as rnk
    from employee
)t
where rnk <= 3

-- Fetch employees earning third highest distinct salary.

select *
from(
    select *,
    dense_rank() over(order by salary desc) as rnk
    from employee
)t
where rnk >= 3

-- dense rank employees department wise.
select *
from(
    select *,
    dense_rank() over(PARTITION BY dept_id order by salary desc) as rnk
    from employee
)t