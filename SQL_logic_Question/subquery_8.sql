select * from employees

-- Assign a unique row number to each employee based on salary descending.
select *,
ROW_NUMBER() over(ORDER BY salary desc) as row_num
from employees

-- Assign row numbers department-wise, ordered by salary descending.
select *,
ROW_NUMBER() over(PARTITION BY dept_id order by salary desc) as dept_wise
from employees

-- Fetch the highest paid employee using ROW_NUMBER().
select *
from (
    select *,
    ROW_NUMBER() over(order by salary desc) as rn
    from employees
) t 
where rn = 1

-- fetch the second highest salary employee overall.
select *
from(
    select *,
    ROW_NUMBER() over(order by salary desc) as high_salary
    from employees
) t 
where high_salary = 2
