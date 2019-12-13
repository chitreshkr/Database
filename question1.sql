-- A leading beverage company has announced a billion-dollar fund for removing debris from forests,
-- rivers and mountains in the US. All states are interested.Which 2 states have the least chance to win 
-- a share of the fund?

use mydbs;
select * from fire;

select Count(fire.fpa_id) as fpi_count,fire.state from statistical_cause sc 
Join Fire
On sc.STAT_CAUSE_CODE = fire.STAT_CAUSE_CODE
where STAT_CAUSE_DESCR like "%Debris%";


select fire.state,count(fire.fpa_id) as fire_count from statistical_cause sc 
Join Fire
On sc.STAT_CAUSE_CODE = fire.STAT_CAUSE_CODE
where STAT_CAUSE_DESCR like "%Debris%"
group by fire.state
order by fire_count
limit 2;

