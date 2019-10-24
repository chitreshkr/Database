select count(channel),channel
from web_events
group by channel
