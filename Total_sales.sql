select acc.name as "Company",sum(o.total) as "Total Sales"
from accounts acc
JOIN orders o 
ON acc.id = o.account_id
group by acc.name
order by acc.name
