create database xyzCollege;

use xyzCollege;

-- Foriegn Keys
-- Delete and Update Cascade

/*What are Foreign Keys?
 A foreign key is a field in one table that links to the primary key of another table.
 It creates a relationship between the two tables.*/

/*Delete Cascade
A delete cascade means that when a record in the parent table
(the table with the primary key) is deleted, all corresponding records
in the child table (the table with the foreign key) will also be deleted
automatically.*/

/*Update Cascade
An update cascade means that when the primary key of a record in the
parent table is updated, all corresponding foreign keys in the child
table will also be updated automatically.*/

-- Create 5 tables ( Departments, Faculty, Students, Marks, and Salary)

-- Table-1
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,                
    -- Unique identifier for each department
    DepartmentName VARCHAR(100) NOT NULL,        
    -- Name of the department, cannot be NULL
    DepartmentHead VARCHAR(100),                
    -- Head of the department (optional)
    CreationDate DATE NOT NULL,                  
    -- Date the department was created, cannot be NULL
    Budget DECIMAL(15, 2) CHECK (Budget >= 0),  
    -- Budget for the department, must be non-negative
    Location VARCHAR(100),                      
    -- Location of the department (optional)
    PhoneNumber VARCHAR(15),                    
    -- Contact phone number for the department (optional)
    Email VARCHAR(100) UNIQUE,                  
    -- Email address for the department, must be unique
    Status ENUM('Active', 'Inactive') DEFAULT 'Active'
    -- Status of the department (default is 'Active')
);

-- insert values
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentHead, CreationDate, Budget, Location, 
PhoneNumber, Email, Status) VALUES
(1, 'Computer Science', 'Dr. Aditi Joshi', '2015-08-01', 600000.00, 'Main Campus', '022-12345678', 
'cs@mumbaiuniversity.edu', 'Active'),
(2, 'Mechanical Engineering', 'Dr. Rohan Mehta', '2016-07-15', 550000.00, 'Engineering Block', 
'022-23456789', 'mech@mumbaiuniversity.edu', 'Active'),
(3, 'Civil Engineering', 'Dr. Priya Sharma', '2017-09-10', 500000.00, 'Engineering Block', 
'022-34567890', 'civil@mumbaiuniversity.edu', 'Active'),
(4, 'Electrical Engineering', 'Dr. Vikram Singh', '2018-01-20', 520000.00, 'Engineering Block', 
'022-45678901', 'electrical@mumbaiuniversity.edu', 'Inactive'),
(5, 'Information Technology', 'Dr. Neha Gupta', '2019-03-05', 480000.00, 'IT Building', 
'022-56789012', 'it@mumbaiuniversity.edu', 'Active'),
(6, 'Business Administration', 'Dr. Sanjay Rao', '2014-11-11', 700000.00, 'Management Building', 
'022-67890123', 'business@mumbaiuniversity.edu', 'Active'),
(7, 'Psychology', 'Dr. Anjali Verma', '2020-02-25', 300000.00, 'Arts Block', 
'022-78901234', 'psychology@mumbaiuniversity.edu', 'Active'),
(8, 'Economics', 'Dr. Karan Desai', '2018-06-30', 350000.00, 'Social Sciences Building',
 '022-89012345', 'economics@mumbaiuniversity.edu', 'Inactive'),
(9, 'Mathematics', 'Dr. Sneha Patil', '2016-04-15', 400000.00, 'Science Block',
 '022-90123456', 'maths@mumbaiuniversity.edu', 'Active'),
(10, 'History', 'Dr. Amit Bhatia', '2015-12-01', 250000.00, 'Arts Block', 
'022-01234567', 'history@mumbaiuniversity.edu', 'Active');

select * from departments;
#perform delete  and update operations 
#delete a department (eg :departmenid = 1)
delete from Departments where DepartmentId =2;
delete from Faculty where FacultyId =3;

drop table Departments;

#upadte a 

-- Table-2
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,                          
    -- Unique identifier for each faculty member
    FacultyName VARCHAR(100) NOT NULL,                  
    -- Name of the faculty member, cannot be NULL
    DepartmentID INT,                                  
    -- Department the faculty belongs to (optional)
    HireDate DATE NOT NULL,                            
    -- Date the faculty member was hired, cannot be NULL
    Email VARCHAR(100) UNIQUE NOT NULL,                
    -- Email address of the faculty member, must be unique
    PhoneNumber VARCHAR(15),                            
    -- Contact phone number for the faculty member (optional)
   
    -- Here Enum is a String Object
    Position ENUM('Professor', 'Associate Professor', 'Assistant Professor', 'Lecturer') NOT NULL,
    -- Position of the faculty member
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON DELETE SET NULL                            
        -- If a department is deleted, set the Faculty's DepartmentID to NULL
        ON UPDATE CASCADE                              
        -- If a DepartmentID is updated, update it in Faculty
);

-- insert 10 records
INSERT INTO Faculty (FacultyID, FacultyName, DepartmentID, HireDate, Email, PhoneNumber, Position) VALUES
(1, 'Dr. Aditi Sharma', 1, '2015-08-01', 'aditi.sharma@mumbaiuniversity.edu.in', '9876543210', 'Professor'),
(2, 'Prof. Rajesh Mehta', 2, '2016-09-15', 'rajesh.mehta@mumbaiuniversity.edu.in', '8765432109', 
'Associate Professor'),
(3, 'Dr. Neha Patil', 3, '2018-01-10', 'neha.patil@mumbaiuniversity.edu.in', '7654321098', 'Assistant Professor'),
(4, 'Mr. Amit Desai', 1, '2020-07-20', 'amit.desai@mumbaiuniversity.edu.in', '6543210987', 'Lecturer'),
(5, 'Dr. Kavita Joshi', 2, '2017-05-25', 'kavita.joshi@mumbaiuniversity.edu.in', '5432109876', 'Professor'),
(6, 'Prof. Sanjay Kulkarni', 3, '2019-11-11', 'sanjay.kulkarni@mumbaiuniversity.edu.in', '4321098765', 
'Associate Professor'),
(7, 'Ms. Pooja Nair', 4, '2021-06-30', 'pooja.nair@mumbaiuniversity.edu.in', '3210987654', 'Assistant Professor'),
(8, 'Dr. Ramesh Bhat', 5, '2014-03-15', 'ramesh.bhat@mumbaiuniversity.edu.in', '2109876543', 'Professor'),
(9, 'Mr. Vikram Singh', 4, '2022-02-01', 'vikram.singh@mumbaiuniversity.edu.in', '1098765432', 'Lecturer'),
(10, 'Dr. Sneha Iyer', 5, '2020-12-12', 'sneha.iyer@mumbaiuniversity.edu.in', '0987654321', 'Associate Professor');

select * from faculty;

-- Table-3
-- Table: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,                        
    -- Unique identifier for each student (Primary Key)
   
    StudentName VARCHAR(100) NOT NULL,                  
    -- Name of the student, cannot be NULL
    -- This field stores the full name of the student.
   
    DepartmentID INT,                                  
    -- Department the student belongs to (optional)
    -- This field links to the Departments table to indicate the student's department.
   
    EnrollmentDate DATE NOT NULL,                      
    -- Date the student was enrolled, cannot be NULL
    -- This field records the date the student enrolled in the university.
   
    Email VARCHAR(100) UNIQUE NOT NULL,                
    -- Email address of the student, must be unique
    -- This field stores the student's email address and must be unique across all students.
   
    PhoneNumber VARCHAR(15),                            
    -- Contact phone number for the student (optional)
    -- This field is optional and stores the student's contact number.
   
    DateOfBirth DATE,                                  
    -- Date of birth of the student (optional)
    -- This field stores the date of birth of the student for age verification and record-keeping.
   
    Address VARCHAR(255),                              
    -- Residential address of the student (optional)
    -- This field stores the student's residential address.
   
    -- Check constraint for validating email format (basic validation)
    CONSTRAINT chk_EmailFormat CHECK (Email LIKE '%_@__%.__%'),
    -- This ensures that the email address contains at least one character before the '@',
    -- at least two characters after '@', and at least one '.' after the '@'.
   
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
        ON DELETE SET NULL                          
        -- If a department is deleted, set the Student's DepartmentID to NULL
        ON UPDATE CASCADE                            
        -- If a DepartmentID is updated, update it in Students
);

-- insert 10 records
INSERT INTO Students (StudentID, StudentName, DepartmentID, EnrollmentDate, Email, PhoneNumber, DateOfBirth, 
Address) VALUES
(1, 'Aditi Sharma', 1, '2023-08-01', 'aditi.sharma@example.com', '9876543210', '2005-06-15', '123, 
Marine Drive, Mumbai'),
(2, 'Rahul Desai', 2, '2023-08-01', 'rahul.desai@example.com', '9876543211', '2004-05-20', '456, 
Juhu Beach, Mumbai'),
(3, 'Sneha Patil', 1, '2023-08-01', 'sneha.patil@example.com', '9876543212', '2005-07-30', 
'789, Bandra, Mumbai'),
(4, 'Vikram Joshi', 3, '2023-08-01', 'vikram.joshi@example.com', '9876543213', '2004-02-10', 
'321, Andheri, Mumbai'),
(5, 'Priya Iyer', 2, '2023-08-01', 'priya.iyer@example.com', '9876543214', '2005-04-25',
 '654, Powai, Mumbai'),
(6, 'Rohit Mehta', 3, '2023-08-01', 'rohit.mehta@example.com', '9876543215', '2004-11-11', '987, Thane, Mumbai'),
(7, 'Neha Gupta', 1, '2023-08-01', 'neha.gupta@example.com', '9876543216', '2005-12-01', '159, Dadar, Mumbai'),
(8, 'Karan Singh', 2, '2023-08-01', 'karan.singh@example.com', '9876543217', '2004-09-15', '753, Malad, Mumbai'),
(9, 'Anjali Verma', 3, '2023-08-01', 'anjali.verma@example.com', '9876543218', '2005-03-05', '852, Borivali, 
Mumbai'),
(10, 'Siddharth Rao', 1, '2023-08-01', 'siddharth.rao@example.com', '9876543219', '2004-01-20', '963, Ghatkopar, 
Mumbai');

select * from students;


-- Table-4
-- Table: Marks
CREATE TABLE Marks (
    MarkID INT PRIMARY KEY,                              
    -- Unique identifier for each mark record (Primary Key)
   
    StudentID INT,                                      
    -- Student who received the marks
    -- This field links to the Students table to indicate which student received the marks.
   
    FacultyID INT,                                      
    -- Faculty who graded the marks
    -- This field links to the Faculty table to indicate which faculty member graded the marks.
   
    Subject VARCHAR(100) NOT NULL,                      
    -- Subject for which the marks are awarded
    -- This field stores the name of the subject for which the marks are awarded; cannot be NULL.
   
    MarksObtained INT CHECK (MarksObtained >= 0 AND MarksObtained <= 100),
    -- Ensuring marks are within 0-100
    -- This field records the marks obtained by the student; must be between 0 and 100.
   
    ExamDate DATE NOT NULL,                            
    -- Date of the exam
    -- This field records the date on which the exam was conducted; cannot be NULL.
   
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
        ON DELETE CASCADE                              
        -- If a student is deleted, their marks will also be deleted
        ON UPDATE CASCADE,                              
        -- If a StudentID is updated, update it in Marks
       
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
        ON DELETE SET NULL                            
        -- If a faculty member is deleted, set the FacultyID in Marks to NULL
        ON UPDATE CASCADE                              
        -- If a FacultyID is updated, update it in Marks
);

-- insert 10 records
INSERT INTO Marks (MarkID, StudentID, FacultyID, Subject, MarksObtained, ExamDate) VALUES
 (1, 1, 1, 'Mathematics', 85, '2023-05-15'),   -- Student 1
 (2, 2, 2, 'Physics', 78, '2023-05-16'),        -- Student 2
 (3, 3, 3, 'Chemistry', 92, '2023-05-17'),      -- Student 3
 (4, 4, 4, 'Biology', 88, '2023-05-18'),        -- Student 4
 (5, 5, 5, 'Computer Science', 95, '2023-05-19'), -- Student 5
 (6, 6, 6, 'English', 76, '2023-05-20'),        -- Student 6
 (7, 7, 7, 'History', 84, '2023-05-21'),        -- Student 7
 (8, 8, 8, 'Geography', 90, '2023-05-22'),      -- Student 8
 (9, 9, 9, 'Economics', 70, '2023-05-23'),      -- Student 9
 (10, 10, 10, 'Political Science', 82, '2023-05-24'); -- Student 10

select * from  Marks;

-- Table-5
-- Table: Salary
CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY,                          
    -- Unique identifier for each salary record (Primary Key)
   
    FacultyID INT,                                      
    -- Faculty member whose salary is recorded
    -- This field links to the Faculty table to indicate which faculty member the salary belongs to.
   
    SalaryAmount DECIMAL(10, 2) CHECK (SalaryAmount >= 0),
    -- Ensuring salary is non-negative
    -- This field records the amount of salary paid to the faculty member; must be non-negative.
   
    PaymentDate DATE NOT NULL,                          
    -- Date of salary payment
    -- This field records the date on which the salary was paid; cannot be NULL.
   
    PaymentMethod VARCHAR(50) NOT NULL,                
    -- Method of payment (e.g., bank transfer, cash)
    -- This field indicates the method used for salary payment; cannot be NULL.
   
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
        ON DELETE CASCADE                              
        -- If a faculty member is deleted, their salary record will also be deleted
        ON UPDATE CASCADE                              
        -- If a FacultyID is updated, update it in Salary
);

-- insert 10 records
-- Inserting records into the Salary table
INSERT INTO Salary (SalaryID, FacultyID, SalaryAmount, PaymentDate, PaymentMethod) VALUES
(1, 1, 50000.00, '2023-06-30', 'Bank Transfer'),    
-- Faculty 201
(2, 2, 55000.00, '2023-06-30', 'Cash'),              
-- Faculty 202
(3, 3, 60000.00, '2023-06-30', 'Bank Transfer'),    
-- Faculty 203
(4, 4, 52000.00, '2023-06-30', 'Cheque'),            
-- Faculty 204
(5, 5, 51000.00, '2023-07-30', 'Bank Transfer'),    
-- Faculty 201
(6, 2, 53000.00, '2023-07-30', 'Cash'),              
-- Faculty 202
(7, 3, 59000.00, '2023-07-30', 'Bank Transfer'),    
-- Faculty 203
(8, 4, 54000.00, '2023-07-30', 'Cheque'),            
-- Faculty 204
(9, 1, 52000.00, '2023-08-30', 'Bank Transfer'),    
-- Faculty 201
(10, 2, 55000.00, '2023-08-30', 'Cash');              
-- Faculty 202

select * from salary;


-- Check the Salary table to see if the salary record for FacultyID=1 is deleted
SELECT * FROM Salary; -- Salary record for Faculty ID 1 should be gone

-- Check the Marks table to see the effects
SELECT * FROM Marks; -- Faculty ID for marks graded by Faculty ID 1 should be NULL

-- Update a department ID (e.g., change DepartmentID from 2 to 20)
UPDATE Departments SET DepartmentID = 20 WHERE DepartmentID = 2;

-- Check the Faculty and Students tables to see the effects
SELECT * FROM Faculty; -- Department ID for faculty who were in department 2 should now be 20
SELECT * FROM Students; -- Department ID for students who were in department 2 should now be 20

-- Update a faculty ID (e.g., change Faculty ID from 3 to 30)
delete from Departments where DepartmentId =5;
UPDATE Faculty 
SET DepartmentID=101
WHERE FacultyID = 1;
#----------------------------------------------------------------------------------------------------------------------------------------
/*
If you are creating constraints, it's a good practice to use a consistent naming convention.
This can help you easily identify constraints later. A common convention is to use the format:

For CHECK constraints: chk_<table>_<column>
For UNIQUE constraints: unique_<table>_<column>
For FOREIGN KEY constraints: fk_<table>_<referenced_table>

Adding Constraints -->

1. Adding a Foreign Key Constraint:
You can add a foreign key constraint to an existing table to enforce referential integrity.

2. Adding a Unique Constraint:
You can add a unique constraint to ensure that all values in a column are different.

3.Adding a check constraints:
you can a add check constraints to enforce a condition on the value  in a cloumn.

dropping constraints:

1. dropping a foreign key constraint:
we can drop  a foreign key coonstriant if you no longer need it.

2. dropping a unqiue constraints:
we can drop unique constraints if you want to allow duplicate values  ina column 

3.dropping a check constraints :
we can drop check constraints  if you want to remove  the conditions  on a column.

example of adding constraints with naming constraints:

alter table  flights
add constraints chk_flight_duration check (flight duration > 0);
*/
# 1.adding a foreign key  contraints  to the mark table.
 
alter table marks 
add constraint fk_student
foreign key(studentId) references student(student_id)
on delete cascade 
on update cascade;

#2 adding a unique constraints  to the faculty table  on email
alter table Faculty
add constraint uq_faculty_email unique(email);

#3 adding a check constraints to the salary table  to ensure salary amount is postive
alter table Salary
add constraint check_salary_amount  check(salaryamount > 0);

#-----------------------------------------------------------------------------------------------------------
/*
Dropping Constraints

1. Dropping a Foreign Key Constraint: 
You can drop a foreign key constraint if you no longer need it.

2. Dropping a Unique Constraint: 
You can drop a unique constraint if you want to allow duplicate values in a column.

3. Dropping a Check Constraint: 
You can drop a check constraint if you want to remove the condition on a column.


Example of Adding Constraints with Naming Conventions

ALTER TABLE Flights 
ADD CONSTRAINT chk_flight_duration CHECK (Flight_Duration > 0);



-- 1. Adding a Foreign Key Constraint to the Marks table
ALTER TABLE Marks
ADD CONSTRAINT fk_student
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 2. Adding a Unique Constraint to the Faculty table on Email
ALTER TABLE Faculty
ADD CONSTRAINT uq_faculty_email UNIQUE (Email);

-- 3. Adding a Check Constraint to the Salary table to ensure SalaryAmount is positive
ALTER TABLE Salary
ADD CONSTRAINT chk_salary_amount CHECK (SalaryAmount > 0);

-- 4. Dropping a Foreign Key Constraint from the Marks table
ALTER TABLE Marks
DROP FOREIGN KEY fk_student;

-- 5. Dropping a Unique Constraint from the Faculty table
ALTER TABLE Faculty
DROP INDEX uq_faculty_email;

-- 6. Dropping a Check Constraint from the Salary table
ALTER TABLE Salary
DROP CHECK chk_salary_amount;

-- 7. Adding a new Check Constraint to the Students table to ensure age is valid
ALTER TABLE Students
ADD CONSTRAINT chk_age CHECK (YEAR(CURDATE()) - YEAR(DateOfBirth) >= 0);

-- 8. Dropping the Check Constraint from the Students table
ALTER TABLE Students
DROP CHECK chk_age;

*/

/*
/*
What Are Operators in MySQL?
Operators in MySQL are special symbols or keywords used to perform operations on one or more operands
(values, expressions, or fields) in a MySQL query. They are essential for forming conditions, manipulating data,
'and retrieving desired results from the database. Operators help in computations, comparisons, logical evaluation:
string concatenations, and much more.


1. Arithmetic Operators

+: Addition
-: Subtraction
*: Multiplication
/: Division
%: Modulus (remainder after division)
DIV: Integer division (returns integer part of division)
MOD: Modulus (same as % in MySQL)

2.campariosn opeartors :
=  : equal to 
<> or != : not equal to
> : greater than
< : less than 
<= : less than equal to
>= : greater then eaqual to 
LIKE:Pattern matchine using wildcard (% and)
like not : pattern not matching
regexp :  regular expresiion matching 
 not regexp :  regular expression  not matching
 
3.logical operators :

 AND :  logical and (true if both  conditions are true)
 OR : logical or (if aleast one conditions are true)
 NOT : logical not (neagtes the conditions )
 XOR : logical exclusive  or (true if one conditions are true)
 
 4. Assignment Operators
=: Assign a value to a variable or column
:: Assign a value to a user-defined variable
+=: Addition assignment (not standard in MySQL but used in some cases)
-=: Subtraction assignment
*=: Multiplication assignment
/: Division assignment
%: Modulus assignment
DIV: Integer division assignment
MOD=: Modulus assignment


5. Bitwise Operators :
&: Bitwise AND
: Bitwise OR
^: Bitwise XOR
~: Bitwise NOT (inverts the bits)
<<<: Left shift
>>: Right shift

6.strings opeartors :
CONCAT(): Concatenate strings (e.g., CONCAT('Hello', World'))
||: String concatenation (alternative to CONCAT in some MySQL versions)

7. Other Operators
IN: Membership test (checks if a value exists in a list or subquery)
NOT IN: Membership test (checks if a value does not exist in a list or subquery)
BETWEEN: Range test (checks if a value is within a range)
NOT BETWEEN: Range test (checks if a value is outside a range)
IS NULL: Null test (checks if a value is NULL)
IS NOT NULL: Null test (checks if a value is not NULL)
EXISTS: Subquery test (true if subquery returns any rows)
NOT EXISTS: Subquery test (true if subquery returns no rows)


why are operators important in mysql ?
simplify query logic  : operators  make it easy to specify conditions  and manipulate data  directly in mysql  statements.
dyanamic data  retreive  : help fetch specific  records based on  camparisons and logical  conditions.
data manipulation : arthemtic and string opeartors  allow dynamic computatiing and formatting of data.
Efficient Filtering: Operators like LIKE and BETWEEN enable precise filtering for large datasets.

these operators covers a wide range of  functionallity , from basic  arthemtic to advanced logical  and string manipulication, enabled 
effiecient data  handled and querying in mysql.
*/
#create  the airline  database  if it doesnot  already exists:
create database if not exists airline123;

use airline123; # --> set the context  to the airline database
drop database airline;#--> to remove the databse compeletely

#-------------------------------------------tables queries -----------------------------------------------------------------------

#data definition language --> (ddl) {create,alter,truncate,drop,rename,comment}
#data manipulation language -->(dml) {update,delete,insert}
#data query language --->(dql) {select}


#table 1--create flight table 
CREATE TABLE Flights (
Flight_ID INT PRIMARY KEY,--  Unique identifier for each flight (Primary Key)
Flight_Number VARCHAR(10) NOT NULL, -- Flight number (e.g., AA123) (Not Null)
Departure_Airport VARCHAR(100) NOT NULL,-- Name of the departure airport (Not Null)
Arrival_Airport VARCHAR(100) NOT NULL,-- Name of the arrival airport (Not Null)
Departure_Time DATETIME NOT NULL,-- Scheduled departure time (Not Null)
Arrival_Time DATETIME NOT NULL, -- Scheduled arrival time (Not Null)
Flight_Duration INT NOT NULL, -- Duration of the flight in minutes (Not Null)
Seats_Available INT NOT NULL CHECK (Seats_Available >= 0),
-- Number of available seats (Not Null, must be non-negative)
Aircraft_Type VARCHAR(50) NOT NULL, -- Type of aircraft used for the flight (Not Null)
Status ENUM('On Time', 'Delayed', 'Cancelled') NOT NULL DEFAULT 'On Time'
#--current status on the flight(not null,default is 'on time')
);

-- Insert Records into Flights Table

INSERT INTO Flights (Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport, Departure_Time, Arrival_Time, 
Flight_Duration, Seats_Available, Aircraft_Type, Status)
VALUES 
(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 
'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 
'Airbus A320', 'On Time'),
(3, 'AI103', 'Delhi (DEL)', 'Bangalore (BLR)', '2023-10-01 07:00:00', '2023-10-01 09:30:00', 150, 70, 
'Boeing 737', 'On Time'),
(4, 'AI104', 'Bangalore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 
'Airbus A320', 'On Time'),
(5, 'AI105', 'Delhi (DEL)', 'Chennai (MAA)', '2023-10-01 08:00:00', '2023-10-01 10:30:00', 150, 40, 
'Boeing 737', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 
'Airbus A320', 'On Time'),
(7, 'AI107', 'Delhi (DEL)', 'Kolkata (CCU)', '2023-10-01 09:00:00', '2023-10-01 11:30:00', 150, 30, 
'Boeing 737', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 
'Airbus A320', 'On Time'),
(9, 'AI109', 'Delhi (DEL)', 'Hyderabad (HYD)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 60, 
'Boeing 737', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 
'Airbus A320', 'On Time'),
(11, 'AI111', 'Delhi (DEL)', 'Pune (PNQ)', '2023-10-01 14:00:00', '2023-10-01 16:00:00', 120, 40, 
'Boeing 737', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 
'Airbus A320', 'On Time'),
(13, 'AI113', 'Delhi (DEL)', 'Ahmedabad (AMD)', '2023-10-01 15:00:00', '2023-10-01 17:00:00', 120, 50, 
'Boeing 737', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 
'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 
'Boeing 737', 'On Time');

select * from Flights;

#---operators
#ARTHEMETIC OPEARTORS :

#-- calculate the total flight duration fore flight  AI101, addiding 30 minutes  for a layover.
select Flight_Number ,Flight_Duration + 30 as total_duratiom from Flights
where Flight_Number = 'AI101';

#--calculate the remaning  seats after booking  10 seats  for flight AI102
select Flight_Number,Seats_Available-10 as ramining_seats from Flights where Flight_Number = 'AI102';

#calcualte the total available seats  for all flights  by summing  the seat_available columns
select sum(Seats_Available)  as total_Seats_Available from Flights;

#calculate the avearge flight  duration across the flight
select avg(Flight_Duration) as average_Flight_Duration from Flights;

#calculate the avearge flight  duration in hours for each flight
select  Flight_number, Flight_Duration / 60 as duration_hours from Flights;

#camparsion operators :
#--Select all details for the flight with Flight_Number 'A1101'
SELECT *
FROM Flights
WHERE Flight_Number = 'AI101';# Using '' operator
#--Select all flights with a duration less than 120 minutes

SELECT *
FROM Flights
WHERE Flight_Duration < 120; #--Using '<' operator;

#Select all flights with a duration greater than 150 minutes
SELECT *
FROM Flights
WHERE Flight_Duration > 150; #--Using '>' operator


#Select all flights with a duration less than or equal to 90 minutes
SELECT *
FROM Flights
WHERE Flight_Duration <= 90; -- Using '<=' operator

-- Select all flights with a duration greater than or equal to 180 minutes
SELECT *
FROM Flights
WHERE Flight_Duration >= 180; -- Using '>=' operator

select * from Flights;


-- Logical operators: AND, OR, NOT
-- Find flights from Delhi to Mumbai that are on time and have available seats.
SELECT * FROM Flights
WHERE Departure_Airport = 'Delhi (DEL)'
AND Arrival_Airport = 'Mumbai (BOM)'
AND Status = 'On Time'
AND Seats_Available > 0;
-- Find flights that either depart from Delhi or arrive in Delhi.
SELECT * FROM Flights
WHERE Departure_Airport = 'Delhi (DEL)'
OR Arrival_Airport = 'Delhi (DEL)';
-- Find flights that are not delayed.
SELECT * FROM Flights
WHERE NOT Status = 'Delayed';

-- Find all unique arrival airports for flights that are on time and have more than 50 seats available.
 SELECT DISTINCT Arrival_Airport FROM Flights
WHERE Status = 'On Time'
AND Seats_Available > 50;

-- Find all unique departure airports for flights that are either delayed or cancelled.
SELECT DISTINCT Departure_Airport FROM Flights WHERE Status IN ('Delayed', 'Cancelled');

-- String operators: LIKE, REGEXP, NOT LIKE

-- Find flights with flight numbers starting with 'AI'.
SELECT * FROM Flights
WHERE Flight_Number LIKE 'AI%';

-- Find flights that have 'Delhi' in either the departure or arrival airport.
SELECT * FROM Flights
WHERE Departure_Airport REGEXP 'Delhi'
OR Arrival_Airport REGEXP 'Delhi';

-- Find flights that do not go to Chennai.
SELECT * FROM Flights
WHERE Arrival_Airport NOT LIKE 'Chennai (MAA)';

-- Find flights that do not have '737' in the aircraft type.
SELECT * FROM Flights
WHERE Aircraft_Type NOT LIKE '%737%';



-- Set operators: UNION, UNION ALL, INTERSECT, EXCEPT or DIFFERENCE

-- Find all unique arrival airports from flights departing from Delhi and flights arriving in Delhi.
SELECT Arrival_Airport FROM Flights
WHERE Departure_Airport = 'Delhi (DEL)'
UNION
SELECT Departure_Airport FROM Flights
WHERE Arrival_Airport = 'Delhi (DEL)';

SELECT Arrival_Airport FROM Flights
WHERE Departure_Airport = 'Delhi (DEL)'
INTERSECT
SELECT Departure_Airport FROM Flights
WHERE Arrival_Airport = 'Delhi (DEL)';

-- Find flights where Departure_Airport is Delhi or Arrival_Airport is Delhi
SELECT * FROM Flights
WHERE Departure_Airport = 'Delhi (DEL)'
UNION
SELECT * FROM Flights
WHERE Arrival_Airport = 'Delhi (DEL)';

/*
Find flights that are both departing from Delhi and arriving in Mumbai
(Note: INTERSECT is not supported in all SQL databases, so this is a conceptual example).
*/
-- Control flow operators: IF, CASE

-- Create a query that categorizes flights based on their status.

#create a query that provides a summary of flight status with counts
select status,count(*) from Flights group by status;

# creat a query  that catergeries flight baesd on their duration
SELECT Flight_ID, Flight_Number,
CASE
    when Flight_Duration < 120 then 'short haul'
    when Flight_Duration  between 120 and 180 then 'medium haul'
    else 'long haul'
end as Flight_Duration_category
from flights;    



SELECT Flight_ID, Flight_Number,
CASE
    WHEN Status = 'On Time' THEN 'Flight is on schedule'
    WHEN Status = 'Delayed' THEN 'Flight is delayed'
    WHEN Status = 'Cancelled' THEN 'Flight is cancelled'
END AS Flight_Status_Description
FROM Flights;

-- Bitwise operators

/*
Get Binary Number -

------512, 256, 128, 64, 32, 16, 8, 4, 2, 1

Binary of 5 is - 0101  
Binary of 3 is - 0011

Common Bitwise Operators in MySQL
AND (&): Compares each bit of two numbers and returns a new number with bits set to 1 only where both bits are 1.  
OR (|): Compares each bit of two numbers and returns a new number with bits set to 1 where at least one of the bits is 1.  
XOR (^): Compares each bit of two numbers and returns a new number with bits set to 1 where the bits are different.  
NOT (~): Inverts the bits of a number.  
Left Shift (<<): Shifts the bits of a number to the left by a specified number of positions.  
Right Shift (>>): Shifts the bits of a number to the right by a specified number of positions.  

Bitwise operators can be useful in various scenarios, such as:

1. Flags and Permissions: Using bitwise operations to manage user permissions or feature flags.  
2. Data Compression: Storing multiple boolean values in a single integer.  
3. Efficient Calculations: Performing low-level data manipulation or optimizations.

Let's say we have a table called users that stores user permissions as a bitmask.  
Each permission corresponds to a specific bit in an integer:

1 (0001) - Read permission  
2 (0010) - Write permission  
4 (0100) - Execute permission  
8 (1000) - Delete permission

#create a table 
*/
create table users(
id int primary key auto_increment,
username varchar(60),
email varchar(80) not null unique,
password_hash varchar(255) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp,
permissions  int not null);

#let's insert some users  with different permisiions
insert into users (username,email,password_hash,permissions) values
('Alice', 'alice@example.com', 'hashed_password_1', 3),-- Read (1) + Write (2) = 3 (0011)
('Bob', 'bob@example.com', 'hashed_password_2', 5),-- Read (1) + Execute (4) = 5 (0101)
('Charlie', 'charlie@example.com', 'hashed_password_3', 8),-- Delete (8) = 8 (1000)
('David', 'david@example.com', 'hashed_password_4', 15),-- All permissions (1111)
('Eve', 'eve@example.com', 'hashed_password_5', 1),-- Read (1)
('Frank', 'frank@example.com', 'hashed_password_6', 6),-- Write (2) + Execute (4) = 6 (0110) 
('Grace', 'grace@example.com', 'hashed_password_7', 10), -- Write (2) + Delete (8) = 10 (1010)
('Hannah', 'hannah@example.com', 'hashed_password_8', 12),-- Execute (4) + Delete (8) = 12 (1100)
('Isaac', 'isaac@example.com', 'hashed_password_9', 0),-- No permissions
('Jack', 'jack@example.com', 'hashed_password_10', 7);-- Read (1) + Write (2) + Execute (4) = 7 (0111)

select * from users;
drop table users;


select * from users where permissions =1;
select count(username) from users where (permissions & 1)=1;

select * from users where (permissions & 3)=3;#users with raed and write  permisions

select * from users where (permissions & 2)=2;#write
select * from users where (permissions & 4)=4;#excute
select * from users where (permissions & 8)=8;#delete
set SQL_SAFE_UPDATES = 0;

select * from users;
update users 
set permissions = permissions & 4
where username = 'Alice';

update users 
set permissions = permissions | 2
where username = 'Alice';

#remove permission
update users 
set permissions = permissions &~ 2
where username = 'Alice';

select * from users;

#toggle permisiions
update users 
set permissions = permissions ^ 4
where username = 'Charlie';

#count users with specific  permisiions
-- Count Users with a Specific Permission
SELECT COUNT(*) AS user_count FROM users WHERE (permissions & 1) = 1;
-- List Users with No Permissions
SELECT * FROM users WHERE permissions = 0;
-- List Users with All Permissions
SELECT * FROM users WHERE permissions = 15; -- 15 = 1111 in binary
-- Get Permissions as Binary String
SELECT username, BIN(permissions) AS permissions_binary FROM users;#binary -> bin
-- Find Users with At Least One Permission
SELECT * FROM users WHERE permissions > 0;
-- Find Users with No Read Permission
SELECT * FROM users WHERE (permissions & 1) = 0; -- Users without Read pe
-- Find Users with Either Write or Execute Permission
SELECT * FROM users WHERE (permissions & (2 | 4)) > 0; -- Users

update users 
set permissions = permissions | 8
where username in('Alice','Bob');



-- ----------------------------------------------- Practice Portion --------------------------------------------

-- Select, Alter, delete & update Queries
 
 /*
 1. SELECT Query
The SELECT statement is used to retrieve data from a database table. 
It allows you to specify the columns you want to fetch and apply conditions to filter the results.

Syntax-

SELECT column1, column2, ...  
FROM table_name  
WHERE condition;  
 */
 
 -- 1. Select Queries
 
 -- Select all records from Flights table
 SELECT * FROM Flights;

-- Select flights that are delayed
SELECT * FROM Flights WHERE Status = 'Delayed';

-- Select distinct aircraft types used in flights
SELECT DISTINCT Aircraft_Type FROM Flights;
 
-- Select all flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time;

-- Count the number of flights per status
SELECT Status, COUNT(*) AS NumberOfFlights 
FROM Flights 
GROUP BY Status;

-- Select statuses with more than 5 flights
SELECT Status, COUNT(*) AS NumberOfFlights 
FROM Flights 
GROUP BY Status 
HAVING COUNT(*) > 5; 

-- Select Flights from a Specific Departure Airport
SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)';

-- Select Flights with More Than 50 Seats Available
SELECT * FROM Flights WHERE Seats_Available > 50;

-- Select Flights Ordered by Arrival Time
SELECT * FROM Flights ORDER BY Arrival_Time;

-- Select Flights with a Duration Greater Than 120 Minutes
SELECT * FROM Flights WHERE Flight_Duration > 120;

-- Select Distinct Aircraft Types
SELECT DISTINCT Aircraft_Type FROM Flights;

-- Select Flights with Arrival Time After a Specific Date
SELECT * FROM Flights WHERE Arrival_Time > '2023-10-01 12:00:00';

-- Select Flights with a Specific Flight Number
SELECT * FROM Flights WHERE Flight_Number = 'AI101';

/*
2. ALTER Query
The ALTER statement is used to modify the structure of an existing table, 
such as adding, deleting, or modifying columns.
The ALTER query changes the table structure, not the data.

Syntax-

ALTER TABLE table_name  
ADD column_name datatype;  
-- or  
ALTER TABLE table_name  
DROP COLUMN column_name;  
-- or  
ALTER TABLE table_name  
MODIFY column_name new_datatype;  
*/

-- 2. Update Queries

-- Update the number of available seats for a specific flight
UPDATE Flights 
SET Seats_Available = 49
WHERE Flight_ID = 2;

Select * from Flights;

-- Update the Status of a Flight
UPDATE Flights SET Status = 'Cancelled' WHERE Flight_ID = 1;

-- Update the Arrival Airport for a Specific Flight
UPDATE Flights SET Arrival_Airport = 'Chennai (MAA)' WHERE Flight_ID = 3;

-- Update the Flight Duration for a Specific Flight
UPDATE Flights SET Flight_Duration = 130 WHERE Flight_ID = 4;

-- Update the Aircraft Type for a Specific Flight
UPDATE Flights SET Aircraft_Type = 'Boeing 777' WHERE Flight_ID = 5;

-- Update the Departure Time for a Specific Flight
UPDATE Flights SET Departure_Time = '2023-10-01 07:00:00' WHERE Flight_ID = 6;

-- Update Multiple Fields for a Specific Flight
UPDATE Flights SET Seats_Available = 60, Status = 'On Time' WHERE Flight_ID = 7;

-- Update Status for All Delayed Flights
UPDATE Flights SET Status = 'On Time' WHERE Status = 'Delayed';

-- Update the Flight Number for a Specific Flight
UPDATE Flights SET Flight_Number = 'AI201' WHERE Flight_ID = 8;

-- Update the Departure Airport for Multiple Flights
UPDATE Flights SET Departure_Airport = 'Delhi (DEL)' WHERE Arrival_Airport = 'Mumbai (BOM)';

/*
3. DELETE Query
The DELETE statement is used to remove rows from a table based on a specified condition.

Syntax- 

DELETE FROM table_name  
WHERE condition;  
*/
-- 3. Delete Queries

-- Delete a specific flight
DELETE FROM Flights 
WHERE Flight_ID = 2;

-- Delete All Delayed Flights
DELETE FROM Flights WHERE Status = 'Delayed';

-- Delete Flights with No Available Seats
DELETE FROM Flights WHERE Seats_Available = 0;

-- Delete a Flight by Flight Number
DELETE FROM Flights WHERE Flight_Number = 'AI101';

-- Delete Flights Departing Before a Specific Date
DELETE FROM Flights WHERE Departure_Time < '2023-10-01 00:00:00';

-- Delete All Flights to a Specific Destination
DELETE FROM Flights WHERE Arrival_Airport = 'Jaipur (JAI)';

-- Delete Flights with a Duration Less Than a Specific Value
DELETE FROM Flights WHERE Flight_Duration < 90;

-- Delete Flights with a Specific Status
DELETE FROM Flights WHERE Status = 'Cancelled';

-- Delete Flights with a Specific Aircraft Type
DELETE FROM Flights WHERE Aircraft_Type = 'Airbus A320';

-- Delete All Flights with Less Than 30 Seats Available
DELETE FROM Flights WHERE Seats_Available < 30;

/*
4. UPDATE Query
The UPDATE statement is used to modify existing records in a table.

Syntax:

UPDATE table_name  
SET column1 = value1, column2 = value2, ...  
WHERE condition;  
*/
-- 4. Alter Queries

-- Add a new column for flight's terminal
ALTER TABLE Flights 
ADD COLUMN Terminal VARCHAR(10);

-- Drop the Terminal column from Flights table
ALTER TABLE Flights 
DROP COLUMN Terminal;

-- Add a New Column for Flight's Airline
ALTER TABLE Flights ADD COLUMN Airline VARCHAR(50);

-- Change the Data Type of Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(15);

-- Rename the Arrival_Airport Column
#ALTER TABLE Flights RENAME COLUMN Arrival_Airport TO Destination_Airport;

-- Add a Default Value for Seats_Available
ALTER TABLE Flights ALTER COLUMN Seats_Available SET DEFAULT 100;

-- Rename the Flights Table
ALTER TABLE Flights RENAME TO Flight_Schedules;

 
 -- 5. Add & drop Constraints Queries 
 
 -- Add a CHECK constraint to ensure Flight_Duration is positive
ALTER TABLE Flights 
ADD CONSTRAINT chk_flight_duration CHECK (Flight_Duration > 0);

-- Drop the CHECK constraint on Flight_Duration
ALTER TABLE Flights 
#DROP CONSTRAINT chk_flight_duration;

-- Add a CHECK Constraint for Flight Duration
ALTER TABLE Flights ADD CONSTRAINT chk_flight_duration CHECK (Flight_Duration > 0);

-- Drop the CHECK Constraint on Flight Duration
#ALTER TABLE Flights DROP CONSTRAINT chk_flight_duration;

-- Add a UNIQUE Constraint on Flight_Number
ALTER TABLE Flights ADD CONSTRAINT unique_flight_number UNIQUE (Flight_Number);

-- Add a CHECK Constraint for Seats Available
ALTER TABLE Flights ADD CONSTRAINT chk_seats_available CHECK (Seats_Available >= 0);

-- Drop the CHECK Constraint on Seats Available
#ALTER TABLE Flights DROP CONSTRAINT chk_seats_available;

-- Add a FOREIGN KEY Constraint (if applicable)
ALTER TABLE Flights ADD CONSTRAINT fk_airport FOREIGN KEY (Departure_Airport) REFERENCES Airports(Airport_Name);

-- Drop the FOREIGN KEY Constraint
#ALTER TABLE Flights DROP CONSTRAINT fk_airport;

-- Add a NOT NULL Constraint to Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(10) NOT NULL;

-- Drop the NOT NULL Constraint from Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(10);

-- Add a DEFAULT Constraint for Status
ALTER TABLE Flights ALTER COLUMN Status SET DEFAULT 'On Time';

-- Drop the DEFAULT Constraint for Status
ALTER TABLE Flights ALTER COLUMN Status DROP DEFAULT;

-- Add a UNIQUE Constraint on Aircraft_Type
ALTER TABLE Flights ADD CONSTRAINT unique_aircraft_type UNIQUE (Aircraft_Type);

-- Drop the UNIQUE Constraint on Aircraft_Type
#ALTER TABLE Flights DROP CONSTRAINT unique_aircraft_type;