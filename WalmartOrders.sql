select DATE_PART('year',occurred_at) as "Year",DATE_PART('month',occurred_at) as "Month",acc.name as "Account",sum(total_amt_usd) as "Total Orders"
from orders o
Join accounts acc
ON acc.id = o.account_id
where acc.name = 'Walmart'
group by "Year","Account","Month"
order by "Year"
