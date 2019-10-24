select acc.name as "Account Name",min(w.occurred_at) as "Earliest Order"
from accounts acc
JOIN web_events w
ON acc.id = w.account_id
group by acc.name
order by acc.name
