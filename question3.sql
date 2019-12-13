use mydbs;
select * from location
limit 4500;


select source_system_type,source_system from source;

select fire.Stat_cause_code,count(fire.FOD_ID) as fire_count,stat.STAT_CAUSE_DESCR from fire
join 
statistical_cause as stat
ON stat.STAT_CAUSE_CODE = fire.STAT_CAUSE_CODE 
group by Stat_cause_code
order by fire_count DESC
LIMIT 5;


