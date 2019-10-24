select max(w.occurred_at) as "Date",w.channel as "Channel",acc.name as "Account Name"
from accounts acc
JOIN web_events w
ON acc.id = w.account_id
group by w.channel,acc.name
