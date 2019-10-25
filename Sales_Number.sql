select w.channel as "Channel Type",sr.name as "Sales Representive",count(sr.id) as "Number of occurrences"
from accounts acc
JOIN web_events w
ON w.account_id = acc.id
JOIN sales_reps sr
ON sr.id = acc.sales_rep_id
group by w.channel,sr.name
order by "Number of occurrences"
