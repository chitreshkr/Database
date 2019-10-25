select acc.name as "Account Name",count(o.id)
from accounts acc
JOIN orders o
ON acc.id = o.account_id
group by acc.name
having count(o.id)>5
