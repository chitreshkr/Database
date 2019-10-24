select reg.name as "Region",sr.name as "Sales Person",acc.name as "Account Name"
from accounts acc
JOIN sales_reps sr
ON acc.sales_rep_id = sr.id
JOIN region reg
ON sr.region_id = reg.id
where reg.name = 'Midwest' and sr.name LIKE 'S%'
ORDER BY acc.name
