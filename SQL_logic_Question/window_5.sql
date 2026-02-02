select *from employee

-- fetch the highest paid employee per department.
select *
from(
    select *,
    DENSE_RANK() over(PARTITION BY dept_id order by salary desc) as de_salary
    from employee
) t
where de_salary = 1

-- fetch all employee sharing the highest salary.
select *
from(
    select *,
    dense_rank() over(order by salary desc) as rak
    from employee 
) t
where rak = 1

