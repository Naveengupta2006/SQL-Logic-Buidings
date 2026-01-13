select * from employees

/*Case & Conditional Thinking

Create a column experience_level
1. freaher - experience < 2 years
2. mid - 2-5 years
senior - > 5 years
*/

select *,
        CASE 
            WHEN salary >= 60000 THEN  salary * 0.10
            ELSE  salary * 0.05
        END as bouns
from employees

/* Tag Employees as eligible / not eligible
(Eligible if salary > 40000 and age < 35)*/

select *,
CASE 
    WHEN salary > 40000 and age < 35 THEN  'Eligible'
    ELSE  'Not Eligible'
END 
from employees
