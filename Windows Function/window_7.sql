select * from employee

-- fetch top 2 employees per department.

select *
from (
    select *,
    ROW_NUMBER() over(PARTITION BY dept ORDER By salary desc) as rn
    from employee
) t
where rn = 2;

-- fetch only one employee per department, even if salaries are same.

select emp_id, emp_name, dept, salary
from(
    select emp_id, emp_name, dept, salary,
    row_number() over(PARTITION BY dept ORDER BY emp_id desc) as rn
    from employee
)t
where rn = 1



