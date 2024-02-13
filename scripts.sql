CREATE TABLE Parks_Info ( -- Create table
    ID SERIAL PRIMARY KEY, -- Create ID as primary key, with auto-incrimenting intiger
    ParkName VARCHAR(255), -- Create parkname variable
    Facilities VARCHAR(255) -- Create facilities variable 
);

INSERT INTO Parks_Info (ParkName, Facilities) VALUES -- Insert data into two variables
('Central Park', 'Playground, Restroom, Picnic area'), -- Insert data to first row
('Liberty Park', 'Restroom, Picnic area'), -- Data for second row
('Riverside Park', 'Playground, Bike Path'); -- Data for third row

-------------Normalize to 1NF-------------

-- Create tables in normalized form
CREATE TABLE Parks (  -- Create parks table
    ParkID SERIAL PRIMARY KEY, -- ParkID as primary key
    ParkName VARCHAR(255) -- Park name variable
);

CREATE TABLE Facilities (
    FacilityID SERIAL PRIMARY KEY, -- Create primary key
    ParkID INT, -- Create parkID variable to be used as foreign key
    FacilityName VARCHAR(255), -- Facility name variable
    FOREIGN KEY (ParkID) REFERENCES Parks(ParkID) -- Define foreign key reference table
);

-- Populate tables with data

INSERT INTO Parks (ParkName)
SELECT DISTINCT ParkName -- Slect unique park names from parks_info object
FROM Parks_info
ORDER BY ParkName; -- Order by park name results in the same order as input table

INSERT INTO Facilities (ParkID, FacilityName) VALUES -- Manually insert facility name and park IDs
(1, 'Playground'), 
(1, 'Restroom'), 
(1, 'Picnic Area'),
(2, 'Restroom'),
(2, 'Picnic Area'),
(3, 'Playground'),
(3, 'Bike Path');

-- View resulting tables in 1NF form
SELECT * FROM parks;  
SELECT * FROM facilities;

-------------Normalize to 2NF-------------

CREATE TABLE ParkFacilities( -- Create park facilities table 
FacilityID SERIAL PRIMARY KEY, -- FacilityID as primary key
FacilityName VARCHAR(255) -- Create Name Variable
);

INSERT INTO ParkFacilities (FacilityName) -- Insert data
SELECT DISTINCT facilityname -- Select unique facility names
FROM facilities 
ORDER BY facilityname; -- In alphabetical order

SELECT * FROM ParkFacilities; -- View table to get facility IDs
-- In this case, Bike Path is 1, Picnic Area is 2, Playground is 3, and restroom is 4

-- Add ParkFacilityID column to Facilities table
ALTER TABLE Facilities ADD COLUMN ParkFacilityID INT;

-- Define foreign ParkFacilityID in Facilities as related to ParkFacilies table
ALTER TABLE Facilities
ADD CONSTRAINT fk_parkfacilityid -- name the constraint
FOREIGN KEY (ParkFacilityID) -- define the column used as foreign key
REFERENCES ParkFacilities(FacilityID); -- Define the table and column it references

-- Populate facilitites table with correct FacilityID for every entry
UPDATE Facilities 
SET ParkFacilityID = (SELECT FacilityID FROM ParkFacilities 
					  WHERE FacilityName = Facilities.FacilityName); -- Select facilityIDs from corresponding facility v

ALTER TABLE Facilities DROP COLUMN facilityname; -- Remove unneccisary column

-- View finalized tables in 2NF form
SELECT * FROM parkfacilities;
SELECT * FROM facilities;
SELECT * FROM parks;