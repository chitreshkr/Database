select acc.name as "Account Name",sr.name AS "Representive Name",reg.name as "Region"
from accounts as acc
JOIN sales_reps as sr
ON acc.sales_rep_id = sr.id
JOIN region as reg
ON sr.region_id = reg.id
