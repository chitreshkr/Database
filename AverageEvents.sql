select "Channel",AVG("Event") as "Average Events"
from
(select DATE_TRUNC('day',occurred_at) as "Date",channel as "Channel",count(id) as "Event"
from web_events
group by 1,2) sub
group by 1
order by 2;
