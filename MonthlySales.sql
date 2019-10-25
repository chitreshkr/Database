select DATE_PART('month',occurred_at) as "Month",sum(total_amt_usd)
from orders
group by "Month"
order by "Month"
