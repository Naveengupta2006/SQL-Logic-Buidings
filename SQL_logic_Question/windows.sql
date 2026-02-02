select * from employees

-- Fetch the top 2 employees from each department using ROW_NUMBER().
select *
from(
    select *,
    row_number() over(PARTITION BY dept_id order by salary desc) as top_two
    from employees
) t 
where top_two <= 2

-- Find employees whose row number is between 2 and 4 based on salary.
select *
from (
    select *,
    row_number() over(order by salary desc) as salary_bet
    from employees

) t 
where salary_bet BETWEEN 2 and 4;

