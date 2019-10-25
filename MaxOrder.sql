select acc.name as "Account Name",count(o.id) as "Count"
from accounts acc
JOIN orders o
ON acc.id = o.account_id
group by acc.name
having count(o.id)>5
order by "Count" Desc
LIMIT 1
