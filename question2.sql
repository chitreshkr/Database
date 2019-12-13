


SELECT Count(f.fod_id), fs.source_reporting_unit_name FROM fire f 
join statistical_cause s on 
f.stat_cause_code = s.stat_cause_code 
join source fs 
on f.fpa_id = fs.fpa_id 
where s.stat_cause_descr like "%Children%" 
and fs.source_reporting_unit_name like "%Forest" 
group by fs.source_reporting_unit_name 
order by count(f.fod_id) ASC LIMIT 5;
