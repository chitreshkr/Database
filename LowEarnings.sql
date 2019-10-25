select acc.name as "Account Name",sum(total_amt_usd) as "Total Amount"
from accounts acc
JOIN orders o
ON acc.id = o.account_id
group by acc.name
having sum(total_amt_usd) < 1000
order by "Total Amount" Desc
