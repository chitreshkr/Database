## US Wildfire Database Project

# Database Project


### Entity-Relationship Diagram
![ER](https://user-images.githubusercontent.com/8807772/109067169-c28a5000-76b3-11eb-9b66-b488ae7b1c4e.png)

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

The model is in 3NF because the functional dependency has been removed by creating different tables from fire table. Owner description is dependent on the owner code and depends on the location, so we connected location and the owner . Fire_code ,ICS Incident Number, ICS Name ,Local Incident ID ,Local Fire Report ID has Null values so we have kept it in the fire table only because we can't fetch the data for all the records.


### Physical Database
##### Assumptions/Notes About Data Set
Include any assumptions made about data such as empty fields, sparse data, bad data, etc.
1)	Null values have been found in more than 5 columns. That is; Fire_code, ICS_209, Incident_number and Name, MTBS_ID, MTBS_FIRE_NAME, County, FIPS_CODE, FIPS_NAME.
2) NWCG_REPORTING_UNIT_NAME and similarly, SOURCE_REPORTING_UNIT_NAME have multiple multivalued rows
3)	FIRE can be reported by only unit_ID
4)	One unit can have multiple departments
5)	One agency has multiple units
6)	Multiple agencies can be at one location
7)	One department has multiple units
8)	A fire is reported with NWCG unit



Screen shot of Physical Database objects

![Physical_database](https://user-images.githubusercontent.com/8807772/109067567-4cd2b400-76b4-11eb-86ec-74e1213c650b.jpg)

### Data in the Database

![Keys](https://user-images.githubusercontent.com/8807772/109067968-dc786280-76b4-11eb-88f1-ff5632fd2882.PNG)


