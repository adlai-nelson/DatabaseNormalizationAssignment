# Database Normalization Assignment: IDCE 376 Assign. 2
Adlai Nelson 


## Introduction

The purpose of this assignment was to be familiarized with 1NF and 2NF form, and how to deal with relations in postgreSQL. 
We learned how to define foreign and primary keys, and what those relations mean, and continued to build skills in troubleshooting.
For the purposes of the assignment, a simple demo table was used, and new tables were created to beecome 1NF and 2NF compliant data structures.

## Methods

I used PGAdmin 4 for postgreSQL to complete this assignment. 
Some values were inserted from the originally created tables using a query, while some were manually inserted
(see scripts.sql for specific scrips and comments).

## Results

### 1NF
To format our data in 1NF, two tables were required: Parks, and Facilities

![Parks table in 1NF](/Figures/parks-1nf.png)

Parks table in 1NF. Each column contains only one entry, the name of the park

![Facilities table in 1NF](/Figures/facilities-1nf.png)

Facilities table in 1NF. Note the foreign key identifying wich park each facility belongs to. Note also each facilities ID corresponds to only one entry in the names field.

### 2NF
To format our data in 2NF, three tables were required: Parks, Facilities, and Parkfacilities

![Parks table in 2NF](/Figures/parks-2nf.png)

Parks table in 2NF. 

![Facilities table in 2NF](/Figures/facilities-2nf.png)

Facilities table in 2NF. Note how there is a foreign key 'parkfacilityID', linked to the park facilities table. This eliminates partial dependencies.

![Parkfacilities table in 2NF](/Figures/parkfacilities-2nf.png)

Parkfacilities table in 2NF Each parkfacilitiesID corresponds to one name value