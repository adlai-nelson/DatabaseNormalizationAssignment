# Database Normalization Assignment: IDCE 376 Assign. 2
Adlai Nelson 


## Introduction

The purpose of this assignment was to be familiarized with 1NF and 2NF form, and how to deal with relations in postgreSQL. 
We learned how to define foreign and primary keys, and what those relations mean, and continued to build skills in troubleshooting.
For the purposes of the assignment, a simple demo table was used, and new tables were created to beecome 1NF and 2NF compliant data structures.

## Methods

I used PGAdmin 4 for postgreSQL to complete this assignment. 
Some values were inserted from the originally created tables using a query, while some were manually inserted
(see scripts.sql for full scripts and comments).

To normalize the tables to 1NF, I created a new 'parks' table with only the park name and parkid. 
Initially, the park names were assigned to different parkIDs than the original table. To solve this, 
I used the `ORDER BY` command to order the park names by alphabetical order and assign them to their parkIDs in a reproducable manner. 
I then created the facilities table, manually inputing facilities, along with the corresponding ParkID as a foreign key. 
This resulted in a data structure where each entry is atomic (indivisible), making it compliant with 1NF.

To normalize the data to 2NF, I retained the same parks table. 
To remove partial dependencies, a new parkfacilities table needed to be created, containing the names of the park faciltities. 
Once this table was created, unique park facilities names were inserted into the table. 
I again used the `ORDER BY` paramater to order the names by alphabetical order. 
This way I could know wich parkfacilitiesID was assigned to each name without even checking the table, as they were assigned in alphabetical order.
Next, parkfacilityIDs were added as a forign key to the to the facilities table, and the names column was removed.
The resulting data structure has no partial dependencies, so it is 2NF compliant.

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

Parkfacilities table in 2NF. Each parkfacilitiesID corresponds to one name value.