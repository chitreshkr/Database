# Database Project


<h1>Contents</h1>
Data Model	5
Assumptions/Notes About Data Entities and Relationships	5
Entity-Relationship Diagram	5
Physical Database	6
Assumptions/Notes About Data Set	6
Screen shot of Physical Database objects	6
Data in the Database	6
SQL Queries	7
Query 1	7
Question	7
Notes/Comments About SQL Query and Results (Include # of Rows in Result)	7
Translation	7
Screen Shot of SQL Query and Results	7
Query 2	8
Question	8
Notes/Comments About SQL Query and Results (Include # of Rows in Result)	8
Translation	8
Screen Shot of SQL Query and Results	8
Query 3	9
Question	9
Notes/Comments About SQL Query and Results (Include # of Rows in Result)	9
Translation	9
Screen Shot of SQL Query and Results	9
Query 4	10
Question	10
Notes/Comments About SQL Query and Results (Include # of Rows in Result)	10
Translation	10
Screen Shot of SQL Query and Results	10
Query 5	11
Question	11
Notes/Comments About SQL Query and Results (Include # of Rows in Result)	11
Translation	11
Screen Shot of SQL Query and Results	11
Query 6	12
Question	12
Notes/Comments About SQL Query and Results (Include # of Rows in Result)	12
Translation	12
Screen Shot of SQL Query and Results	12
Data Review for MongoDB	13
Assumptions/Notes About Data Collections, Attributes and Relationships between Collections	13
Physical Mongo Database	14
Assumptions/Notes About Data Set	14
Screen shot of Physical Database objects (Database, Collections and Attributes)	14
Data in the Database	14
MongoDB Queries/Code	15
Query 1	15
Question	15
Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)	15
Translation	15
Screen Shot of MongoDB Query/Code and Results	15
Query 2	16
Question	16
Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)	16
Translation	16
Screen Shot of MongoDB Query/Code and Results	16
Query 3	17
Question	17
Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)	17
Translation	17
Screen Shot of MongoDB Query/Code and Results	17
Query 4	18
Question	18
Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)	18
Translation	18
Screen Shot of MongoDB Query/Code and Results	18
Query 5	19
Question	19
Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)	19
Translation	19
Screen Shot of MongoDB Query/Code and Results	19
Query 6	20
Question	20
Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)	20
Translation	20
Screen Shot of MongoDB Query/Code and Results	20

 
Data Model
Assumptions/Notes About Data Entities and Relationships
Include assumptions about data entities and their relationships with each other.
Include reasons why the data model is in 3NF.
1)	Every individual fire incident can be reported from only one major source dates
2)	Every single location can have only one land owner and an owner can have lands at many locations
3)	Data time stamps are irrespective of time zones and all the recorded are in same time zone
4)	NWCG is considered as major primary organization of data source
5)	MTBS dataset is considered as secondary dataset
6)	Statistical cause of fire can be only one type
7)	One reporting agency has multiple units 
8)	One fire must have one control date, but one controlled date can be used by many fires

The model is in 3NF because the functional dependency has been removed by creating different tables from fire table. Owner description is dependent on the owner code and depends on the location, so we connected location and the owner . Fire_code ,ICS Incident Number, ICS Name ,Local Incident ID ,Local Fire Report ID has Null values so we have kept it in the fire table only because we can’t fetch the data for all the records.


Entity-Relationship Diagram
 

Physical Database
Assumptions/Notes About Data Set
Include any assumptions made about data such as empty fields, sparse data, bad data, etc.
1)	Null values have been found in more than 5 columns. That is; Fire_code, ICS_209, Incident_number and Name, MTBS_ID, MTBS_FIRE_NAME, County, FIPS_CODE, FIPS_NAME.
2)	NWCG_REPORTING_UNIT_NAME and similarly, SOURCE_REPORTING_UNIT_NAME have multiple multivalued rows
3)	FIRE can be reported by only unit_ID
4)	One unit can have multiple departments
5)	One agency has multiple units
6)	Multiple agencies can be at one location
7)	One department has multiple units
8)	A fire is reported with NWCG unit



Screen shot of Physical Database objects
 
 
Data in the Database
Table Name	Primary Key	Foreign Key	# of Rows in Table
Fire 	FOD_ID	FPA_ID, STAT_CAUSE_CODE, OWNER_CODE, MTBS_ID, CONT_DATE, DISCOVERY_DATE, UnitId , StateCounty	23
Controlled_date	CONT_DATE		2
Fire_date	DISCOVERY_DATE		3
Location	State,County		4
MTBS	MTBS_ID		2
Nwcg	UnitId		11
Owner	Owner_code		2
Source	FPA_ID		5
Statistical Cause	Stat_cause_code		2

##SQL Queries
Query 1
1.	A leading beverage company has announced a billion-dollar fund for removing debris from forests, rivers and mountains in the US. All states are interested. Which 2 states have the least chance to win a share of the fund?

Notes/Comments About SQL Query and Results (Include # of Rows in Result)
ASSUMPTIONS:
Here, the leading beverage company would most likely give the fund to the states which have the highest count of fires caused by debris. The reason behind this is that those states can use the fund to clean the debris and minimize the fires caused due to it. We have to find out 2 of the states with the least chance of winning the fund.
These are: DC and PR, with a fire count of 2 and 4, respectively,
Number of Rows: 2

Translation
-- select state from fire table, count total fpa id from fire table and name Fire_Count
-- join stat cause code from fire table and stat cause code from statistical cause table as SC
-- condition on cause Debris
-- arrange by state from fire table
-- order by the total count
-- show 2 such information
Clean up:
-- SELECT STATE FROM FIRE, COUNT FPA_ID AS Fire_Count
-- FROM statistical_cause SC
-- JOIN FIRE
-- ON SC STAT_CAUSE_CODE = FIRE STAT_CAUSE_CODE
-- WHERE STAT_CAUSE_DESCR LIKE %DEBRIS%
-- GROUP BY FIRE STATE
-- ORDER BY Fire_Count
-- LIMIT 2

Screen Shot of SQL Query and Results

 
 
Query 2
One of the reporting agencies has suggested that children be banned from its forests unless there is one adult for every 4 children in a group visiting a forest. Name top 5 forests where this would be the least appropriate.


Notes/Comments About SQL Query and Results (Include # of Rows in Result)
ASSUMPTIONS:
Here we need to find top 5 forests where the count of fires caused by children is the lowest. Such forests would make the new rule of having 1 adult for every 4 children visiting, least appropriate. 
These forests are: Siskiyou National Forest, Nicolet National Forest, Colville National Forest, Modoc National Forest and George Washington and Jefferson National Forest.
Number of Rows: 5

Translation
-- select course reporting unit name from source table as fs, vount total fod id from fire table as Fire_Count 
-- join statistical cause table on stat cause code from fire table and stat cause code from statistical cause table
-- join source table on fpa id from fire and fpa id from source table
-- condition on stat cause description including children
-- and the source reporting unit name to include word Forest
-- arrange by source reporting name from source table
-- order by the total fire count
-- limit to 5 such forests
Clean up
-- SELECT SOURCE_REPORTING_UNIT_NAME FROM FS, COUNT FIRE FOD_ID AS Fire_Count
-- FROM fire JOIN statistical_cause S ON fire.STAT_CAUSE_CODE = S STAT_CAUSE_CODE
-- JOIN SOURCE ON fire FPA_ID = FS FPA_ID
-- WHERE STAT_CAUSE_DESCR LIKE %Children% AND SOURCE_REPORTING_UNIT_NAME LIKE %Forest
-- GROUP BY SOURCE_REPORTING_UNIT_NAME
-- ORDER BY Fire_Count LIMIT 5

Screen Shot of SQL Query and Results

 
 
Query 3
One advocacy group says human actions and nature are equally to blame for most wildfires. Write a query that can help determine the truth of this statement.


Notes/Comments About SQL Query and Results (Include # of Rows in Result)
We have to prove the statement that the fires caused by both human actions and by nature are equal. 
Number of Rows: 5
Assumption:
We have considered lightning as natural cause .We have considered the causes other than miscellaneous ,lightning and Undefined as Human.

Translation
-- select stat cause code from fire table, count total fod id from fire table as fire_count, stat cause description from stat table 
-- from fire join statistical cause on stat cause code from stat table and fire table
-- arrange by the stat cause code
-- order by the total fire count in descending order
-- limit to 5 such results
-Cleanup
-- SELECT STAT_CAUSE_CODE FROM FIRE, COUNT(FOD_ID) FROM FIRE AS Fire_Count, STAT_CAUSE_DESCR FROM STAT
-- FROM FORE JOIN statistical_cause AS STAT ON STAT STAT_CAUSE_CODE = FIRE STAT_CAUSE_CODE
-- GROUP BY STAT_CAUSE_CODE
-- ORDER BY Fire_Count DESC LIMIT 5

 

 



Query 4
What were the forests that had only one fire that lasted more than two days?

Notes/Comments About SQL Query and Results (Include # of Rows in Result)
ASSUMPTIONS
Here we need to find the name of forests that only have 1 fire AND which took more than two days to contain after discovered.
Number of Rows = 196

Translation
-- select source reporting name from source table 
-- from fire table as f join source table as s on fpa id
-- condition on contained date minus discovery date to be greater than 2
-- arrange by the source reporting unit name
clean up
-- SELECT SOURCE_REPORTING_UNIT_NAME FROM SOURCE
-- FROM fire AS F JOIN source AS S ON FPA_ID FROM F AND FPA_ID FROM S
-- WHERE CONT_DATE - DISCOVERY_DATE > 2
-- GROUP BY S SOURCE_REPORTING_UNIT_NAME
-- HAVING COUNT (*) 1







Query 5
-- How many wildfires were reported by at least two units/agencies?
Notes/Comments About SQL Query and Results (Include # of Rows in Result)
We have included the wildfires which had unit/agencies more than and equal to 2
Translation
--Select firename from fire
--SELECT count of source reporting unit name from source
--use the count condition where it is more than and equal to 2
--use this query as subquery and extract the count of fire
CleanUp
--use mydbs;
--Select count(*) as fires_count from
--(select f.FIRE_NAME, count(SOURCE_REPORTING_UNIT_NAME) as units_reported
--from fire as f join source as s
--on f.FPA_ID = s.FPA_ID
--group by f.FIRE_NAME having units_reported >= 2) as fs;
Screen Shot of SQL Query and Results
 
 
Query 6
Which state had fires only in the second half of the calendar years?


Notes/Comments About SQL Query and Results (Include # of Rows in Result)
ASSUMPTIONS:
Here we need to find the number of states where fires occurred only in the 2nd half of the year.
So we have taken day of year before 365/2 = 183 approximately and then checked our criteria in the query.
Number of Rows = 52

Translation
-- select states from fire table with one of each
-- from fire table join table fire date on the discovery dates
-- condition on discovery doy greater than 183 and not less than equal to 183
cleanup
-- SELECT DISTINCT STATE FROM FIRE
-- FROM FIRE JOIN FIRE_DATE ON DIRE_DATE DISCOVERY DATE = FIRE DISCOVERY DATE
-- WHERE DISCOVERY_DOY > 183 AND NOT <= 183

Screen Shot of SQL Query and Results
 


Data Review for MongoDB
Assumptions/Notes About Data Collections, Attributes and Relationships between Collections

Include assumptions about data entities and their relationships with each other.
1)	Every individual fire incident can be reported from only one major source dates
2)	Every single location can have only one land owner and an owner can have lands at many locations
3)	Data time stamps are irrespective of time zones and all the recorded are in same time zone
4)	NWCG is considered as major primary organization of data source
5)	MTBS dataset is considered as secondary dataset
6)	Statistical cause of fire can be only one type
7)	One reporting agency has multiple units 
8)	One fire must have one control date, but one controlled date can be used by many fires



Here we have considered fire and nwcg collections for querying our data .The Nwcg and fire are related using the Unit ID.

Physical Mongo Database
Assumptions/Notes About Data Set
Include any assumptions made about data such as empty fields, sparse data, bad data, etc.
1)	Null values have been found in more than 5 columns. That is; Fire_code, ICS_209, Incident_number and Name, MTBS_ID, MTBS_FIRE_NAME, County, FIPS_CODE, FIPS_NAME.
2)	NWCG_REPORTING_UNIT_NAME and similarly, SOURCE_REPORTING_UNIT_NAME have multiple multivalued rows
3)	One unit can have multiple departments
4)	One agency has multiple units
5)	Multiple agencies can be at one location
6)	One department has multiple units
7)	A fire is reported with NWCG unit



 
Data in the Database
Collection Name	Relationshps With Other Collections (if any)	# of Documents in Collection
Fire 	NWCG_Reporting_Unit_ID	1880465
NWCG	NWCG_Reporting_Unit_ID	5867


MongoDB Queries/Code
Query 1
A leading beverage company has announced a billion-dollar fund for removing debris from forests, rivers and mountains in the US. All states are interested. Which 2 states have the least chance to win a share of the fund?

Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)
Here, the leading beverage company would most likely give the fund to the states which have the highest count of fires caused by debris. The reason behind this is that those states can use the fund to clean the debris and minimize the fires caused due to it. We have to find out 2 of the states with the least chance of winning the fund.
# of Rows: 2

Translation
-- $project STATE FROM FIRE, COUNT FPA_ID AS Fire_Count
-- FROM statistical_cause SC
-- $lookup FIRE
-- ON SC STAT_CAUSE_CODE = FIRE STAT_CAUSE_CODE
-- $match STAT_CAUSE_DESCR LIKE %DEBRIS%
-- $group FIRE STATE
-- $sort Fire_Count
-- $LIMIT 2

 

Query 2
One of the reporting agencies has suggested that children be banned from its forests unless there is one adult for every 4 children in a group visiting a forest. Name top 5 forests where this would be the least appropriate.


Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)
ASSUMPTIONS:
Here we need to find top 5 forests where the count of fires caused by children is the lowest. Such forests would make the new rule of having 1 adult for every 4 children visiting, least appropriate. 
Number of Rows: 5

Translation
-- $project SOURCE_REPORTING_UNIT_NAME FROM FS, COUNT FIRE FOD_ID AS Fire_Count
-- FROM fire JOIN statistical_cause S ON fire.STAT_CAUSE_CODE = S STAT_CAUSE_CODE
-- $lookup SOURCE ON fire FPA_ID = FS FPA_ID
-- $match STAT_CAUSE_DESCR LIKE %Children% AND SOURCE_REPORTING_UNIT_NAME LIKE %Forest
-- $group SOURCE_REPORTING_UNIT_NAME
-- $sort Fire_Count $LIMIT 5


 
Query 3
One advocacy group says human actions and nature are equally to blame for most wildfires. Write a query that can help determine the truth of this statement.

Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)
We have to prove the statement that the fires caused by both human actions and by nature are equal.

Translation
-- $project STAT_CAUSE_CODE FROM FIRE, COUNT(FOD_ID) FROM FIRE AS Fire_Count, STAT_CAUSE_DESCR FROM STAT
-- FROM FORE JOIN statistical_cause AS STAT ON STAT STAT_CAUSE_CODE = FIRE STAT_CAUSE_CODE
-- $group STAT_CAUSE_CODE
-- $sort Fire_Count DESC $LIMIT 5

Screen Shot of MongoDB Query/Code and Results

 
Query 4
What are the top two unit types that reported wildfires in each state in the US?


Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)
Here we have to find the top 2 unit types that reported wildfires in each of the states in the US.
These units are NONFED and FED

Translation
--Project id 
--Aggregate source system type, count total sum
--Sort by 1 
--Limit would be 2


Screen Shot of MongoDB Query/Code and Results
 

Query 5
How many wildfires were reported by at least two units/agencies?


Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)

Translation


Screen Shot of MongoDB Query/Code and Results

 

Query 6
Which forest had the number of fires equal to the average number of wild fires in the US?


Notes/Comments About MongoDB Query/Code and Results (Include # of Documents in Result)
Average was calculated to be 1150.

Translation

Screen Shot of MongoDB Query/Code and Results

 


