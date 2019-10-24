select DISTINCT acc.name,w.channel
from accounts acc
JOIN web_events w
ON acc.id = w.account_id
