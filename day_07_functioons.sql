use airline123;

/*
functions in  mysql are predefined operations that can be  used to perform calculations,manipulate data.
and retrieve specific information.these functions make it easier to work with strings,numbers,date and more
FUNCTIONS-->
1.built in functions (sum(),avg(),count()...)
2.user defined functions.

they are categorized as follow based on their functionally.alter
1.string functions:
these functions are ued to manipulte and process string data.
 length(str): return the length of a string.
 
 
 concate(str): str2...):concentanates two or more strings.
 uppper(str):converts a string to uppercase
 lower(str): converts  as tring a lowercase
 substring(str,start,length):return a substring from a string
 
 2.numeric functions :
 These functions perform opeartions on numeric data
 round(number,decimals): rounds a  number to aspecified numbers of decimal palces.
 floor(numbers):returns the largest integer greater than or equal  to anumber.
 abs(numbers) : returns the absolute value of a number
 
 3.DATE AND TIME FUNCTIONS:
 these functions are used to manipulte and formate date and time values.
 
 now(): returns the current date and time.
 curdate():return the current date
 date_foremat(date,formate):return a dtae according to a speciefied format.
 datediff(date1,date2): returns the difference in days  bewteeen two dates.
 
 4.AGGREGATE functions:
 These functions perform calcuylations on a set of vakes and return  a single values.
 
 count(expression): return the numbers of rows that match a specified  conditions.
 sum(columns): return the sum of a numberic column
 avg(columns):return the aveage value of a numeric columns.
 max(columns):returen the maximum values of  a column
 min(columns):returen the minimum values of  a column
 
 5.control flow functions
 These functions alloews  for condtional 1 logic in sql queries
 IF(condition,true_value,false_value): return one value if the condition is true and another value
 
 case: provides a way to perfoem conditional logic in amore complex  manner
 if it is a false.
 
 6.conversion functons:
 
 These functions convert data  from one type  to another
  CAST(expression as type): converts an expresiions  to a specific data type.
  CONVCERT(expression ,type): similar to CAST,but with different syntax.
  
  7.json functions:
  these functions are used to work with json data types.
  JSON_extract(json_doc,path): extracts data from a json document.
  JSON_ARRAYAGG(value): aggregrates values into a  json array.
 
 8.user-defined functions (udfs)
 mysql allows to create theier own function for specific tasks.
 
 */
 -- STRING FUNCTIONS:
 -- 1 .convert flight numbers to uppercase
 select UPPER(Flight_Number) as uppercase_flight_numbers  from flights;
 select * from flights;
 -- 2 .covert deperatire airport names to lowercase
 select lower(Departure_Airport) as lowercase from flights;
 -- 3.concentenate flight numbers and departure airports
 select concat(Flight_Number,'-',Departure_Airport) as concate_flihght from flights;
 -- 4.get length of flight numbers
 select Flight_Number,length(Flight_Number) as length_flight from flights;
 -- 5 get length of deprtire airport names
  select Departure_Airport,length(Departure_Airport) as lenth_deperature from flights;
  -- 6.extract substring from flight numbers
  select Flight_Number,substring(Flight_Number,2,3) as substring from flights;
  -- 7.find flights with flight numbers starting with 'AI'
  select * from flights where Flight_Number like 'AI';
  -- 8.find flights with departure airport containing ''Delhi (DEL)'
  select * from flights where Departure_Airport like 'Delhi';
  -- 9.replace 'Delhi' with 'newdelhi' in departure airports
  select Flight_Number,replace(Departure_Airport,'Delhi','newdelhi') as updated_function from flights;
  -- 10.find flights with flights numbers ending in '01'
  select * from flights where Flight_Number like '%01';
  -- 11.count the nujbers of flights with 'boeing' in aircraft type
  select count(*) as boeing_flight_count from flights;
  -- 12. find flights with arribval airports starting  with 'M'
  select * from flights where Arrival_Airport like 'M%';
  -- 13. get the first character of each flight numbers
  select Flight_Number,left(Flight_Number,1) as first_char from flights;
  -- 14. get the last charcter of each arrival airport name
   select Arrival_Airport,right(Arrival_Airport,1) as last_char from flights;
   -- 15.find flights with airctft types that are ecxactly 10 charcaters long
   select * from flights where  length(Aircraft_Type) = 10;
   -- 16.find floghts with flight numbees that are not in uppercase
   select * from flights where binary flight_number !=upper(Flight_Number);
   -- 17.find floights with departute airports that are not in lower case
   select * from flights where binary Departure_Airport !=lower(Departure_Airport);
   -- 18.conecntenate floight numbers ,departure and arrival airports
   select concate(Flight_Number,'from',Departure_Airport,'to',Arrival_Airport)
   as flight_full_info from flights;
   -- 19.find flights with aircraft types that contain 'A320'
   select * from flights where Aircraft_Type like '%A320%';
   -- 20.het the postions of 'AI' in flight numbers
   select flight_number,locate('AI',flight_number) as postion_of_ai from flights;
   #=============================================================================================
   -- numeric functions
   -- 1.caculate the avearge flight duration
   select avg(Flight_Duration) as average_floght_duration from flights;
   -- 2.calculte the total numbers of seats available
  select sum(Seats_Available)as sum_total_seats from flights;
  -- 3.find the longest flight duration
  select max(Flight_Duration) as longest_flight_duration from flights;
  -- 4. find the shortest flight of duration
  select min(Flight_Duration) as shortest_flight_duration from flights;
  -- 5.count the total numbers of flights
  select count(*) as total_count from flights;
  -- 6.calculate the averaghe number of avaikable seats per flights
  select avg(Seats_Available) as average_seats from flights;
  -- 7.find the total flights duration for all flights 
  select sum(Flight_Duration) as sum_flight_duration from flights;
  -- 8.countthe numbesr of flight with more than 50 seats available
  select count(*) as flight_count from flights where Seats_Available>50;
  
  -- 9.calculate the average flight duration for flight depoarting from delhi
  select avg(Flight_Duration) as average_flight_duartion from flights where Departure_Airport ='Delhi (DEL)';
  -- 10 find the total numbers of flights to mumbai
  select count(*) as count from flights where Arrival_Airport = 'Mumbai(BOM)'; 
  
  -- 11. CALCULATE the percentage of flights that are on time
  select (count(*) / (select count(*) from flights)) * 100 as percentage_on_time#==============doubt=======================
  from flights where Status = 'On Time';
  -- 12. find the avearge flight duration for delayed flights 
  select avg(Flight_Duration) as avearge_deleyed from flights where Status = 'Delayed';
  -- 13. count the numbers of flights for each aircraft type
  select Aircraft_Type ,count(*) as flight_coiunt from flights group by Aircraft_Type;
  -- 14.calcaulate  the total number of seats avilable for flights to chennai
  select sum(seats_Available) as total_seats from flights where Arrival_Aircraft = 'Chennai(MAA)';
  
-- 15. Find the Average Flight Duration for Flights Arriving in Kolkata
SELECT AVG(Flight_Duration) AS Average_Flight_Duration_Kolkata FROM Flights 
WHERE Arrival_Airport = 'Kolkata (CCU)';

-- 16. Find the Maximum Number of Available Seats on a Single Flight
SELECT MAX(Seats_Available) AS Max_Seats_On_A_Flight FROM Flights;

-- 17. Calculate the Total Number of Flights Departing from Each Airport
SELECT Departure_Airport, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Departure_Airport;

-- 18. Find the Average Number of Seats Available for Flights that are Cancelled
SELECT AVG(Seats_Available) AS Average_Seats_Cancelled FROM Flights WHERE Status = 'Cancelled';

-- 19. Calculate the Total Flight Duration for Flights with Status 'On Time'
SELECT SUM(Flight_Duration) AS Total_On_Time_Flight_Duration FROM Flights WHERE Status = 'On Time';

-- 20. Count the Number of Flights with a Duration Greater Than 180 Minutes
SELECT COUNT(*) AS Flights_Over_3_Hours FROM Flights WHERE Flight_Duration > 180;

-- Date and Time Functions
use airline123;
select * from flights;
-- Extracts the date from the departure time
SELECT DATE(Departure_Time) AS Departure_Date FROM Flights; 

-- Extracts the time from the departure time
SELECT TIME(Departure_Time) AS Departure_Time FROM Flights; 

-- Calculates the flight duration in minutes
SELECT TIMESTAMPDIFF(MINUTE, Departure_Time, Arrival_Time) AS Flight_Duration_Minutes FROM Flights; 
SELECT TIMESTAMPDIFF(HOUR, Departure_Time, Arrival_Time) AS Flight_Duration_hours FROM Flights; 
SELECT TIMESTAMPDIFF(SECOND, Departure_Time, Arrival_Time) AS Flight_Duration_second FROM Flights; 

-- Calculates the flight duration in date
SELECT TIMESTAMPDIFF(MONTH, Departure_Time, Arrival_Time) AS Flight_Duration_month FROM Flights; 
SELECT TIMESTAMPDIFF(DAY, Departure_Time, Arrival_Time) AS Flight_Duration_day FROM Flights; 
SELECT TIMESTAMPDIFF(YEAR, Departure_Time, Arrival_Time) AS Flight_Duration_year FROM Flights; 

-- Aggregate Functions

-- 1. Count the Total Number of Flight
SELECT COUNT(*) AS Total_Flights FROM Flights;

-- 2. Count the Number of Unique Departure Airports
SELECT COUNT(DISTINCT Departure_Airport) AS Unique_Departure_Airports FROM Flights;

-- 3. Concatenate Distinct Flight Numbers
SELECT GROUP_CONCAT(DISTINCT Flight_Number) AS Flight_Numbers FROM Flights;

-- 4. Count the Number of Flights by Status
SELECT Status, COUNT(*) AS Flight_Count 
FROM Flights 
GROUP BY Status;

-- 5. Calculate the Average Number of Seats Available Across All Flights
SELECT AVG(Seats_Available) AS Average_Seats_Available FROM Flights;

-- 6. Find the Maximum Flight Duration
SELECT MAX(Flight_Duration) AS Longest_Flight_Duration FROM Flights;

-- 7. Find the Minimum Flight Duration
SELECT MIN(Flight_Duration) AS Shortest_Flight_Duration FROM Flights;

-- 8. Calculate the Total Number of Available Seats Across All Flights
SELECT SUM(Seats_Available) AS Total_Seats_Available FROM Flights;

-- 9. Count the Number of Flights for Each Arrival Airport
SELECT Arrival_Airport, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Arrival_Airport;

-- 10. Calculate the Average Flight Duration for All Flights
SELECT AVG(Flight_Duration) AS Average_Flight_Duration FROM Flights;

-- 11. Count the Number of Flights Departing from Each Airport
SELECT Departure_Airport, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Departure_Airport;

-- 12. Find the Total Flight Duration for All Flights
SELECT SUM(Flight_Duration) AS Total_Flight_Duration FROM Flights;

-- 13. Count the Number of Flights with More Than 100 Seats Available
SELECT COUNT(*) AS Flights_With_Over_100_Seats FROM Flights WHERE Seats_Available > 100;

-- 14. Calculate the Average Flight Duration for Flights Departing from Delhi
SELECT AVG(Flight_Duration) AS Average_Flight_Duration_Delhi FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- 15. Count the Number of Unique Aircraft Types
SELECT COUNT(DISTINCT Aircraft_Type) AS Unique_Aircraft_Types FROM Flights;

-- 16. Find the Total Number of Flights for Each Aircraft Type
SELECT Aircraft_Type, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Aircraft_Type;

-- 17. Calculate the Average Number of Seats Available for Flights that are Cancelled
SELECT AVG(Seats_Available) AS Average_Seats_Cancelled FROM Flights WHERE Status = 'Cancelled';

-- 18. Find the Total Number of Flights for Each Day
SELECT DATE(Departure_Time) AS Flight_Date, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Flight_Date; 

-- 19. Calculate the Total Flight Duration for Flights with Status 'On Time'
SELECT SUM(Flight_Duration) AS Total_On_Time_Flight_Duration FROM Flights WHERE Status = 'On Time';

-- 20. Count the Number of Flights with a Duration Greater Than 180 Minutes
SELECT COUNT(*) AS Flights_Over_3_Hours FROM Flights WHERE Flight_Duration > 180;


-- Control Flow Functions

-- Classifies flights as long haul or short haul based on duration
SELECT IF(Flight_Duration > 120, 'Long Haul', 'Short Haul') AS Flight_Type FROM Flights; 

-- Classifies flights as long haul or short haul based on duration using a case statement
SELECT 
CASE 
WHEN Flight_Duration > 120 THEN 'Long Haul' 
WHEN Flight_Duration <= 120 THEN 'Short Haul' 
END 
AS Flight_Type FROM Flights; 

-- other queries

CREATE TABLE Flights_Backup (
  Flight_ID int PRIMARY KEY,
  Flight_Number varchar(10) NOT NULL,
  Departure_Airport varchar(100) NOT NULL,
  Arrival_Airport varchar(100) NOT NULL,
  Departure_Time datetime NOT NULL,
  Arrival_Time datetime NOT NULL,
  Flight_Duration int NOT NULL,
  Seats_Available int NOT NULL,
  Aircraft_type varchar(20),
  status varchar(20)
);
drop table Flights_backup;
-- copy table data
INSERT INTO Flights_Backup SELECT * FROM Flights;

select * from Flights_Backup;



 

-- Table-2 Create Passengers table
CREATE TABLE Passengers (
  Passenger_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each passenger (Primary Key, Auto Increment)
  First_Name VARCHAR(50) NOT NULL, -- Passenger's first name (Not Null)
  Last_Name VARCHAR(50) NOT NULL, -- Passenger's last name (Not Null)
  Email VARCHAR(100) UNIQUE NOT NULL, -- Passenger's email address (Not Null, must be unique)
  Phone_Number VARCHAR(15), -- Passenger's phone number (Optional)
  Date_of_Birth DATE NOT NULL, -- Passenger's date of birth (Not Null)
  Frequent_Flyer_Number VARCHAR(20) UNIQUE, -- Frequent flyer number (Optional, must be unique)
  Nationality VARCHAR(50) NOT NULL -- Nationality of the passenger (Not Null)
);

-- Insert Records into Passengers Table
INSERT INTO Passengers (First_Name, Last_Name, Email, Phone_Number, Date_of_Birth, Frequent_Flyer_Number, Nationality)
VALUES 
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '1990-01-15', 'FF001', 'India'),
('Priya', 'Verma', 'priya.verma@example.com', '8765432109', '1992-02-20', 'FF002', 'India'),
('Amit', 'Kumar', 'amit.kumar@example.com', '7654321098', '1988-03-25', 'FF003', 'India'),
('Sneha', 'Reddy', 'sneha.reddy@example.com', '6543210987', '1995-04-30', 'FF004', 'India'),
('Vikram', 'Singh', 'vikram.singh@example.com', '5432109876', '1985-05-05', 'FF005', 'India'),
('Neha', 'Gupta', 'neha.gupta@example.com', '4321098765', '1993-06-10', 'FF006', 'India'),
('Ravi', 'Patel', 'ravi.patel@example.com', '3210987654', '1987-07-15', 'FF007', 'India'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', '2109876543', '1991-08-20', 'FF008', 'India'),
('Karan', 'Bansal', 'karan.bansal@example.com', '1098765432', '1989-09-25', 'FF009', 'India'),
('Pooja', 'Joshi', 'pooja.joshi@example.com', '0987654321', '1994-10-30', 'FF010', 'India'),
('Suresh', 'Nair', 'suresh.nair@example.com', '9876543210', '1986-11-05', 'FF011', 'India'),
('Tina', 'Chopra', 'tina.chopra@example.com', '8765432109', '1992-12-10', 'FF012', 'India'),
('Mohit', 'Agarwal', 'mohit.agarwal@example.com', '7654321098', '1988-01-15', 'FF013', 'India'),
('Ritika', 'Sethi', 'ritika.sethi@example.com', '6543210987', '1995-02-20', 'FF014', 'India'),
('Deepak', 'Kohli', 'deepak.kohli@example.com', '5432109876', '1985-03-25', 'FF015', 'India');


-- Table-3 Create Bookings table
CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each booking (Primary Key, Auto Increment)
  Flight_ID INT NOT NULL, -- Foreign key referencing Flights table (Not Null)
  Passenger_ID INT NOT NULL, -- Foreign key referencing Passengers table (Not Null)
  Booking_Date DATETIME NOT NULL, -- Date and time of booking (Not Null)
  Number_of_Seats INT NOT NULL CHECK (Number_of_Seats > 0), -- Number of seats booked (Not Null, must be greater than zero)
  Total_Price DECIMAL(10, 2) NOT NULL, -- Total price for the booking (Not Null)
  Booking_Status ENUM('Confirmed', 'Cancelled', 'Pending') NOT NULL DEFAULT 'Pending', -- Status of the booking (Not Null, default is 'Pending')
  FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID) ON DELETE CASCADE, -- Foreign key constraint linking to Flights table with cascading delete
  FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE -- Foreign key constraint linking to Passengers table with cascading delete
);

truncate Bookings;
-- Insert Records into Bookings Table

INSERT INTO Bookings (Flight_ID, Passenger_ID, Booking_Date, Number_of_Seats, Total_Price, Booking_Status)
VALUES 
(1, 1, '2023-09-01 10:00:00', 1, 1500.00, 'Confirmed'),
(2, 2, '2023-09-02 11:00:00', 2, 3000.00, 'Confirmed'),
(3, 3, '2023-09-03 12:00:00', 1, 1500.00, 'Confirmed'),
(4, 4, '2023-09-04 13:00:00', 1, 1500.00, 'Confirmed'),
(5, 5, '2023-09-05 14:00:00', 1, 1500.00, 'Confirmed'),
(6, 6, '2023-09-06 15:00:00', 1, 1500.00, 'Confirmed'),
(7, 7, '2023-09-07 16:00:00', 1, 1500.00, 'Confirmed'),
(8, 8, '2023-09-08 17:00:00', 1, 1500.00, 'Confirmed'),
(9, 9, '2023-09-09 18:00:00', 1, 1500.00, 'Confirmed'),
(10, 10, '2023-09-10 19:00:00', 1, 1500.00, 'Confirmed'),
(11, 11, '2023-09-11 20:00:00', 1, 1500.00, 'Confirmed'),
(12, 12, '2023-09-12 21:00:00', 1, 1500.00, 'Confirmed'),
(13, 13, '2023-09-13 22:00:00', 1, 1500.00, 'Confirmed'),
(14, 14, '2023-09-14 23:00:00', 1, 1500.00, 'Confirmed'),
(15, 15, '2023-09-15 09:00:00', 1, 1500.00, 'Confirmed');


-- Table-4 Create Airlines table
CREATE TABLE Airlines (
  Airline_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each airline (Primary Key, Auto Increment)
  Airline_Name VARCHAR(100) NOT NULL, -- Name of the airline (Not Null)
  IATA_Code VARCHAR(3) UNIQUE NOT NULL, -- IATA code for the airline (Not Null, must be unique)
  Country VARCHAR(50) NOT NULL, -- Country where the airline is based (Not Null)
  Established_Year INT CHECK (Established_Year > 1900), -- Year the airline was established (Must be greater than 1900)
  Headquarter_Location VARCHAR(100) NOT NULL -- Location of the airline's headquarters (Not Null)
);

-- Insert Records into Airlines Table

INSERT INTO Airlines (Airline_Name, IATA_Code, Country, Established_Year, Headquarter_Location)
VALUES 
('Air India', 'AI', 'India', 1932, 'Mumbai'),
('IndiGo', '6E', 'India', 2006, 'Gurgaon'),
('SpiceJet', 'SG', 'India', 2005, 'Gurgaon'),
('Vistara', 'UK', 'India', 2013, 'Gurgaon'),
('GoAir', 'G8', 'India', 2005, 'Mumbai'),
('AirAsia India', 'I5', 'India', 2014, 'Bangalore'),
('Alliance Air', '9I', 'India', 1996, 'Delhi'),
('Jet Airways', '9W', 'India', 1993, 'Mumbai'),
('Air India Express', 'IX', 'India', 2005, 'Kochi'),
('Star Air', 'S5', 'India', 2019, 'Bangalore'),
('Akasa Air', 'QP', 'India', 2022, 'Mumbai'),
('TruJet', '2T', 'India', 2015, 'Hyderabad'),
('Zoom Air', 'Z5', 'India', 2017, 'Delhi'),
('Flybig', 'FB', 'India', 2020, 'Indore'),
('Deccan Charters', 'DC', 'India', 1997, 'Bangalore');


-- Table-5 Create Tickets table
CREATE TABLE Tickets (
  Ticket_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each ticket (Primary Key, Auto Increment)
  Booking_ID INT NOT NULL, -- Foreign key referencing Bookings table (Not Null)
  Ticket_Price DECIMAL(10, 2) NOT NULL, -- Price of the ticket (Not Null, with two decimal places)
  Ticket_Status ENUM('Confirmed', 'Cancelled', ' Pending') NOT NULL, -- Status of the ticket (Not Null, must be one of the specified values)
  Seat_Number VARCHAR(5) NOT NULL, -- Assigned seat number for the ticket (Not Null)
  Baggage_Allowance INT DEFAULT 0, -- Baggage allowance in kilograms (Default is 0)
  FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID) ON DELETE CASCADE -- Foreign key constraint linking to Bookings table with cascading delete
);

-- Insert Records into Tickets Table
INSERT INTO Tickets (Booking_ID, Ticket_Price, Ticket_Status, Seat_Number, Baggage_Allowance)
VALUES 
(1, 1500.00, 'Confirmed', '1A', 15),
(2, 1500.00, 'Confirmed', '1B', 20),
(3, 1500.00, 'Confirmed', '1C', 15),
(4, 1500.00, 'Confirmed', '1D', 15),
(5, 1500.00, 'Confirmed', '1E', 15),
(6, 1500.00, 'Confirmed', '1F', 15),
(7, 1500.00, 'Confirmed', '1G', 15),
(8, 1500.00, 'Confirmed', '1H', 15),
(9, 1500.00, 'Confirmed', '1I', 15),
(10, 1500.00, 'Confirmed', '1J', 15),
(11, 1500.00, 'Confirmed', '1K', 15),
(12, 1500.00, 'Confirmed', '1L', 15),
(13, 1500.00, 'Confirmed', '1M', 15),
(14, 1500.00, 'Confirmed', '1N', 15),
(15, 1500.00, 'Confirmed', '1O', 15);


-- 1. Select All Records from Each Table

-- Select all records from Flights table
SELECT * FROM Flights;

-- Select all records from Passengers table
SELECT * FROM Passengers;

-- Select all records from Bookings table
SELECT * FROM Bookings;

-- Select all records from Airlines table
SELECT * FROM Airlines;

-- Select all records from Tickets table
SELECT * FROM Tickets;


-- 2. Truncate Each Table

-- Truncate the Tickets table
TRUNCATE TABLE Tickets;

-- Truncate the Bookings table
TRUNCATE TABLE Bookings;

-- Truncate the Passengers table
TRUNCATE TABLE Passengers;

-- Truncate the Flights table
TRUNCATE TABLE Flights;

-- Truncate the Airlines table
TRUNCATE TABLE Airlines;


-- 3. Drop Each Table

-- Drop the Tickets table
DROP TABLE IF EXISTS Tickets;

-- Drop the Bookings table
DROP TABLE IF EXISTS Bookings;

-- Drop the Passengers table
DROP TABLE IF EXISTS Passengers;

-- Drop the Flights table
DROP TABLE IF EXISTS Flights;

-- Drop the Airlines table
DROP TABLE IF EXISTS Airlines;


-- 4. Rename Each Table

-- Rename the Flights table to Flight_Details
ALTER TABLE Flights 
RENAME TO Flight_Details;

-- Rename the Passengers table to Customer
ALTER TABLE Passengers 
RENAME TO Customer;

-- Rename the Bookings table to Reservations
ALTER TABLE Bookings 
RENAME TO Reservations;

-- Rename the Airlines table to Airline_Companies
ALTER TABLE Airlines 
RENAME TO Airline_Companies;

-- Rename the Tickets table to Flight_Tickets
ALTER TABLE Tickets 
RENAME TO Flight_Tickets;

 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 
 
 
 