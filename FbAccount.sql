select acc.name as "Account Name",
sum(acc.id) as "Number of user"
from accounts acc
JOIN web_events w
ON w.account_id = acc.id
where w.channel = 'facebook'
group by acc.name
having sum(acc.id) > 6
order by "Number of user" Desc
