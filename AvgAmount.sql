select acc.name as "Account Name",avg(o.standard_amt_usd) as "Standard Amount",avg(o.gloss_amt_usd) as "Gloss Amount",avg(o.poster_amt_usd ) as "Poster Amount"
from accounts acc
JOIN orders o
ON acc.id = o.account_id
group by acc.name
