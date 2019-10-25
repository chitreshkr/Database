select acc.name as "Account Name",(avg(o.standard_amt_usd)/avg(standard_qty+ 0.01)) as "Standard Amount per unit",(avg(o.gloss_amt_usd)/avg(standard_qty+ 0.01)) as "Gloss Amount per Unit",(avg(o.poster_amt_usd )/avg(standard_qty+ 0.01)) as "Poster Amount Per Unit"
from accounts acc
JOIN orders o
ON acc.id = o.account_id
group by acc.name
