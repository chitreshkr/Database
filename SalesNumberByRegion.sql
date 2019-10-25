select w.channel as "Channel Type",reg.name as "Region",count(sr.id) as "Number of occurrences"
from accounts acc
JOIN web_events w
ON w.account_id = acc.id
JOIN sales_reps sr
ON sr.id = acc.sales_rep_id
JOIN region reg
ON sr.region_id = reg.id
group by w.channel,reg.name
order by "Number of occurrences" DESC
