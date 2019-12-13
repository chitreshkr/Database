-- 5.	How many wildfires were reported by at least two units/agencies?

select count(UnitId) as Unitcount,FPA_ID from fire
group by FPA_ID
Having Unitcount >= 2
Limit 1885000;