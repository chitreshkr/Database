select reg.name as "Region",acc.name as "Account Name",(total_amt_usd/(total +0.01)) as "Unit Price" 
from orders o
JOIN accounts acc
ON o.account_id = acc.id
JOIN sales_reps sr
ON acc.sales_rep_id = sr.id
JOIN region reg
ON sr.region_id = reg.id
where standard_amt_usd > 100
