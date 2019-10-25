select reg.name as "Region",count(sr.id) as "Sales Number"
from sales_reps sr
JOIN region reg
ON sr.region_id = reg.id
group by reg.name
