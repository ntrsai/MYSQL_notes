create database Airlines;

use airline;
 
 -- --------------------------------------------Database analysis--------------------------------------------------
 /*
 T1-Employee( Employee_ID, Employee_Name, Salary, Age, Address, contact, hire_date, email, Gender, Department)
 
 T2- Aircraft (Aircraft_ID,  airline_id, model, manufacture, Location, capacity, range_km, Country, No_of_crew) 
 
 T-3 Crew(crew_ID, Name, PassPort, City, Airport, Email, airline, contact, )
 
 T4- Booking (Booking_ID, Name, Seat_no., Airplane, DOB, Contact, Passport, Nationality)
 
 T5- Passenger(Passenger_ID, Passport, Shedule, Email, Contact, Seat_no nationality, gender, dob)
 
 T6-Feedback(Feedback_ID, Name, Flight, Passenger_ID)    
 
 T7- Airlines (Airline_ID,  Name, country, founded_year, ceo, website)
 
 T8- Tickets (ticket_id, ticket_number, booking_id, issue_date, price, payment_status, seat_type, referance, currency)
 
 T9- Maintenance logs (logs_id, aircraft_id, date, airport_id, status, remarks, duration_hours )
 
 T10- Payments (payament_id, ticket_id, payment_date, payment_method, amount, currency, transaction_id, status)
 */
 
 
 
-- ----------------------------------------table related queries---------------------------------------------------
-- 1. 
create table Employee(
Employee_ID INT PRIMARY KEY,
 Employee_Name VARCHAR(100), 
 Salary VARCHAR(100),
 Age INT, 
 Address VARCHAR(500),
 contact VARCHAR(20),
 hire_date VARCHAR(10),
 email VARCHAR(100),
 Gender VARCHAR(10),
 Department VARCHAR(100)
 );
 
 -- TO DISPLAY TABLE EMPLOYEE
 SELECT * FROM Employee ;
 
 
 INSERT INTO Employee( Employee_ID, Employee_Name, Salary, Age, Address, contact, hire_date, email, Gender, Department) VALUES
 (1, 'pallavi', '25000', '25', 'mumbai', '96991327856', '25-01-2022', 'pallavi@gmail.com', 'female', 'management'),
 (2, 'divya', '25000', '22', 'mimbai', '7689454323', '23-04-2023', 'divya@gmail.com', 'female', 'HR'),
 (3, 'prajkta', '22000', '21', 'mumbai', '98765676890', '12-12-2021', 'prajkta@gmail.com', 'female', 'food'),
 (4, 'prathmesh', '23000', '22', 'thane', '9870654534', '23-11-2023', 'prathmesh@gmail.com', 'male', 'çrew'),
 (5, 'pratiksha', '23000', '22', 'thane', '99887654534', '25-11-2023', 'pratiksha@gmail.com', 'female', 'airhostes'),
 (6, 'sanika', '28000', '32', 'thane', '9685654534', '13-11-2023', 'sanika@gmail.com', 'female', 'manager'),
 (7, 'santosh', '13000', '22', 'thane', '8956654534', '13-11-2023', 'santosh@gmail.com', 'female', 'airport_staff'),
 (8, 'pranali', '23000', '32', 'thane', '7896654534', '19-11-2023', 'pranali@gmail.com', 'female', 'accountant'), 
 (9, 'rutika', '29000', '28', 'thane', '7770654534', '23-11-2023', 'rutika@gmail.com', 'female', 'çrew'),
 (10, 'komal', '23000', '22', 'thane', '8870654534', '13-11-2023', 'komal@gmail.com', 'female', 'manager');
 
 TRUNCATE TABLE EMPLOYEE;
 
 DROP TABLE EMPLOYEE; 
 -- queries
 -- 1. 
 SELECT * FROM Employee;
 
-- 2. 
SELECT COUNT(*) AS Total_Employees FROM Employee;

-- 3.
ALTER TABLE Employee ADD COLUMN Position VARCHAR(50);

-- 4.
UPDATE Employee SET Gender = 'male' WHERE Employee_Name = 'santosh';

-- 5.
DELETE FROM Employee WHERE Department = 'airhostes';

-- 6. 
Select employee_name, count(age) as total_age from employee group by employee_name;

-- 7. 
select employee_id, avg(salary) as avg_salary from employee group by employee_id;

-- 8. 
select employee_name, max(salary) as max_salary from employee group by employee_name;

-- 9.
SELECT * FROM Employee WHERE hire_date < '12-12-2021';

-- 10. 
SELECT Employee_ID , COUNT(*) AS Department 
FROM Employee 
GROUP BY Employee_ID;
 
 -- ------------------------------------- SELECT QUERIES-------------------------------------------------- 
 -- 1. 
 SELECT * FROM Employee;
 
 -- 2. 
SELECT FULL_Name, Salary FROM Employee WHERE Department = 'manager';

-- 3. 
SELECT COUNT(*) AS Total_Employees FROM Employee;

-- 4. 
SELECT FULL_Name, Age FROM Employee WHERE Age > 25;

-- 5. 
SELECT Department, AVG(Salary) AS Avg_Salary FROM Employee GROUP BY Department;

 
 
 -- ---------------------------------------------
--                 ALTER QUERIES
-- ---------------------------------------------

-- 1.
ALTER TABLE Employee ADD COLUMN Position VARCHAR(50);

-- 2.
ALTER TABLE Employee MODIFY Salary INT;

-- 3.
ALTER TABLE Employee RENAME TO Staff;

-- 4.
ALTER TABLE Staff DROP COLUMN Position;

-- 5.
ALTER TABLE Staff ADD COLUMN Nationality VARCHAR(50) DEFAULT 'Indian';
 
 
 -- ---------------------------------------------
--                 UPDATE QUERIES
-- ---------------------------------------------

-- 1.
UPDATE Employee SET Salary = 27000 WHERE Employee_ID = 1;

-- 2.
UPDATE Employee SET Department = 'crew' WHERE Department = 'çrew';

-- 3.
UPDATE Employee SET Address = 'Mumbai' WHERE Address = 'mumbai';

-- 4.
UPDATE Employee SET Gender = 'male' WHERE Employee_Name = 'santosh';

-- 5.
UPDATE Employee SET Salary = Salary + 2000 WHERE Department = 'manager';
 
 
 
 -- ---------------------------------------------
--                 DELETE QUERIES
-- ---------------------------------------------

-- 1.
DELETE FROM Employee WHERE Employee_ID = 10;

-- 2.
DELETE FROM Employee WHERE Department = 'airhostes';

-- 3.
DELETE FROM Employee WHERE Salary < 15000;

-- 4.
DELETE FROM Employee WHERE Age > 30;

-- 5.
DELETE FROM Employee WHERE Employee_Name = 'divya';

 
 
 
 
 
 
 
-- 2. 
 CREATE TABLE Aircraft(
Aircraft_ID INT PRIMARY KEY, 
 airline_id INT,
 model VARCHAR(100),
 manufacture VARCHAR(100),
 Location VARCHAR(100), 
 capacity VARCHAR(100), 
 range_km VARCHAR(100), 
 Country VARCHAR(100),
 No_of_crew VARCHAR(100)
 );
 
 -- TO DISPLAY TABLE Aircraft
 SELECT * FROM Aircraft;

 INSERT INTO Aircraft(Aircraft_ID,  airline_id, model, manufacture, Location, capacity, range_km, Country, No_of_crew) VALUES 
  (1, '21', 'Air_india', 'Airbus', 'Mumbai', '150-180', '6,100', 'india', '21'),
  (2, '22', 'Airbus', 'Airbus', 'Shirdi', '130-180', '5,100', 'india', '11'),
  (3, '23', 'Vistara', 'Boieng', 'Delhi', '180-200', '6,100', 'india', '15'),
  (4, '24', 'Air_canada', 'Boieng', 'Canada', '230-180', '4,100', 'Canada', '21'),
  (5, '25', 'Air_india', 'Airbus', 'Shirdi', '160-180', '5,400', 'india', '24'),
  (6, '26', 'Airbus', 'Airbus', 'Nashik', '130-180', '7,100', 'india', '16'),
  (7, '27', 'Boieng', 'Boieng', 'Shirdi', '130-180', '5,100', 'india', '11'),
  (8, '28', 'Airbus', 'Airbus', 'Mumbai', '250-280', '5,400', 'india', '21'),
  (9, '29', 'Vistara', 'Airbus', 'Shirdi', '130-180', '5,100', 'india', '11'),
  (10, '30', 'Vistara', 'Airbus', 'Delhi', '230-280', '6,100', 'india', '13');
  
  TRUNCATE TABLE AIRCRAFT;
  DROP TABLE AIRCRAFT;
  -- queries
  -- 1.
SELECT * FROM Aircraft;

-- 2.
SELECT model, Location FROM Aircraft WHERE manufacture = 'Airbus';

-- 3.
SELECT COUNT(*) AS Total_Aircrafts FROM Aircraft;

-- 4.
SELECT model, range_km FROM Aircraft WHERE Country = 'india';

-- 5.
SELECT Location, AVG(No_of_crew) AS Avg_Crew FROM Aircraft GROUP BY Location;

-- 6.
ALTER TABLE Fleet ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';

-- 7.
UPDATE Aircraft SET Location = 'Mumbai' WHERE Location = 'Shirdi';

-- 8.
DELETE FROM Aircraft WHERE Location = 'Canada';

-- 9.
DELETE FROM Aircraft WHERE No_of_crew < 15;

-- 10.
DELETE FROM Aircraft WHERE model = 'Air_india';
  
  -- ---------------------------------------------
--                 SELECT QUERIES
-- ---------------------------------------------

-- 1.
SELECT * FROM Aircraft;

-- 2.
SELECT model, Location FROM Aircraft WHERE manufacture = 'Airbus';

-- 3.
SELECT COUNT(*) AS Total_Aircrafts FROM Aircraft;

-- 4.
SELECT model, range_km FROM Aircraft WHERE Country = 'india';

-- 5.
SELECT Location, AVG(No_of_crew) AS Avg_Crew FROM Aircraft GROUP BY Location;


-- ---------------------------------------------
--                 ALTER QUERIES
-- ---------------------------------------------

-- 1.
ALTER TABLE Aircraft ADD COLUMN Year_Manufactured INT;

-- 2.
ALTER TABLE Aircraft MODIFY range_km INT;

-- 3.
ALTER TABLE Aircraft RENAME TO Fleet;

-- 4.
ALTER TABLE Fleet DROP COLUMN Year_Manufactured;

-- 5.
ALTER TABLE Fleet ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';
  
  
  
  
  -- ---------------------------------------------
--                 UPDATE QUERIES
-- ---------------------------------------------

-- 1. 
UPDATE Aircraft 
SET model = 'Air_India Express' 
WHERE Aircraft_ID = 1;

-- 2. 
UPDATE Aircraft 
SET manufacture = 'Boeing' 
WHERE manufacture = 'Boieng';

-- 3. 
UPDATE Aircraft 
SET Location = 'Mumbai' 
WHERE Location = 'Shirdi';

-- 4. 
UPDATE Aircraft 
SET Country = 'India' 
WHERE Country = 'india';

-- 5.
UPDATE Aircraft SET Location = 'Mumbai' WHERE Location = 'Shirdi';
  
  
  -- ---------------------------------------------
--                 DELETE QUERIES
-- ---------------------------------------------

-- 1.
DELETE FROM Aircraft WHERE Aircraft_ID = 10;

-- 2.
DELETE FROM Aircraft WHERE manufacture = 'Boeing';

-- 3.
DELETE FROM Aircraft WHERE Location = 'Canada';

-- 4.
DELETE FROM Aircraft WHERE No_of_crew < 15;

-- 5.
DELETE FROM Aircraft WHERE model = 'Air_india';
  
  
  
  
  
-- 3. 
  CREATE TABLE Crew(
  crew_ID INT PRIMARY KEY,
  Name VARCHAR(100),
  PassPort VARCHAR(100),
  City VARCHAR(100), 
  Airport VARCHAR(100),
  Email VARCHAR(100),
  airline VARCHAR(100),
  contact VARCHAR(100)
  );
  
   SELECT * FROM Crew;
   
   INSERT INTO Crew (crew_ID, Name, PassPort, City, Airport, Email, airline, contact)VALUES
    (1, 'Sanika', 'P12345', 'Mumbai',' Chhatrapati Shivaji Maharaj International Airport', 'sanika@gmail.com', 'Vistara', '9876544365'),
    (2, 'Santosh', 'P25345', 'Delhi','Indira Gandhi International Airport', 'santosh@gmail.com', 'Air_India', '7890544365'),
    (3, 'Payal', 'P14565', 'Nashik','Gandhinagar Airport', 'payal@gmail.com', 'Airbus', '9876576565'),
    (4, 'Karan', 'P154465', 'Shairdi','Shirdi International Airport', 'karan@gmail.com', 'Vistara', '8876544365'),
    (5, 'Samir', 'P11255', 'Canada','Vancouver International Airport', 'samir@gmail.com', 'boeing', '9076544365'),
    (6, 'Shantanu', 'P45345', 'NewYork','John F. Kennedy International Airport', 'shantanu@gmail.com', 'Air_india', '7836544365'),
    (7, 'Aman', 'P23554', 'Paris','Charles de Gaulle Airport ', 'aman@gmail.com', 'Airbus', '9876544123'),
    (8, 'Mahesh', 'P45345', 'Delhi','Indira Gandhi International Airport', 'mahesh@gmail.com', 'Vistara', '9876544365'),
    (9, 'Krutika', 'P98345', 'Itali','	Leonardo da Vinci–Fiumicino Airport', 'krutika@gmail.com', 'boeing', '8176544365'),
	(10, 'Rutika', 'P47685', 'France','Orly Airport', 'rutika@gmail.com', 'Vistara', '9876544351');
   
   TRUNCATE TABLE CREW;
   DROP TABLE CREW; 
   -- queries
   -- 1.
SELECT * FROM crew;

-- 2.
SELECT name,passport FROM crew WHERE manufacture = 'Airbus';

-- 3.
SELECT COUNT(*) AS Total_Aircrafts FROM crew;

-- 4.
SELECT name FROM crew WHERE Country = 'india';

-- 5.
SELECT city, len(city) FROM crew GROUP BY Location;

-- 6.
ALTER TABLE crew ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';

-- 7.
UPDATE crew SET city = 'Mumbai' WHERE city= 'Shirdi';

-- 8.
DELETE FROM crew WHERE city = 'Canada';

-- 9.
DELETE FROM crew WHERE No_of_crew < 15;

-- 10.
DELETE FROM crew WHERE model = 'Air_india';
   
   -- ---------------------------------------------
--                 SELECT QUERIES
-- ---------------------------------------------

-- 1.
SELECT * FROM Crew;

-- 2.
SELECT Name, Email FROM Crew WHERE airline = 'Vistara';

-- 3.
SELECT COUNT(*) AS Total_Crew FROM Crew;

-- 4.
SELECT Name, City FROM Crew WHERE City = 'Delhi';

-- 5.
SELECT Airport, COUNT(*) AS Total_Staff FROM Crew GROUP BY Airport;
   
   
   
   
   -- ---------------------------------------------
--                 ALTER QUERIES
-- ---------------------------------------------

-- 1.
ALTER TABLE Crew ADD COLUMN Nationality VARCHAR(50);

-- 2.
ALTER TABLE Crew MODIFY contact VARCHAR(15);

-- 3.
ALTER TABLE Crew RENAME TO Flight_Crew;

-- 4.
ALTER TABLE Flight_Crew DROP COLUMN Nationality;

-- 5.
ALTER TABLE Crew MODIFY contact VARCHAR(15);

-- ---------------------------------------------
--                 UPDATE QUERIES
-- ---------------------------------------------
-- 1. 
UPDATE Crew 
SET City = 'Shirdi' 
WHERE City = 'Shairdi';

-- 2. 
UPDATE Crew 
SET airline = 'Boeing' 
WHERE airline = 'boeing';

-- 3. 
UPDATE Crew 
SET Email = 'mahesh_vistara@gmail.com' 
WHERE Name = 'Mahesh';

-- 4. 
UPDATE Crew 
SET Airport = 'Chhatrapati Shivaji Maharaj International Airport' 
WHERE Airport LIKE '%Chhatrapati%';

-- 5.
UPDATE Crew 
SET contact = '9876540000' 
WHERE Name = 'Rutika';


-- ---------------------------------------------
--                 DELETE QUERIES
-- ---------------------------------------------

-- 1.
DELETE FROM Crew WHERE crew_ID = 10;

-- 2.
DELETE FROM Crew WHERE City = 'France';

-- 3.
DELETE FROM Crew WHERE airline = 'Air_india';

-- 4.
DELETE FROM Crew WHERE Name = 'Samir';

-- 5.
DELETE FROM Crew WHERE PassPort = 'P45345';
   
   
   
   
   
   -- 4. 
    CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Name VARCHAR(100), 
    Seat_no VARCHAR(100),
    Airplane VARCHAR(100),
    DOB VARCHAR(100),
    Contact VARCHAR(100),
    Passport VARCHAR(100),
    Nationality VARCHAR(100)
    );
    
    select * from booking;
    
  INSERT INTO Booking (Booking_ID, Name, Seat_no, Airplane, DOB, Contact, Passport, Nationality) VALUES
 (1, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (2, 'Shrutika', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (3, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (4, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (5, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (6, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (7, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (8, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (9, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India'),
 (10, 'Shamita', '121', 'Airbus', '25-10-2004', '9876543423', 'P32134', 'India');
 truncate table booking;
 drop table booking;
 -- queries
 -- 1.
SELECT * FROM booking;

-- 2.
SELECT name, airplne FROM booking WHERE Nationality='India';
-- 3.
SELECT COUNT(*) AS Total_booking FROM booking;
-- 4.
SELECT model, range_km FROM booking WHERE Country = 'india';

-- 5.
SELECT name,count(seat_no) as total_seats FROM booking GROUP BY Nationality;
-- 6.
ALTER TABLE booking ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';

-- 7.
UPDATE booking SET Nationality='Bharat' where seat_no =121;
-- 8.
DELETE FROM booking WHERE Passport =  'P32134';

-- 9.
DELETE FROM booking WHERE seat_no >121;

-- 10.
DELETE FROM booking WHERE airplane='Airbus';
 
 -- ------------------------------------------SELECT QUERIES--------------------------------------------------- 
 -- 1.
SELECT * 
FROM Booking 
WHERE Name = 'Shamita';

-- 2.
SELECT Name, Nationality 
FROM Booking 
WHERE Nationality = 'India';

-- 3.
SELECT COUNT(*) AS Total_Bookings 
FROM Booking 
WHERE Airplane = 'Airbus';

-- 4.
SELECT DISTINCT Passport 
FROM Booking;

-- 5.
SELECT * 
FROM Booking 
ORDER BY Booking_ID DESC 
LIMIT 5;

 -- -------------------------------------------- ALTER QUERIES-------------------------------------------------------------
 -- 1.
ALTER TABLE Booking 
ADD Email VARCHAR(100);

-- 2.
ALTER TABLE Booking 
MODIFY Seat_no VARCHAR(10);

-- 3.
ALTER TABLE Booking 
ADD Gender VARCHAR(10);

-- 4.
ALTER TABLE Booking 
ADD CHECK (Nationality IS NOT NULL);

-- 5.
ALTER TABLE Booking 
CHANGE Contact PhoneNumber VARCHAR (15);
 
 -- --------------------------------------------- UPDATE QUERIES-------------------------------------------------- 
 -- 1.
UPDATE Booking 
SET Seat_no = '122' 
WHERE Booking_ID = 2;

-- 2.
UPDATE Booking 
SET Nationality = 'Indian' 
WHERE Nationality = 'India';
SET SQL_SAFE_UPDATES= 0;


-- 3.
UPDATE Booking 
SET Name = 'Shrutika Patil' 
WHERE Name = 'Shrutika';

-- 4.
UPDATE Booking 
SET Airplane = 'Boeing' 
WHERE Airplane = 'Airbus';

-- 5.
UPDATE Booking 
SET PHONENUMBER = '9594562952'
WHERE Booking_ID = 2;

 -- --------------------------------------- DELETE QUERIES------------------------------------------------------------------- 
 
 -- 1.
DELETE FROM Booking 
WHERE Booking_ID = 10;

-- 2.
DELETE FROM Booking 
WHERE Name = 'Shrutika';

-- 3.
DELETE FROM Booking 
WHERE Seat_no = '121' 
AND Booking_ID > 8;

-- 4.
DELETE FROM Booking 
WHERE Passport = 'P32134' 
AND Booking_ID = 9;

-- 5.
DELETE FROM Booking 
WHERE Airplane = 'Boeing' 
AND Booking_ID < 3;
 
 
 

 -- 5. 
 CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY,
    Passport VARCHAR(20) NOT NULL,
    Schedule VARCHAR(50), 
    Email VARCHAR(100),
    Contact VARCHAR(20),
    Seat_no VARCHAR(10),
    Nationality VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE
);
SELECT* FROM PASSENGER; 

INSERT INTO Passenger (Passenger_ID, Passport, Schedule, Email, Contact, Seat_no, Nationality, Gender, DOB) VALUES
(1, 'P1234561', 'SCH001', 'alice.johnson@example.com', '1234567890', '1A', 'USA', 'Female', '1990-01-15'),
(2, 'P1234562', 'SCH002', 'bob.smith@example.com', '1234567891', '2B', 'Canada', 'Male', '1985-03-22'),
(3, 'P1234563', 'SCH003', 'carla.davis@example.com', '1234567892', '3C', 'UK', 'Female', '1992-07-19'),
(4, 'P1234564', 'SCH004', 'david.clark@example.com', '1234567893', '4D', 'Australia', 'Male', '1988-12-05'),
(5, 'P1234565', 'SCH005', 'emily.harris@example.com', '1234567894', '5E', 'New Zealand', 'Female', '1995-06-25'),
(6, 'P1234566', 'SCH006', 'frank.white@example.com', '1234567895', '6F', 'Germany', 'Male', '1991-04-30'),
(7, 'P1234567', 'SCH007', 'grace.green@example.com', '1234567896', '7G', 'France', 'Female', '1989-09-17'),
(8, 'P1234568', 'SCH008', 'henry.brown@example.com', '1234567897', '8H', 'India', 'Male', '1993-10-11'),
(9, 'P1234569', 'SCH009', 'irene.james@example.com', '1234567898', '9I', 'Japan', 'Female', '1994-02-28'),
(10, 'P1234570', 'SCH010', 'jack.lewis@example.com', '1234567899', '10J', 'Brazil', 'Male', '1990-08-14');

TRUNCATE TABLE Passenger;

DROP TABLE Passenger;


 -- queries
 -- 1.
SELECT * FROM Passenger;

-- 2.
SELECT Passenger_ID FROM Passenger WHERE Nationality='India';
-- 3.
SELECT COUNT(*) AS Total_booking FROM Passenger;
-- 4.
SELECT Schedule, Email FROM Passenger WHERE Nationality = 'india';

-- 5.
SELECT Passenger_ID,count(Email) as total_seats FROM Passengers GROUP BY Nationality;
-- 6.
ALTER TABLE Passenger  ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';

-- 7.
UPDATE Passenger SET Nationality='Bharat' where Passenger_id=9;
-- 8.
DELETE FROM Passenger WHERE Passport =  'P32134';

-- 9.
DELETE FROM Passenger WHERE Email='jack.lewis@example.com';

-- 10.
DELETE FROM Passenger WHERE Passenger_ID <1 ;
 

-- --------------------------------------------- SELECT QUERIES-------------------------------------------------
-- 1.
SELECT * 
FROM Passenger 
WHERE Nationality = 'India';

-- 2.
SELECT Name, Email 
FROM Passenger 
WHERE Gender = 'Female';

-- 3.
SELECT COUNT(*) AS Female_Passengers 
FROM Passenger 
WHERE Gender = 'Female';

-- 4.
SELECT * 
FROM Passenger 
ORDER BY DOB ASC 
LIMIT 3;

-- 5.
SELECT Passenger_ID, Passport, Seat_no 
FROM Passenger 
WHERE Seat_no LIKE '%A' OR Seat_no LIKE '%E';


-- ------------------------------------------- ALTER QUERIES------------------------------------------------- 
-- 1.
ALTER TABLE Passenger 
ADD Address VARCHAR(255);

-- 2.
ALTER TABLE Passenger 
MODIFY Email VARCHAR(150);

-- 3.
ALTER TABLE Passenger 
ADD FrequentFlyer BOOLEAN DEFAULT FALSE;

-- 4.
ALTER TABLE Passenger 
CHANGE Contact Phone VARCHAR(15);

-- 5.
ALTER TABLE Passenger 
DROP COLUMN Schedule;


-- ------------------------------------------ UPDATE QUERIES--------------------------------------------------- 
-- 1.
UPDATE Passenger 
SET Nationality = 'Indian' 
WHERE Passenger_ID = 8;

-- 2.
UPDATE Passenger 
SET Email = 'updated.email@example.com' 
WHERE Passenger_ID = 1;

-- 3.
UPDATE Passenger 
SET Gender = 'Other' 
WHERE Passenger_ID = 3;

-- 4.
UPDATE Passenger 
SET Seat_no = '12A' 
WHERE Seat_no = '10J';

-- 5.
UPDATE Passenger 
SET PHONE= '7738598425'
WHERE Passport = 'P1234567';

-- ------------------------------------ DELETE QUERIES--------------------------------------------------------------------- 
-- 1.
DELETE FROM Passenger 
WHERE Passenger_ID = 10;

-- 2.
DELETE FROM Passenger 
WHERE Nationality = 'Japan';

-- 3.
DELETE FROM Passenger 
WHERE Gender = 'Male' AND Nationality = 'Germany';

-- 4.
DELETE FROM Passenger 
WHERE Email LIKE '%green%';

-- 5.
DELETE FROM Passenger 
WHERE DOB < '1990-01-01';




-- 6 
CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Flight VARCHAR(50),
    Passenger_ID INT
    
);
SELECT * FROM FEEDBACK; 

INSERT INTO Feedback (
    Feedback_ID, Name, Flight, Passenger_ID
) VALUES
(1, 'Alice Johnson', 'FL001', 1),
(2, 'Bob Smith', 'FL002', 2),
(3, 'Carla Davis', 'FL003', 3),
(4, 'David Clark', 'FL004', 4),
(5, 'Emily Harris', 'FL005', 5),
(6, 'Frank White', 'FL006', 6),
(7, 'Grace Green', 'FL007', 7),
(8, 'Henry Brown', 'FL008', 8),
(9, 'Irene James', 'FL009', 9),
(10, 'Jack Lewis', 'FL010', 10);


-- queries


 -- queries
 -- 1.
SELECT * FROM Feedback;

-- 2.
SELECT name FROM Feedback WHERE Passenger_ID=8;
-- 3.
SELECT COUNT(*) AS Total_Feedback FROM Feedback;
-- 4.
SELECT name,passenger_ID FROM Feedback WHERE Flight='FL010';

-- 5.
SELECT Passenger_ID,count(name) FROM Feedback GROUP BY Flight;
-- 6.
ALTER TABLE Feedback ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';

-- 7.
UPDATE Feedback SET name='jack' where Passenger_id=9;
-- 8.
DELETE FROM Feedback WHERE Feedback_ID < 1;

-- 9.
DELETE FROM Feedback_ID  WHERE Email='jack.lewis@example.com';

-- 10.
DELETE FROM FEEdback WHERE Passenger_ID <1 ;
 

-- ---------------------------------------------- SELECT QUERIES-------------------------------------------------------------- 

-- 1.
SELECT * 
FROM Feedback;

-- 2.
SELECT Name, Flight 
FROM Feedback 
WHERE Passenger_ID <= 5;

-- 3.
SELECT COUNT(*) AS Total_Feedbacks 
FROM Feedback;

-- 4.
SELECT * 
FROM Feedback 
WHERE Name LIKE 'A%';

-- 5.
SELECT Feedback_ID, Name 
FROM Feedback 
ORDER BY Feedback_ID DESC 
LIMIT 3;


-- -------------------------------------------- ALTER QUERIES------------------------------------------- 
-- 1.
ALTER TABLE Feedback 
ADD Comments TEXT;

-- 2.
ALTER TABLE Feedback 
ADD Rating INT;

-- 3.
ALTER TABLE Feedback 
MODIFY NamE VARCHAR (100);

-- 4.
ALTER TABLE Feedback 
CHANGE Flight Flight_No VARCHAR(10);

-- 5.
ALTER TABLE Feedback 
ADD Feedback_Date DATE;

-- ------------------------------------------------ update queries---------------------------------- 
-- 1.
UPDATE Feedback 
SET Name = 'Ravi Kumar' 
WHERE Feedback_ID = 1;

-- 2.
UPDATE Feedback 
SET Name = 'Anita Sharma' 
WHERE Feedback_ID = 2;

-- 3.
UPDATE Feedback 
SET Name = 'Suresh Verma' 
WHERE Feedback_ID = 3;

-- 4.
UPDATE Feedback 
SET Name = 'Priya Mehta' 
WHERE Feedback_ID = 4;

-- 5.
UPDATE Feedback 
SET Name = 'Rahul Desai' 
WHERE Feedback_ID = 5;

-- ---------------------------------------- delete queries--------------------------------------------- 
-- 1.
DELETE FROM Feedback 
WHERE Feedback_ID = 10;

-- 2.
DELETE FROM Feedback 
WHERE Name = 'Frank White';

-- 3.
DELETE FROM Feedback 
WHERE Flight = 'FL004';

-- 4.
DELETE FROM Feedback 
WHERE Passenger_ID = 9;

-- 5.
DELETE FROM Feedback 
WHERE Name LIKE '%Smith%';

TRUNCATE TABLE Feedback;
DROP TABLE Feedback;




-- 7. 
CREATE TABLE Airlines (
    Airline_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50),
    Founded_Year INT,
    CEO VARCHAR(100),
    Website VARCHAR(100)
);

INSERT INTO Airlines (Airline_ID, Name, Country, Founded_Year, CEO, Website) VALUES
(1, 'Delta Air Lines', 'USA', 1924, 'Ed Bastian', 'https://www.delta.com'),
(2, 'Emirates', 'UAE', 1985, 'Tim Clark', 'https://www.emirates.com'),
(3, 'British Airways', 'UK', 1974, 'Sean Doyle', 'https://www.britishairways.com'),
(4, 'Lufthansa', 'Germany', 1953, 'Carsten Spohr', 'https://www.lufthansa.com'),
(5, 'Qatar Airways', 'Qatar', 1993, 'Akbar Al Baker', 'https://www.qatarairways.com'),
(6, 'Air Canada', 'Canada', 1937, 'Michael Rousseau', 'https://www.aircanada.com'),
(7, 'Singapore Airlines', 'Singapore', 1947, 'Goh Choon Phong', 'https://www.singaporeair.com'),
(8, 'ANA', 'Japan', 1952, 'Shinichi Inoue', 'https://www.ana.co.jp'),
(9, 'Qantas', 'Australia', 1920, 'Vanessa Hudson', 'https://www.qantas.com'),
(10, 'Turkish Airlines', 'Turkey', 1933, 'Ahmet Bolat', 'https://www.turkishairlines.com');

TRUNCATE TABLE Airlines;
DROP TABLE Airlines;
-- queries
-- 1.
SELECT * FROM Airlines;

-- 2.
SELECT Name,country FROM Airline WHERE manufacture = 'Airbus';

-- 3.
SELECT COUNT(*) AS Total_Airline FROM Airline;

-- 4.
SELECT Name,country FROM Airline WHERE Country = 'india';

-- 5.
SELECT airline_ID, AVG(Founded_Year) AS Avg_year FROM Airline GROUP BY Name;

-- 6.
ALTER TABLE Airline ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';

-- 7.
UPDATE Airline SET Founded_Year = 1987 WHERE ceo= 'Carsten Spohr' ;

-- 8.
DELETE FROM Airline WHERE ceo= 'Carsten Spohr' ;

-- 9.
DELETE FROM Airline WHERE airline_ID > 2;
-- 10.
DELETE FROM Airline WHERE country ='USA';

-- -----------------------------------------select queries------------------------------------------------------
-- 1. 
SELECT * FROM Airlines;

-- 2.
SELECT Name, Country FROM Airlines WHERE Country = 'USA';

-- 3.
SELECT * FROM Airlines WHERE Founded_Year < 1950;

-- 4.
SELECT Name FROM Airlines WHERE CEO LIKE '%Clark%';

-- 5.
SELECT * FROM Airlines ORDER BY Founded_Year DESC;

-- ----------------------------------- alter queries-------------------------------------------------------------- 

-- 1. 
ALTER TABLE Airlines ADD COLUMN Fleet_Size INT;

-- 2.
ALTER TABLE Airlines MODIFY COLUMN Website VARCHAR(255);

-- 3.
ALTER TABLE Airlines CHANGE COLUMN CEO Chief_Executive_Officer VARCHAR(100);

-- 4.
ALTER TABLE Airlines DROP COLUMN Fleet_Size;

-- 5.
ALTER TABLE Airlines ADD COLUMN Alliance VARCHAR(100);

-- ------------------------------------------- update queries----------------------------- 

-- 1.
UPDATE Airlines SET CEO = 'Jane Doe' WHERE Airline_ID = 1;

-- 2.
UPDATE Airlines SET Country = 'United Kingdom' WHERE Name = 'British Airways';
set sql_safe_updates = 0;

-- 3.
UPDATE Airlines SET Founded_Year = 1986 WHERE Name = 'Emirates';

-- 4.
UPDATE Airlines SET Website = 'https://www.deltaairlines.com' WHERE Airline_ID = 1;

-- 5.
UPDATE Airlines SET Alliance = 'Star Alliance' WHERE Name = 'Lufthansa';

-- --------------------------------------------- delete queries---------------------------------------------- 
-- 1.
DELETE FROM Airlines WHERE Airline_ID = 10;

-- 2.
DELETE FROM Airlines WHERE Name = 'Qantas';

-- 3.
DELETE FROM Airlines WHERE Country = 'Turkey';

-- 4.
DELETE FROM Airlines WHERE Founded_Year < 1930;

-- 5.
DELETE FROM Airlines WHERE Name LIKE '%Air%';





-- 8 
CREATE TABLE Tickets (
    Ticket_ID INT PRIMARY KEY,
    Ticket_Number VARCHAR(50) NOT NULL,
    Booking_ID INT,
    Issue_Date DATE,
    Price DECIMAL(10, 2),
    Payment_Status VARCHAR(20),
    Seat_Type VARCHAR(20)
    );

INSERT INTO Tickets (Ticket_ID, Ticket_Number, Booking_ID, Issue_Date, Price, Payment_Status, Seat_Type, Currency) VALUES
(1, 'TN10001', 101, '2025-07-01', 350.00, 'Paid', 'Economy', 'REF12345', 'USD'),
(2, 'TN10002', 102, '2025-07-02', 550.00, 'Paid', 'Business', 'REF12346', 'USD'),
(3, 'TN10003', 103, '2025-07-03', 1200.00, 'Pending', 'First', 'REF12347', 'EUR'),
(4, 'TN10004', 104, '2025-07-04', 400.00, 'Paid', 'Economy', 'REF12348', 'USD'),
(5, 'TN10005', 105, '2025-07-05', 600.00, 'Failed', 'Business', 'REF12349', 'USD'),
(6, 'TN10006', 106, '2025-07-06', 1100.00, 'Paid', 'First', 'REF12350', 'EUR'),
(7, 'TN10007', 107, '2025-07-07', 375.00, 'Paid', 'Economy', 'REF12351', 'USD'),
(8, 'TN10008', 108, '2025-07-08', 575.00, 'Pending', 'Business', 'REF12352', 'USD'),
(9, 'TN10009', 109, '2025-07-09', 1250.00, 'Paid', 'First', 'REF12353', 'EUR'),
(10, 'TN10010', 110, '2025-07-10', 390.00, 'Paid', 'Economy', 'REF12354', 'USD');

TRUNCATE TABLE Tickets;
DROP TABLE Tickets;
-- queries

-- 1.
SELECT * FROM Tickets;

-- 2.
SELECT Ticket_Number, Booking_ID  FROM Tickets WHERE Currency='USD';

-- 3.
SELECT COUNT(*)  FROM Tickets;

-- 4.
SELECT  Booking_ID, Issue_Date, Price FROM Tickets WHERE Payment_Status='Pending';

-- 5.
SELECT Booking_ID ,AVG(Price) FROM Tickets GROUP BY Payment_Status;

-- 6.
ALTER TABLE Tickets ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';

-- 7.
UPDATE Tickets SET Payment_Status='pending' WHERE price >10000;

-- 8.
DELETE FROM Tickets WHERE Location = 'Canada';

-- 9.
DELETE FROM Tickets WHERE  Payment_Status='Pending';

-- 10.
DELETE FROM Tickets WHERE Issue_Date='2025-07-10';
-- ---------------------------------------------- SELECT QUERIES----------------------------------------------



-- 9
CREATE TABLE Maintenance_Logs (
    Logs_ID INT PRIMARY KEY,
    Aircraft_ID INT NOT NULL,
    Date DATE NOT NULL,
    Airport_ID INT NOT NULL,
    Status VARCHAR(50),
    Remarks TEXT,
    Duration_Hours DECIMAL(5,2)
);

INSERT INTO Maintenance_Logs (Logs_ID, Aircraft_ID, Date, Airport_ID, Status, Remarks, Duration_Hours) VALUES
(1, 101, '2025-06-01', 201, 'Completed', 'Routine engine check', 3.5),
(2, 102, '2025-06-03', 202, 'In Progress', 'Landing gear inspection', 2.0),
(3, 103, '2025-06-05', 203, 'Completed', 'Hydraulic system repair', 4.0),
(4, 104, '2025-06-07', 204, 'Scheduled', 'Avionics update pending', 1.5),
(5, 105, '2025-06-09', 205, 'Completed', 'Tire replacement', 2.2),
(6, 106, '2025-06-11', 206, 'In Progress', 'Cabin interior refurbishment', 5.0),
(7, 107, '2025-06-13', 207, 'Completed', 'Fuel system check', 3.0),
(8, 108, '2025-06-15', 208, 'Scheduled', 'Software upgrade', 1.0),
(9, 109, '2025-06-17', 209, 'Completed', 'Brake system maintenance', 2.5),
(10, 110, '2025-06-19', 210, 'Completed', 'Engine oil replacement', 3.8);

TRUNCATE TABLE Maintenance_Logs;

DROP TABLE Maintenance_Logs; 
-- queries 
-- 1.
SELECT * FROM Maintenance_Logs;

-- 2.
SELECT Aircraft_ID, Date FROM Maintenance_Logs WHERE Duration_Hour='3.5';

-- 3.
SELECT COUNT(*) AS Total FROM Maintenance_Logs;

-- 4.
SELECT  Date, Airport_ID FROM Maintenance_Logs WHERE Remarks='Engine oil replacement';

-- 5.
SELECT Date, AVG(Airport_ID) FROM Maintenance_Logs GROUP BY Remarks;

-- 6.
ALTER TABLE Maintenance_Logs ADD COLUMN Engine_Type VARCHAR(50) DEFAULT 'Jet';

-- 7.
UPDATE Maintenance_Logs SET Date='2025-06-01'  WHERE Remarks='Engine oil replacement';

-- 8.
DELETE FROM Maintenance_Logs WHERE Date='2025-06-01';

-- 9.
DELETE FROM  Maintenance_Logs WHERE Date='2025-06-01';

-- 10.
DELETE FROM Maintenance_Logs  WHERE Remarks='Engine oil replacement';


-- 10
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
    Ticket_ID INT NOT NULL,
    Payment_Date DATE,
    Payment_Method VARCHAR(50),
    Amount DECIMAL(10, 2),
    Currency VARCHAR(10),
    Transaction_ID VARCHAR(100),
    Status VARCHAR(100)
   );
   
   INSERT INTO Payments (Payment_ID, Ticket_ID, Payment_Date, Payment_Method, Amount, Currency, Transaction_ID, Status) VALUES
(1, 1, '2025-07-01', 'Credit Card', 350.00, 'USD', 'TXN10001', 'Completed'),
(2, 2, '2025-07-02', 'PayPal', 550.00, 'USD', 'TXN10002', 'Completed'),
(3, 3, '2025-07-03', 'Credit Card', 1200.00, 'EUR', 'TXN10003', 'Pending'),
(4, 4, '2025-07-04', 'Debit Card', 400.00, 'USD', 'TXN10004', 'Completed'),
(5, 5, '2025-07-05', 'Credit Card', 600.00, 'USD', 'TXN10005', 'Failed'),
(6, 6, '2025-07-06', 'PayPal', 1100.00, 'EUR', 'TXN10006', 'Completed'),
(7, 7, '2025-07-07', 'Credit Card', 375.00, 'USD', 'TXN10007', 'Completed'),
(8, 8, '2025-07-08', 'Debit Card', 575.00, 'USD', 'TXN10008', 'Pending'),
(9, 9, '2025-07-09', 'Credit Card', 1250.00, 'EUR', 'TXN10009', 'Completed'),
(10, 10, '2025-07-10', 'Credit Card', 390.00, 'USD', 'TXN10010', 'Completed');

TRUNCATE TABLE Payment;
drop table payments;-- 1. 
select * from payment;

-- 2. 
select * from payment where amount between 200 and 300;

-- 3. 
SELECT * 
FROM Payments 
WHERE Status = 'Completed';

-- 4. 
SELECT 
    SUM(Amount) AS Total_USD_Payments 
FROM 
    Payments 
WHERE 
    Currency = 'USD';
    
-- 5. 
    SELECT 
    Payment_Method, 
    COUNT(*) AS Payment_Count 
FROM 
    Payments 
GROUP BY 
    Payment_Method;
    
-- 6. 
SELECT 
    P.Payment_ID AS ID,
    P.Ticket_ID AS Ticket,
    P.Amount AS Payment_Amount,
    P.Currency AS Currency_Code
FROM 
    Payments P;
    
-- 7. 
SELECT * 
FROM Payments 
WHERE Payment_Method = 'Credit Card';

-- 8. 
SELECT * 
FROM Payments 
ORDER BY Amount DESC 
LIMIT 1;

-- 9. 
SELECT 
    SUM(Amount) AS Total_Pending_Amount 
FROM 
    Payments 
WHERE 
    Status = 'Pending';
    
-- 10. 
SELECT * 
FROM Payments 
WHERE Payment_Date BETWEEN '2025-07-03' AND '2025-07-07';