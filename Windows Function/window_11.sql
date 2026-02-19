select * from employee

-- Show previous employee salary using LAG().
select *,
        lag(salary) over(order by salary) as privious_salary
from employee

-- Show next employee salary using LEAD().
select *,
        lead(salary) over(order by salary) as next_salary
        from employee

-- Find salary difference between current and previous employee.
select *,
        lag(salary) over(ORDER BY salary) as privious_salary,
        lead(salary) over(order by salary) as next_salary
        from employee

-- Identify employees whose salary is higher than previous record.

SELECT salary,
                lag() over(order by salary) as privious_salary
from employee
where salary > privious_salary

-- Show salary growth order-wise.

select salary,
                lag(salary) over(order by salary desc) as prev_salary
from employee