-- What were the forests that had only one fire that lasted more than two days?

use mydbs;
select Distinct(datediff(cd.CONT_DATE,fd.DISCOVERY_DATE)) as "Duration" from fire
Join controlled_date as cd 
ON fire.CONT_DATE = cd.CONT_DATE 
JOIN fire_date as fd
ON fire.DISCOVERY_DATE = fd.DISCOVERY_DATE;