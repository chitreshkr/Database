select sr.name as "Sales Representative",count(acc.id)
from accounts acc
JOIN sales_reps sr
ON acc.sales_rep_id = sr.id
group by sr.name
having count(acc.id)>5
