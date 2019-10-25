select DATE_PART('year',occurred_at) as "Year",sum(total_amt_usd)
from orders
group by "Year"
