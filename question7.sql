-- 7.	Which state had fires only in the second half of the calendar years?



select distinct(fire.state) from 
fire 
Join fire_date
ON fire_date.DISCOVERY_DATE = fire.DISCOVERY_DATE
where fire_date.DISCOVERY_DOY >183  AND not fire_date.DISCOVERY_DOY <= 183;