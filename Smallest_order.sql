select acc.name as "Account Name",min(o.total_amt_usd) as "Smallest Order"
from accounts acc
JOIN orders o
ON acc.id = o.account_id
group by acc.name
order by "Smallest Order"
