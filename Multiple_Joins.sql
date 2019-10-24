select e.occurred_at as Time,acc.primary_poc as POC ,e.channel,acc.name
from accounts as acc
Join web_events as e
ON acc.id = e.account_id
where acc.name = 'Walmart'
