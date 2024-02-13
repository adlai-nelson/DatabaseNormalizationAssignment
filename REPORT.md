# Database Normalization Assignment: IDCE 376 Assign. 2
## Adlai Nelson 


## Introduction

The purpose of this assignment was to be familiarized with 1NF and 2NF form, and how to deal with relations in postgreSQL.

## Methods


## Results

To format the data in 1NF, two tables were required. 

![Table in 1NF form](/Figures/facilities-1nf.png)

```
CREATE TABLE Parks_Info (
    ID SERIAL PRIMARY KEY,
    ParkName VARCHAR(255),
    Facilities VARCHAR(255) 
);
```