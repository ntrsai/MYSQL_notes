
-- Implement Healthcare System Using Database
create database Healthcare_System;
use Healthcare_System;


-- Patients Table
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age > 0),
    Gender VARCHAR(10),
    Contact VARCHAR(20) UNIQUE,
    Address VARCHAR(100)
);
-- Patients
INSERT INTO Patients (Name, Age, Gender, Contact, Address) VALUES
('Ravi Kumar', 32, 'Male', '9876543210', 'Mumbai'),
('Neha Sharma', 28, 'Female', '9123456780', 'Delhi'),
('Amit Verma', 45, 'Male', '9998887771', 'Pune'),
('Priya Singh', 30, 'Female', '9998887772', 'Chennai'),
('Rahul Mehra', 50, 'Male', '9998887773', 'Kolkata'),
('Sneha Gupta', 35, 'Female', '9998887774', 'Bangalore'),
('Arjun Reddy', 40, 'Male', '9998887775', 'Hyderabad'),
('Kavita Joshi', 27, 'Female', '9998887776', 'Ahmedabad'),
('Vikram Patel', 38, 'Male', '9998887777', 'Jaipur'),
('Meena Das', 29, 'Female', '9998887778', 'Lucknow');

#queries

SELECT * FROM Patients;
SELECT Name, Age FROM Patients WHERE Age > 40;
SELECT COUNT(*) AS Total_Patients FROM Patients;
SELECT Name, Address FROM Patients ORDER BY Address;
SELECT Name, Age FROM Patients WHERE Gender = 'Female';
SELECT Gender, COUNT(*) AS Count FROM Patients GROUP BY Gender;
SELECT Address, COUNT(*) FROM Patients GROUP BY Address HAVING COUNT(*) > 1;
SELECT * FROM Patients LIMIT 5;
SELECT Name, Age FROM Patients ORDER BY Age DESC;
SELECT * FROM Patients WHERE Address LIKE '%i';
ALTER TABLE Patients ADD Blood_Group VARCHAR(10);
UPDATE Patients SET Contact = '9991112222' WHERE Patient_ID = 1;
DELETE FROM Patients WHERE Patient_ID = 10;
ALTER TABLE Patients DROP COLUMN Blood_Group;
SELECT Name, Age FROM Patients ORDER BY Age DESC LIMIT 1;
SELECT AVG(Age) AS Avg_Age FROM Patients;
SELECT Address, COUNT(*) AS Patient_Count FROM Patients GROUP BY Address;
SELECT Address, GROUP_CONCAT(Name) FROM Patients GROUP BY Address HAVING COUNT(*) > 1;
SELECT Gender, COUNT(*) AS Count FROM Patients GROUP BY Gender;
drop table Patients;
truncate table Patients;



-- =========================================================================================================================

-- Doctors Table
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Specialty VARCHAR(50),
    Phone VARCHAR(20) UNIQUE,
    Email VARCHAR(50) UNIQUE
);
-- Doctors
INSERT INTO Doctors (Name, Specialty, Phone, Email) VALUES
('Dr. Mehta', 'Cardiology', '9001112233', 'mehta@hospital.com'),
('Dr. Roy', 'Neurology', '9004445566', 'roy@hospital.com'),
('Dr. Iyer', 'Orthopedics', '9005556677', 'iyer@hospital.com'),
('Dr. Banerjee', 'Dermatology', '9008889991', 'banerjee@hospital.com'),
('Dr. Kapoor', 'Pediatrics', '9008889992', 'kapoor@hospital.com'),
('Dr. Sharma', 'Oncology', '9008889993', 'sharma@hospital.com'),
('Dr. Jain', 'ENT', '9008889994', 'jain@hospital.com'),
('Dr. Singh', 'General Medicine', '9008889995', 'singh@hospital.com'),
('Dr. Nair', 'Radiology', '9008889996', 'nair@hospital.com'),
('Dr. Das', 'Urology', '9008889997', 'das@hospital.com');

#queries 
SELECT * FROM Doctors;
SELECT Name, Specialty FROM Doctors WHERE Specialty = 'Cardiology';
SELECT COUNT(*) AS Total_Doctors FROM Doctors;
SELECT Name, Specialty FROM Doctors ORDER BY Specialty;
SELECT Name, Phone FROM Doctors WHERE Specialty = 'Neurology';
SELECT Specialty, COUNT(*) AS Count FROM Doctors GROUP BY Specialty;
SELECT Specialty, COUNT(*) FROM Doctors GROUP BY Specialty HAVING COUNT(*) > 1;
SELECT * FROM Doctors LIMIT 5;
SELECT Name, Specialty FROM Doctors ORDER BY Name DESC;
SELECT * FROM Doctors WHERE Name LIKE 'Dr.%';
ALTER TABLE Doctors ADD Experience INT;
UPDATE Doctors SET Phone = '9000001111' WHERE Doctor_ID = 1;
DELETE FROM Doctors WHERE Doctor_ID = 10;
ALTER TABLE Doctors DROP COLUMN Experience;
SELECT Name, Specialty FROM Doctors ORDER BY Doctor_ID DESC LIMIT 1;
SELECT COUNT(*) AS Total_Specialties FROM (SELECT DISTINCT Specialty FROM Doctors) AS t;
SELECT Specialty, COUNT(*) AS Doctor_Count FROM Doctors GROUP BY Specialty;
SELECT Specialty, GROUP_CONCAT(Name) FROM Doctors GROUP BY Specialty HAVING COUNT(*) > 1;
SELECT LENGTH(Name) AS Name_Length, Name FROM Doctors ORDER BY Name_Length DESC;
DROP TABLE Doctors;
TRUNCATE TABLE Doctors;

-- ========================================================================================================================
-- Departments Table
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) UNIQUE,
    Location VARCHAR(50),
    Phone VARCHAR(20),
    Head_Doctor INT,
    FOREIGN KEY (Head_Doctor) REFERENCES Doctors(Doctor_ID)
);

-- Departments
INSERT INTO Departments (Name, Location, Phone, Head_Doctor) VALUES
('Cardiology', 'Block A', '022-1234567', 1),
('Neurology', 'Block B', '022-9876543', 2),
('Orthopedics', 'Block C', '022-8765432', 3),
('Dermatology', 'Block D', '022-7654321', 4),
('Pediatrics', 'Block E', '022-6543210', 5),
('Oncology', 'Block F', '022-5432109', 6),
('ENT', 'Block G', '022-4321098', 7),
('General Medicine', 'Block H', '022-3210987', 8),
('Radiology', 'Block I', '022-2109876', 9),
('Urology', 'Block J', '022-1098765', 10);
#queries 
SELECT * FROM Departments;
SELECT Name, Location FROM Departments WHERE Location = 'Block A';
SELECT COUNT(*) AS Total_Departments FROM Departments;
SELECT Name, Phone FROM Departments ORDER BY Name;
SELECT Name FROM Departments WHERE Name LIKE '%ology';

SELECT Location, COUNT(*) FROM Departments GROUP BY Location;
SELECT Head_Doctor, COUNT(*) FROM Departments GROUP BY Head_Doctor HAVING COUNT(*) > 1;
SELECT * FROM Departments LIMIT 5;
SELECT Name, Location FROM Departments ORDER BY Department_ID DESC;
SELECT * FROM Departments WHERE Phone LIKE '022%';

ALTER TABLE Departments ADD Established_Year INT;
INSERT INTO Departments (Name, Location, Phone, Head_Doctor) VALUES ('Psychiatry', 'Block K', '022-9988776', 3);
UPDATE Departments SET Phone = '022-1112223' WHERE Department_ID = 2;
DELETE FROM Departments WHERE Department_ID = 10;
ALTER TABLE Departments DROP COLUMN Established_Year;

SELECT Name FROM Departments ORDER BY Department_ID LIMIT 1;
SELECT COUNT(*) AS Dept_Count FROM Departments WHERE Location LIKE 'Block%';
SELECT Location, COUNT(*) FROM Departments GROUP BY Location;
SELECT Name, Head_Doctor FROM Departments ORDER BY Head_Doctor DESC LIMIT 3;
SELECT Name FROM Departments WHERE Department_ID IN (SELECT Department_ID FROM Departments WHERE Head_Doctor BETWEEN 1 AND 5);

-- =============================================================================================================================
-- Appointments Table
CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Date DATE,
    Time TIME,
    Status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);
-- Appointments
INSERT INTO Appointments (Patient_ID, Doctor_ID, Date, Time, Status) VALUES
(1, 1, '2025-08-25', '10:30:00', 'Scheduled'),
(2, 2, '2025-08-26', '14:00:00', 'Completed'),
(3, 3, '2025-08-27', '11:00:00', 'Scheduled'),
(4, 4, '2025-08-28', '15:30:00', 'Cancelled'),
(5, 5, '2025-08-29', '09:00:00', 'Scheduled'),
(6, 6, '2025-08-30', '16:00:00', 'Scheduled'),
(7, 7, '2025-08-31', '13:00:00', 'Scheduled'),
(8, 8, '2025-09-01', '12:30:00', 'Completed'),
(9, 9, '2025-09-02', '10:00:00', 'Scheduled'),
(10, 10, '2025-09-03', '17:00:00', 'Scheduled');
SELECT * FROM Appointments;
SELECT Appointment_ID, Date, Time FROM Appointments WHERE Status='Scheduled';
SELECT COUNT(*) FROM Appointments;
SELECT * FROM Appointments ORDER BY Date;
SELECT * FROM Appointments WHERE Status='Completed';

SELECT Status, COUNT(*) FROM Appointments GROUP BY Status;
SELECT Doctor_ID, COUNT(*) FROM Appointments GROUP BY Doctor_ID HAVING COUNT(*) > 1;
SELECT * FROM Appointments LIMIT 5;
SELECT * FROM Appointments ORDER BY Time DESC;
SELECT * FROM Appointments WHERE Date BETWEEN '2025-08-26' AND '2025-08-30';

ALTER TABLE Appointments ADD Notes VARCHAR(255);
INSERT INTO Appointments (Patient_ID, Doctor_ID, Date, Time, Status) VALUES (2,3,'2025-09-05','11:30:00','Scheduled');
UPDATE Appointments SET Status='Completed' WHERE Appointment_ID=1;
DELETE FROM Appointments WHERE Appointment_ID=10;
ALTER TABLE Appointments DROP COLUMN Notes;

SELECT * FROM Appointments ORDER BY Date ASC LIMIT 1;
SELECT Doctor_ID, COUNT(*) AS Total_Appointments FROM Appointments GROUP BY Doctor_ID ORDER BY Total_Appointments DESC LIMIT 1;
SELECT Date, COUNT(*) FROM Appointments GROUP BY Date;
SELECT Patient_ID, COUNT(*) FROM Appointments GROUP BY Patient_ID HAVING COUNT(*) > 1;
SELECT Status, COUNT(*) FROM Appointments GROUP BY Status ORDER BY COUNT(*) DESC;

-- ===========================================================================================================================
-- Medical History Table
CREATE TABLE Medical_History (
    History_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Diagnosis VARCHAR(100),
    Treatment VARCHAR(100),
    Notes TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Medical_History
INSERT INTO Medical_History (Patient_ID, Diagnosis, Treatment, Notes) VALUES
(1, 'Hypertension', 'Medication', 'Regular checkup required'),
(2, 'Migraine', 'Therapy', 'Stress management advised'),
(3, 'Fracture', 'Surgery', 'Follow-up in 2 weeks'),
(4, 'Skin Allergy', 'Ointment', 'Avoid allergens'),
(5, 'Asthma', 'Inhaler', 'Check triggers'),
(6, 'Cancer', 'Chemotherapy', 'Monitor progress'),
(7, 'Sinusitis', 'Antibiotics', 'Complete course'),
(8, 'Fever', 'Paracetamol', 'Rest needed'),
(9, 'Kidney Stone', 'Surgery', 'Monitor diet'),
(10, 'Diabetes', 'Insulin', 'Regular monitoring');
#queries
SELECT * FROM Medical_History;
SELECT Diagnosis, Treatment FROM Medical_History WHERE Patient_ID = 1;
SELECT COUNT(*) FROM Medical_History;
SELECT Diagnosis FROM Medical_History ORDER BY Diagnosis;
SELECT * FROM Medical_History WHERE Diagnosis = 'Asthma';

SELECT Treatment, COUNT(*) FROM Medical_History GROUP BY Treatment;
SELECT Diagnosis, COUNT(*) FROM Medical_History GROUP BY Diagnosis HAVING COUNT(*) > 1;
SELECT * FROM Medical_History LIMIT 5;
SELECT Diagnosis, Treatment FROM Medical_History ORDER BY History_ID DESC;
SELECT * FROM Medical_History WHERE Diagnosis LIKE '%a%';

ALTER TABLE Medical_History ADD Severity VARCHAR(20);
INSERT INTO Medical_History (Patient_ID, Diagnosis, Treatment, Notes) VALUES (3, 'Arthritis', 'Physiotherapy', 'Exercise daily');
UPDATE Medical_History SET Treatment = 'Advanced Surgery' WHERE History_ID = 3;
DELETE FROM Medical_History WHERE History_ID = 10;
ALTER TABLE Medical_History DROP COLUMN Severity;

SELECT Diagnosis, COUNT(*) FROM Medical_History GROUP BY Diagnosis;
SELECT Diagnosis FROM Medical_History ORDER BY History_ID DESC LIMIT 1;
SELECT AVG(History_ID) FROM Medical_History;
SELECT Patient_ID, GROUP_CONCAT(Diagnosis) FROM Medical_History GROUP BY Patient_ID;
SELECT Treatment, COUNT(*) FROM Medical_History GROUP BY Treatment;

-- ==================================================================================================================
-- Medications Table
CREATE TABLE Medications (
    Medication_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Type VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Description TEXT
);

-- Medications
INSERT INTO Medications (Name, Type, Price, Description) VALUES
('Paracetamol', 'Tablet', 20.00, 'Pain relief'),
('Atorvastatin', 'Tablet', 150.00, 'Cholesterol control'),
('Amoxicillin', 'Capsule', 80.00, 'Antibiotic'),
('Cough Syrup', 'Liquid', 50.00, 'Cold & cough relief'),
('Insulin', 'Injection', 500.00, 'Diabetes management'),
('Aspirin', 'Tablet', 30.00, 'Blood thinner'),
('Cetirizine', 'Tablet', 25.00, 'Anti-allergy'),
('Omeprazole', 'Capsule', 60.00, 'Acidity treatment'),
('Vitamin D', 'Tablet', 100.00, 'Supplement'),
('Calcium', 'Tablet', 90.00, 'Bone health');
#quereies
SELECT * FROM Medications;
SELECT Name, Price FROM Medications WHERE Price > 100;
SELECT COUNT(*) FROM Medications;
SELECT Name FROM Medications ORDER BY Price;
SELECT * FROM Medications WHERE Type = 'Tablet';

SELECT Type, COUNT(*) FROM Medications GROUP BY Type;
SELECT Type, AVG(Price) FROM Medications GROUP BY Type HAVING AVG(Price) > 50;
SELECT * FROM Medications LIMIT 5;
SELECT Name, Price FROM Medications ORDER BY Price DESC;
SELECT * FROM Medications WHERE Name LIKE 'C%';

ALTER TABLE Medications ADD Expiry_Date DATE;
INSERT INTO Medications (Name, Type, Price, Description) VALUES ('Metformin', 'Tablet', 120.00, 'Diabetes control');
UPDATE Medications SET Price = 200.00 WHERE Medication_ID = 1;
DELETE FROM Medications WHERE Medication_ID = 10;
ALTER TABLE Medications DROP COLUMN Expiry_Date;

SELECT Name, MAX(Price) FROM Medications;
SELECT AVG(Price) FROM Medications;
SELECT Type, COUNT(*) FROM Medications GROUP BY Type;
SELECT Name, Price FROM Medications ORDER BY Price ASC LIMIT 3;
SELECT Type, GROUP_CONCAT(Name) FROM Medications GROUP BY Type;

-- ==================================================================================================================
-- Prescriptions Table
CREATE TABLE Prescriptions (
    Prescription_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Medication_ID INT,
    Date_Provided DATE,
    Dosage VARCHAR(50),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Medication_ID) REFERENCES Medications(Medication_ID)
);
-- Prescriptions
INSERT INTO Prescriptions (Patient_ID, Medication_ID, Date_Provided, Dosage) VALUES
(1, 1, '2025-08-20', '2 times a day'),
(2, 2, '2025-08-21', 'Once daily'),
(3, 3, '2025-08-22', '3 times a day'),
(4, 4, '2025-08-23', '2 times a day'),
(5, 5, '2025-08-24', 'Twice daily'),
(6, 6, '2025-08-25', 'Once daily'),
(7, 7, '2025-08-26', 'Once at night'),
(8, 8, '2025-08-27', 'Before breakfast'),
(9, 9, '2025-08-28', 'Alternate days'),
(10, 10, '2025-08-29', 'Once daily');
#queries
SELECT * FROM Prescriptions;
SELECT Prescription_ID, Dosage FROM Prescriptions WHERE Medication_ID = 2;
SELECT COUNT(*) AS Total_Prescriptions FROM Prescriptions;
SELECT * FROM Prescriptions ORDER BY Date_Provided DESC;
SELECT Prescription_ID, Dosage FROM Prescriptions WHERE Patient_ID = 5;

SELECT Medication_ID, COUNT(*) FROM Prescriptions GROUP BY Medication_ID;
SELECT Patient_ID, COUNT(*) FROM Prescriptions GROUP BY Patient_ID HAVING COUNT(*) > 1;
SELECT * FROM Prescriptions LIMIT 5;
SELECT * FROM Prescriptions ORDER BY Prescription_ID DESC;
SELECT * FROM Prescriptions WHERE Dosage LIKE '%daily%';

ALTER TABLE Prescriptions ADD Notes VARCHAR(100);
INSERT INTO Prescriptions (Patient_ID, Medication_ID, Date_Provided, Dosage) VALUES (3, 5, '2025-08-30', 'After lunch');
UPDATE Prescriptions SET Dosage = 'Twice daily' WHERE Prescription_ID = 1;
DELETE FROM Prescriptions WHERE Prescription_ID = 10;
ALTER TABLE Prescriptions DROP COLUMN Notes;

SELECT MAX(Date_Provided) AS Latest_Prescription FROM Prescriptions;
SELECT COUNT(DISTINCT Patient_ID) AS Unique_Patients FROM Prescriptions;
SELECT Medication_ID, COUNT(*) AS Times_Prescribed FROM Prescriptions GROUP BY Medication_ID ORDER BY Times_Prescribed DESC;
SELECT Patient_ID, GROUP_CONCAT(Dosage) AS All_Dosages FROM Prescriptions GROUP BY Patient_ID;
SELECT Patient_ID, COUNT(*) FROM Prescriptions GROUP BY Patient_ID ORDER BY COUNT(*) DESC LIMIT 1;


#=====================================================================================================================
-- Bills Table
CREATE TABLE Bills (
    Bill_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Total_Amount DECIMAL(10,2),
    Payment_Status VARCHAR(20) DEFAULT 'Pending',
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Bills
INSERT INTO Bills (Patient_ID, Total_Amount, Payment_Status, Date) VALUES
(1, 5000.00, 'Paid', '2025-08-22'),
(2, 3000.00, 'Pending', '2025-08-22'),
(3, 7000.00, 'Paid', '2025-08-23'),
(4, 2000.00, 'Paid', '2025-08-23'),
(5, 10000.00, 'Pending', '2025-08-24'),
(6, 15000.00, 'Paid', '2025-08-24'),
(7, 2500.00, 'Paid', '2025-08-25'),
(8, 4000.00, 'Pending', '2025-08-25'),
(9, 3500.00, 'Paid', '2025-08-26'),
(10, 6000.00, 'Paid', '2025-08-26');
#queries 
SELECT * FROM Bills;
SELECT Patient_ID, Total_Amount FROM Bills WHERE Total_Amount > 5000;
SELECT COUNT(*) AS Total_Bills FROM Bills;
SELECT * FROM Bills ORDER BY Total_Amount DESC;
SELECT * FROM Bills WHERE Payment_Status = 'Pending';

SELECT Payment_Status, COUNT(*) FROM Bills GROUP BY Payment_Status;
SELECT Date, SUM(Total_Amount) FROM Bills GROUP BY Date HAVING SUM(Total_Amount) > 5000;
SELECT * FROM Bills LIMIT 5;
SELECT * FROM Bills ORDER BY Date ASC;
SELECT * FROM Bills WHERE Date BETWEEN '2025-08-22' AND '2025-08-24';

ALTER TABLE Bills ADD Payment_Mode VARCHAR(20);
INSERT INTO Bills (Patient_ID, Total_Amount, Payment_Status, Date, Payment_Mode) VALUES (11, 4500.00, 'Pending', '2025-08-27', 'Cash');
UPDATE Bills SET Payment_Status = 'Paid' WHERE Bill_ID = 2;
DELETE FROM Bills WHERE Bill_ID = 10;
ALTER TABLE Bills DROP COLUMN Payment_Mode;

SELECT MAX(Total_Amount) AS Highest_Bill FROM Bills;
SELECT AVG(Total_Amount) AS Average_Bill FROM Bills;
SELECT Payment_Status, SUM(Total_Amount) FROM Bills GROUP BY Payment_Status;
SELECT Date, COUNT(*) AS Bills_Count FROM Bills GROUP BY Date;
SELECT Patient_ID, Total_Amount FROM Bills WHERE Total_Amount = (SELECT MAX(Total_Amount) FROM Bills);

-- =========================================================================================================================
-- Staff Table
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Role VARCHAR(50),
    Contact VARCHAR(20) UNIQUE,
    Shift VARCHAR(20)
);
-- Staff
INSERT INTO Staff (Name, Role, Contact, Shift) VALUES
('Amit Verma', 'Nurse', '9555551111', 'Morning'),
('Priya Singh', 'Receptionist', '9555552222', 'Evening'),
('Ramesh Kumar', 'Technician', '9555553333', 'Night'),
('Sita Devi', 'Cleaner', '9555554444', 'Morning'),
('Anil Shah', 'Pharmacist', '9555555555', 'Evening'),
('Geeta Pandey', 'Nurse', '9555556666', 'Night'),
('Manoj Yadav', 'Security', '9555557777', 'Morning'),
('Radha Nair', 'Lab Assistant', '9555558888', 'Evening'),
('Kiran Patel', 'Admin', '9555559999', 'Morning'),
('Deepak Gupta', 'Ward Boy', '9555550000', 'Night');
#queries
SELECT * FROM Staff;
SELECT Name, Role FROM Staff WHERE Role = 'Nurse';
SELECT COUNT(*) AS Total_Staff FROM Staff;
SELECT * FROM Staff ORDER BY Name ASC;
SELECT * FROM Staff WHERE Shift = 'Morning';

SELECT Role, COUNT(*) FROM Staff GROUP BY Role;
SELECT Shift, COUNT(*) FROM Staff GROUP BY Shift HAVING COUNT(*) > 2;
SELECT * FROM Staff LIMIT 5;
SELECT * FROM Staff ORDER BY Role DESC;
SELECT * FROM Staff WHERE Name LIKE 'A%';

ALTER TABLE Staff ADD Salary DECIMAL(10,2);
INSERT INTO Staff (Name, Role, Contact, Shift, Salary) VALUES ('Shalini Mehta', 'Receptionist', '9555551212', 'Evening', 25000.00);
UPDATE Staff SET Shift = 'Night' WHERE Staff_ID = 3;
DELETE FROM Staff WHERE Staff_ID = 10;
ALTER TABLE Staff DROP COLUMN Salary;

SELECT Role, COUNT(*) AS Count FROM Staff GROUP BY Role ORDER BY Count DESC LIMIT 1;
SELECT Shift, COUNT(*) FROM Staff GROUP BY Shift;
SELECT * FROM Staff WHERE Role = 'Nurse' ORDER BY Name;
SELECT COUNT(DISTINCT Role) AS Unique_Roles FROM Staff;
SELECT Name, Role FROM Staff WHERE Staff_ID = (SELECT MAX(Staff_ID) FROM Staff);

-- =======================================================================================================================
-- Facilities Table
CREATE TABLE Facilities (
    Facility_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) UNIQUE,
    Type VARCHAR(50),
    Cost DECIMAL(10,2),
    Availability_Status VARCHAR(20)
);

-- Facilities
INSERT INTO Facilities (Name, Type, Cost, Availability_Status) VALUES
('MRI Scan', 'Diagnostic', 2500.00, 'Available'),
('ICU Bed', 'Critical Care', 5000.00, 'Occupied'),
('X-Ray', 'Diagnostic', 1000.00, 'Available'),
('CT Scan', 'Diagnostic', 3500.00, 'Available'),
('Ultrasound', 'Diagnostic', 1200.00, 'Available'),
('Ventilator', 'Critical Care', 8000.00, 'Occupied'),
('Blood Test', 'Laboratory', 500.00, 'Available'),
('ECG', 'Diagnostic', 1500.00, 'Available'),
('Dialysis Machine', 'Critical Care', 6000.00, 'Occupied'),
('Operation Theater', 'Surgical', 20000.00, 'Available');
#queries
SELECT * FROM Facilities;
SELECT Name, Cost FROM Facilities WHERE Cost > 5000;
SELECT COUNT(*) AS Total_Facilities FROM Facilities;
SELECT Name, Type FROM Facilities ORDER BY Type;
SELECT Name FROM Facilities WHERE Availability_Status = 'Available';

SELECT Type, COUNT(*) FROM Facilities GROUP BY Type;
SELECT Availability_Status, COUNT(*) FROM Facilities GROUP BY Availability_Status HAVING COUNT(*) > 1;
SELECT * FROM Facilities LIMIT 5;
SELECT Name, Cost FROM Facilities ORDER BY Cost DESC;
SELECT * FROM Facilities WHERE Name LIKE '%Scan%';

ALTER TABLE Facilities ADD Location VARCHAR(50);
INSERT INTO Facilities (Name, Type, Cost, Availability_Status, Location) VALUES ('Physiotherapy Room', 'Rehabilitation', 3000.00, 'Available', 'Block B');
UPDATE Facilities SET Cost = 9000 WHERE Facility_ID = 6;
DELETE FROM Facilities WHERE Facility_ID = 10;
ALTER TABLE Facilities DROP COLUMN Location;

SELECT Name, Cost FROM Facilities ORDER BY Cost DESC LIMIT 1;
SELECT AVG(Cost) AS Avg_Cost FROM Facilities;
SELECT Type, COUNT(*) AS Facility_Count FROM Facilities GROUP BY Type;
SELECT Availability_Status, GROUP_CONCAT(Name) FROM Facilities GROUP BY Availability_Status HAVING COUNT(*) > 1;
SELECT Availability_Status, COUNT(*) FROM Facilities GROUP BY Availability_Status;
