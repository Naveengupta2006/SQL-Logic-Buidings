create table temp(
    id int,
    recordDate date,
    temp int
)

insert into temp(id, recordDate, temp)
VALUES
(1,'2015-01-01',10),
(2,'2015-01-02', 25),
(3,'2015-01-03',20),
(4,'2015-01-04',30)

-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

select id
from(
    select id,
            recordDate,
            temp,
            lag(temp) over(order by recordDate) as prev_temp,
            lag(recordDate) over (order by recordDate) as prev_date
    from temp
)t
where temp > prev_temp and DATEDIFF(recordDate, prev_date) = 1