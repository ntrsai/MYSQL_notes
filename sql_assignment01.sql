#=====================================================ASSIGNMENTS01========================================================================
create database school01;
use school01;

#================================================================================================================================

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    grade VARCHAR(5),
    city VARCHAR(30)
);

INSERT INTO students (name, age, grade, city) VALUES
('John', 14, '8', 'Delhi'),
('Sara', 15, '9', 'Mumbai'),
('Amit', 13, '7', 'Chennai'),
('Priya', 14, '8', 'Kolkata'),
('Ravi', 15, '9', 'Hyderabad'),
('Simran', 14, '8', 'Pune'),
('Karan', 13, '7', 'Bangalore'),
('Anita', 15, '9', 'Delhi'),
('Manoj', 14, '8', 'Jaipur'),
('Neha', 13, '7', 'Ahmedabad');

#queries:

SELECT * FROM students WHERE grade = '8';
SELECT city, COUNT(*) FROM students GROUP BY city;
UPDATE students SET age = age + 1 WHERE grade = '9';
DELETE FROM students WHERE city = 'Ahmedabad';
ALTER TABLE students ADD email VARCHAR(50);
SELECT * FROM students ORDER BY age ASC LIMIT 1;
SELECT * FROM students ORDER BY age DESC LIMIT 1;
SELECT * FROM students WHERE name LIKE 'A%';
SELECT COUNT(*) FROM students;
SELECT * FROM students ORDER BY city, name;


-- Teachers Table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(30),
    experience_years INT,
    salary INT
);

INSERT INTO teachers (name, subject, experience_years, salary) VALUES
('Mr. Sharma', 'Math', 10, 50000),
('Ms. Verma', 'English', 8, 45000),
('Mr. Khan', 'Science', 12, 55000),
('Mrs. Das', 'History', 7, 42000),
('Mr. Rao', 'Geography', 9, 48000),
('Mrs. Patel', 'Biology', 11, 53000),
('Mr. Gupta', 'Physics', 15, 60000),
('Mrs. Singh', 'Chemistry', 10, 50000),
('Mr. Mehta', 'Computer', 8, 47000),
('Mrs. Nair', 'Economics', 9, 49000);

#queries:

SELECT * FROM teachers WHERE salary > 50000;
UPDATE teachers SET salary = salary + 2000 WHERE subject = 'Science';
DELETE FROM teachers WHERE experience_years < 8;
ALTER TABLE teachers ADD phone_number VARCHAR(15);
SELECT subject, COUNT(*) FROM teachers GROUP BY subject;
SELECT * FROM teachers ORDER BY salary DESC LIMIT 1;
SELECT * FROM teachers ORDER BY salary ASC LIMIT 1;
SELECT * FROM teachers WHERE name LIKE '%Mr.%';
SELECT SUM(salary) AS total_salary FROM teachers;
SELECT AVG(salary) AS avg_salary FROM teachers;

-- Classes Table
CREATE TABLE classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(20),
    section CHAR(1),
    teacher_id INT,
    room_no INT
);

INSERT INTO classes (class_name, section, teacher_id, room_no) VALUES
('8th', 'A', 1, 101),
('9th', 'A', 2, 102),
('7th', 'B', 3, 103),
('8th', 'B', 4, 104),
('9th', 'B', 5, 105),
('8th', 'C', 6, 106),
('7th', 'A', 7, 107),
('9th', 'C', 8, 108),
('8th', 'D', 9, 109),
('7th', 'C', 10, 110);
-- queries:

SELECT * FROM classes WHERE section = 'A';
SELECT teacher_id, COUNT(*) FROM classes GROUP BY teacher_id;
UPDATE classes SET room_no = 201 WHERE class_id = 1;
DELETE FROM classes WHERE section = 'D';
ALTER TABLE classes ADD capacity INT;
SELECT * FROM classes ORDER BY room_no ASC;
SELECT MAX(room_no) FROM classes;
SELECT MIN(room_no) FROM classes;
SELECT * FROM classes WHERE teacher_id = 3;
SELECT COUNT(*) FROM class;

-- Subjects Table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(30),
    class_id INT,
    max_marks INT,
    pass_marks INT
);

INSERT INTO subjects (subject_name, class_id, max_marks, pass_marks) VALUES
('Math', 1, 100, 35),
('English', 2, 100, 35),
('Science', 3, 100, 35),
('History', 4, 100, 35),
('Geography', 5, 100, 35),
('Biology', 6, 100, 35),
('Physics', 7, 100, 35),
('Chemistry', 8, 100, 35),
('Computer', 9, 100, 35),
('Economics', 10, 100, 35);

#queries:

SELECT * FROM subjects WHERE max_marks > 90;
UPDATE subjects SET pass_marks = 40 WHERE subject_name = 'Economics';
DELETE FROM subjects WHERE subject_name = 'History';
ALTER TABLE subjects ADD subject_code VARCHAR(10);
SELECT class_id, COUNT(*) FROM subjects GROUP BY class_id;
SELECT * FROM subjects ORDER BY subject_name;
SELECT MAX(pass_marks) FROM subjects;
SELECT MIN(pass_marks) FROM subjects;
SELECT * FROM subjects WHERE class_id = 5;
SELECT COUNT(*) FROM subjects;


-- Exams Table
CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    marks_obtained INT,
    exam_date DATE
);

INSERT INTO exams (student_id, subject_id, marks_obtained, exam_date) VALUES
(1, 1, 88, '2024-03-15'),
(2, 2, 75, '2024-03-15'),
(3, 3, 90, '2024-03-15'),
(4, 4, 60, '2024-03-15'),
(5, 5, 85, '2024-03-15'),
(6, 6, 70, '2024-03-15'),
(7, 7, 95, '2024-03-15'),
(8, 8, 55, '2024-03-15'),
(9, 9, 80, '2024-03-15'),
(10, 10, 92, '2024-03-15');

#queries:

SELECT * FROM exams WHERE marks_obtained > 80;
UPDATE exams SET marks_obtained = marks_obtained + 5 WHERE student_id = 1;
DELETE FROM exams WHERE student_id = 8;
ALTER TABLE exams ADD remarks VARCHAR(50);
SELECT subject_id, COUNT(*) FROM exams GROUP BY subject_id;
SELECT MAX(marks_obtained) FROM exams;
SELECT MIN(marks_obtained) FROM exams;
SELECT * FROM exams WHERE exam_date = '2024-03-15';
SELECT subject_id, AVG(marks_obtained) FROM exams GROUP BY subject_id;
SELECT COUNT(*) FROM exams;

#======================================================================================================================

CREATE DATABASE company01;
USE company01;


-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    department VARCHAR(30),
    city VARCHAR(30)
);

INSERT INTO employees (name, age, department, city) VALUES
('Rajesh', 30, 'IT', 'Mumbai'),
('Sneha', 28, 'HR', 'Delhi'),
('Vikram', 35, 'Finance', 'Bangalore'),
('Aarti', 26, 'Marketing', 'Pune'),
('Suresh', 32, 'IT', 'Hyderabad'),
('Pooja', 29, 'Finance', 'Chennai'),
('Aman', 31, 'Sales', 'Kolkata'),
('Meera', 27, 'HR', 'Ahmedabad'),
('Kunal', 34, 'Marketing', 'Jaipur'),
('Divya', 25, 'Sales', 'Surat');

#queries:

SELECT * FROM employees WHERE department = 'IT';
SELECT city, COUNT(*) FROM employees GROUP BY city;
UPDATE employees SET age = age + 1 WHERE department = 'HR';
DELETE FROM employees WHERE city = 'Surat';
ALTER TABLE employees ADD email VARCHAR(50);
SELECT * FROM employees ORDER BY age ASC LIMIT 1;
SELECT * FROM employees ORDER BY age DESC LIMIT 1;
SELECT * FROM employees WHERE name LIKE 'A%';
SELECT COUNT(*) FROM employees;
SELECT * FROM employees ORDER BY city, name;


-- Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(30),
    manager VARCHAR(50),
    location VARCHAR(30),
    budget INT
);

INSERT INTO departments (dept_name, manager, location, budget) VALUES
('IT', 'Ramesh', 'Mumbai', 500000),
('HR', 'Anjali', 'Delhi', 300000),
('Finance', 'Sanjay', 'Bangalore', 450000),
('Marketing', 'Kavita', 'Pune', 350000),
('Sales', 'Vijay', 'Kolkata', 400000),
('Support', 'Manish', 'Hyderabad', 250000),
('Operations', 'Priya', 'Chennai', 380000),
('Research', 'Arun', 'Ahmedabad', 600000),
('Legal', 'Nisha', 'Jaipur', 320000),
('Admin', 'Deepak', 'Surat', 200000);

#queries:

SELECT * FROM departments WHERE budget > 400000;
UPDATE departments SET budget = budget + 50000 WHERE dept_name = 'HR';
DELETE FROM departments WHERE location = 'Surat';
ALTER TABLE departments ADD phone_number VARCHAR(15);
SELECT location, COUNT(*) FROM departments GROUP BY location;
SELECT * FROM departments ORDER BY budget DESC LIMIT 1;
SELECT * FROM departments ORDER BY budget ASC LIMIT 1;
SELECT * FROM departments WHERE manager LIKE '%a%';
SELECT SUM(budget) AS total_budget FROM departments;
SELECT AVG(budget) AS avg_budget FROM departments;


-- Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(50),
    dept_id INT,
    start_date DATE,
    end_date DATE
);

INSERT INTO projects (project_name, dept_id, start_date, end_date) VALUES
('ERP Upgrade', 1, '2024-01-10', '2024-06-15'),
('Recruitment Drive', 2, '2024-02-05', '2024-04-20'),
('Tax Audit', 3, '2024-03-01', '2024-08-30'),
('Ad Campaign', 4, '2024-01-25', '2024-05-10'),
('Sales Expansion', 5, '2024-04-15', '2024-09-01'),
('CRM Setup', 1, '2024-05-01', '2024-10-15'),
('Helpdesk Revamp', 6, '2024-02-20', '2024-07-30'),
('Product Research', 8, '2024-03-10', '2024-11-05'),
('Compliance Review', 9, '2024-04-01', '2024-08-15'),
('Office Renovation', 10, '2024-01-05', '2024-04-30');

#queries:

SELECT * FROM projects WHERE dept_id = 1;
UPDATE projects SET end_date = '2024-06-30' WHERE project_name = 'ERP Upgrade';
DELETE FROM projects WHERE project_name = 'Office Renovation';
ALTER TABLE projects ADD status VARCHAR(20);
SELECT dept_id, COUNT(*) FROM projects GROUP BY dept_id;
SELECT * FROM projects ORDER BY start_date ASC;
SELECT * FROM projects ORDER BY end_date DESC;
SELECT * FROM projects WHERE project_name LIKE '%Review%';
SELECT COUNT(*) FROM projects;
SELECT * FROM projects WHERE start_date BETWEEN '2024-01-01' AND '2024-03-31';


-- Clients Table
CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(50),
    contact_person VARCHAR(50),
    city VARCHAR(30),
    project_id INT
);

INSERT INTO clients (client_name, contact_person, city, project_id) VALUES
('Tech Solutions', 'Ajay', 'Mumbai', 1),
('Global Recruiters', 'Neeta', 'Delhi', 2),
('Finance Experts', 'Rohit', 'Bangalore', 3),
('Brand Boosters', 'Swati', 'Pune', 4),
('Market Movers', 'Siddharth', 'Kolkata', 5),
('HelpHub', 'Komal', 'Hyderabad', 7),
('InnoVision', 'Rahul', 'Ahmedabad', 8),
('Law & Co', 'Sameer', 'Jaipur', 9),
('BuildWell', 'Pankaj', 'Surat', 10),
('ERP Masters', 'Harsh', 'Mumbai', 6);

#queries:

SELECT * FROM clients WHERE city = 'Mumbai';
UPDATE clients SET city = 'Nagpur' WHERE client_name = 'BuildWell';
DELETE FROM clients WHERE client_name = 'Law & Co';
ALTER TABLE clients ADD email VARCHAR(50);
SELECT city, COUNT(*) FROM clients GROUP BY city;
SELECT * FROM clients ORDER BY client_name;
SELECT * FROM clients WHERE client_name LIKE 'T%';
SELECT COUNT(*) FROM clients;
SELECT DISTINCT city FROM clients;
SELECT * FROM clients WHERE project_id = 1;


-- Invoices Table
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    amount INT,
    invoice_date DATE,
    status VARCHAR(20)
);

INSERT INTO invoices (client_id, amount, invoice_date, status) VALUES
(1, 150000, '2024-03-15', 'Paid'),
(2, 80000, '2024-03-20', 'Unpaid'),
(3, 120000, '2024-04-01', 'Paid'),
(4, 95000, '2024-04-05', 'Paid'),
(5, 110000, '2024-04-10', 'Unpaid'),
(6, 70000, '2024-04-15', 'Paid'),
(7, 140000, '2024-04-20', 'Unpaid'),
(8, 90000, '2024-04-25', 'Paid'),
(9, 105000, '2024-04-30', 'Paid'),
(10, 130000, '2024-05-05', 'Unpaid');

#queries:

SELECT * FROM invoices WHERE status = 'Paid';
UPDATE invoices SET amount = amount + 5000 WHERE client_id = 2;
DELETE FROM invoices WHERE client_id = 9;
ALTER TABLE invoices ADD payment_mode VARCHAR(20);
SELECT status, COUNT(*) FROM invoices GROUP BY status;
SELECT MAX(amount) FROM invoices;
SELECT MIN(amount) FROM invoices;
SELECT SUM(amount) FROM invoices;
SELECT AVG(amount) FROM invoices;
SELECT * FROM invoices WHERE invoice_date BETWEEN '2024-04-01' AND '2024-04-30';

#=========================================================================================================================

CREATE DATABASE restaurant01;
USE restaurant01;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    phone VARCHAR(15),
    city VARCHAR(30),
    loyalty_points INT
);

INSERT INTO customers (name, phone, city, loyalty_points) VALUES
('Raj', '9876543210', 'Mumbai', 120),
('Priya', '9988776655', 'Delhi', 200),
('Amit', '9123456780', 'Pune', 50),
('Sara', '9345678901', 'Kolkata', 300),
('Vikram', '9001122334', 'Hyderabad', 150),
('Neha', '9876501234', 'Chennai', 220),
('Arjun', '9765432109', 'Jaipur', 100),
('Simran', '9654321098', 'Ahmedabad', 180),
('Manish', '9543210987', 'Bangalore', 250),
('Anita', '9432109876', 'Goa', 90);

#queries:
SELECT * FROM customers WHERE loyalty_points > 150;
SELECT city, COUNT(*) FROM customers GROUP BY city;
UPDATE customers SET loyalty_points = loyalty_points + 10 WHERE city = 'Mumbai';
DELETE FROM customers WHERE city = 'Goa';
ALTER TABLE customers ADD email VARCHAR(50);
SELECT * FROM customers ORDER BY loyalty_points DESC LIMIT 1;
SELECT * FROM customers ORDER BY loyalty_points ASC LIMIT 1;
SELECT * FROM customers WHERE name LIKE 'A%';
SELECT COUNT(*) FROM customers;
SELECT * FROM customers ORDER BY city, name;

-- Menu Table
CREATE TABLE menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(50),
    category VARCHAR(20),
    price DECIMAL(8,2),
    available BOOLEAN
);

INSERT INTO menu (item_name, category, price, available) VALUES
('Paneer Butter Masala', 'Veg', 250, TRUE),
('Chicken Biryani', 'Non-Veg', 300, TRUE),
('Veg Burger', 'Veg', 150, TRUE),
('Mutton Curry', 'Non-Veg', 350, TRUE),
('Pasta Alfredo', 'Veg', 200, TRUE),
('Fish Fry', 'Non-Veg', 320, TRUE),
('Veg Pizza', 'Veg', 280, TRUE),
('Grilled Chicken', 'Non-Veg', 330, TRUE),
('Dal Tadka', 'Veg', 180, TRUE),
('Prawns Masala', 'Non-Veg', 370, TRUE);

#queries:
SELECT * FROM menu WHERE category = 'Veg';
UPDATE menu SET price = price + 20 WHERE category = 'Veg';
DELETE FROM menu WHERE item_name = 'Prawns Masala';
ALTER TABLE menu ADD calories INT;
SELECT category, COUNT(*) FROM menu GROUP BY category;
SELECT * FROM menu ORDER BY price DESC LIMIT 1;
SELECT * FROM menu ORDER BY price ASC LIMIT 1;
SELECT * FROM menu WHERE item_name LIKE '%Chicken%';
SELECT AVG(price) FROM menu;
SELECT COUNT(*) FROM menu;

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(8,2),
    status VARCHAR(20)
);

INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-08-01', 500, 'Delivered'),
(2, '2024-08-02', 350, 'Delivered'),
(3, '2024-08-03', 800, 'Pending'),
(4, '2024-08-04', 650, 'Delivered'),
(5, '2024-08-05', 450, 'Delivered'),
(6, '2024-08-06', 900, 'Pending'),
(7, '2024-08-07', 300, 'Delivered'),
(8, '2024-08-08', 750, 'Delivered'),
(9, '2024-08-09', 400, 'Pending'),
(10, '2024-08-10', 600, 'Delivered');

#queries:
SELECT * FROM orders WHERE status = 'Pending';
UPDATE orders SET status = 'Delivered' WHERE order_id = 3;
DELETE FROM orders WHERE status = 'Cancelled';
ALTER TABLE orders ADD payment_mode VARCHAR(20);
SELECT status, COUNT(*) FROM orders GROUP BY status;
SELECT * FROM orders ORDER BY total_amount DESC;
SELECT * FROM orders ORDER BY total_amount ASC;
SELECT customer_id, SUM(total_amount) FROM orders GROUP BY customer_id;
SELECT AVG(total_amount) FROM orders;
SELECT COUNT(*) FROM orders;

-- Staff Table
CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    role VARCHAR(30),
    salary INT,
    join_date DATE
);

INSERT INTO staff (name, role, salary, join_date) VALUES
('Ramesh', 'Chef', 40000, '2020-05-10'),
('Anjali', 'Waiter', 20000, '2021-01-15'),
('Suresh', 'Manager', 50000, '2019-03-20'),
('Meena', 'Waiter', 22000, '2021-06-25'),
('Vikash', 'Chef', 42000, '2020-08-18'),
('Deepak', 'Cleaner', 15000, '2022-02-12'),
('Kavita', 'Cashier', 25000, '2021-11-05'),
('Aman', 'Chef', 41000, '2020-09-14'),
('Ritu', 'Waiter', 21000, '2021-12-01'),
('Arjun', 'Security', 18000, '2022-03-08');

#queries:
SELECT * FROM staff WHERE role = 'Chef';
UPDATE staff SET salary = salary + 2000 WHERE role = 'Waiter';
DELETE FROM staff WHERE salary < 16000;
ALTER TABLE staff ADD phone_number VARCHAR(15);
SELECT role, COUNT(*) FROM staff GROUP BY role;
SELECT * FROM staff ORDER BY salary DESC LIMIT 1;
SELECT * FROM staff ORDER BY salary ASC LIMIT 1;
SELECT * FROM staff WHERE name LIKE 'A%';
SELECT AVG(salary) FROM staff;
SELECT COUNT(*) FROM staff;

-- Inventory Table
CREATE TABLE inventory (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(50),
    quantity INT,
    unit VARCHAR(20),
    last_updated DATE
);

INSERT INTO inventory (item_name, quantity, unit, last_updated) VALUES
('Rice', 100, 'kg', '2024-08-01'),
('Wheat Flour', 50, 'kg', '2024-08-02'),
('Chicken', 30, 'kg', '2024-08-03'),
('Mutton', 20, 'kg', '2024-08-04'),
('Fish', 25, 'kg', '2024-08-05'),
('Paneer', 40, 'kg', '2024-08-06'),
('Vegetables', 80, 'kg', '2024-08-07'),
('Spices', 15, 'kg', '2024-08-08'),
('Oil', 60, 'liters', '2024-08-09'),
('Pasta', 35, 'kg', '2024-08-10');

#queries:
SELECT * FROM inventory WHERE quantity < 30;
UPDATE inventory SET quantity = quantity - 5 WHERE item_name = 'Rice';
DELETE FROM inventory WHERE item_name = 'Pasta';
ALTER TABLE inventory ADD supplier_name VARCHAR(50);
SELECT unit, COUNT(*) FROM inventory GROUP BY unit;
SELECT * FROM inventory ORDER BY quantity DESC;
SELECT * FROM inventory ORDER BY quantity ASC;
SELECT SUM(quantity) FROM inventory;
SELECT AVG(quantity) FROM inventory;
SELECT COUNT(*) FROM inventory;
#=====================================================================================================================

CREATE DATABASE airhostess01;
USE airhostess01;

CREATE TABLE airhostess (
    hostess_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    experience_years INT,
    base_city VARCHAR(30)
);

INSERT INTO airhostess (name, age, experience_years, base_city) VALUES
('Aisha', 26, 4, 'Delhi'),
('Maria', 28, 6, 'Mumbai'),
('Sana', 25, 3, 'Chennai'),
('Riya', 27, 5, 'Kolkata'),
('Anita', 29, 7, 'Hyderabad'),
('Neha', 24, 2, 'Pune'),
('Kavya', 30, 8, 'Bangalore'),
('Simran', 26, 4, 'Delhi'),
('Priya', 25, 3, 'Jaipur'),
('Meera', 28, 6, 'Ahmedabad');

#queries:
SELECT * FROM airhostess WHERE experience_years > 5;
SELECT base_city, COUNT(*) FROM airhostess GROUP BY base_city;
UPDATE airhostess SET age = age + 1 WHERE base_city = 'Delhi';
DELETE FROM airhostess WHERE base_city = 'Ahmedabad';
ALTER TABLE airhostess ADD email VARCHAR(50);
SELECT * FROM airhostess ORDER BY age ASC LIMIT 1;
SELECT * FROM airhostess ORDER BY age DESC LIMIT 1;
SELECT * FROM airhostess WHERE name LIKE 'A%';
SELECT COUNT(*) FROM airhostess;
SELECT * FROM airhostess ORDER BY base_city, name;

CREATE TABLE flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10),
    origin VARCHAR(30),
    destination VARCHAR(30),
    flight_duration INT
);

INSERT INTO flights (flight_number, origin, destination, flight_duration) VALUES
('AI101', 'Delhi', 'Mumbai', 2),
('AI102', 'Mumbai', 'Chennai', 2),
('AI103', 'Chennai', 'Kolkata', 3),
('AI104', 'Kolkata', 'Hyderabad', 2),
('AI105', 'Hyderabad', 'Delhi', 2),
('AI106', 'Pune', 'Bangalore', 1),
('AI107', 'Bangalore', 'Jaipur', 3),
('AI108', 'Jaipur', 'Ahmedabad', 1),
('AI109', 'Ahmedabad', 'Mumbai', 1),
('AI110', 'Mumbai', 'Delhi', 2);

#queries:
SELECT * FROM flights WHERE flight_duration > 2;
UPDATE flights SET flight_duration = flight_duration + 1 WHERE origin = 'Delhi';
DELETE FROM flights WHERE destination = 'Ahmedabad';
ALTER TABLE flights ADD aircraft_type VARCHAR(30);
SELECT origin, COUNT(*) FROM flights GROUP BY origin;
SELECT * FROM flights ORDER BY flight_duration DESC;
SELECT MAX(flight_duration) FROM flights;
SELECT MIN(flight_duration) FROM flights;
SELECT * FROM flights WHERE destination = 'Mumbai';
SELECT COUNT(*) FROM flights;

CREATE TABLE schedules (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT,
    hostess_id INT,
    departure_time TIME,
    arrival_time TIME
);

INSERT INTO schedules (flight_id, hostess_id, departure_time, arrival_time) VALUES
(1, 1, '08:00:00', '10:00:00'),
(2, 2, '09:00:00', '11:00:00'),
(3, 3, '12:00:00', '15:00:00'),
(4, 4, '14:00:00', '16:00:00'),
(5, 5, '07:00:00', '09:00:00'),
(6, 6, '15:00:00', '16:00:00'),
(7, 7, '06:00:00', '09:00:00'),
(8, 8, '10:00:00', '11:00:00'),
(9, 9, '17:00:00', '18:00:00'),
(10, 10, '20:00:00', '22:00:00');

#queries:
SELECT * FROM schedules WHERE departure_time < '09:00:00';
UPDATE schedules SET arrival_time = '17:30:00' WHERE schedule_id = 4;
DELETE FROM schedules WHERE departure_time = '20:00:00';
ALTER TABLE schedules ADD day_of_week VARCHAR(10);
SELECT flight_id, COUNT(*) FROM schedules GROUP BY flight_id;
SELECT * FROM schedules ORDER BY departure_time;
SELECT MIN(departure_time) FROM schedules;
SELECT MAX(arrival_time) FROM schedules;
SELECT * FROM schedules WHERE hostess_id = 5;
SELECT COUNT(*) FROM schedules;

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    ticket_number VARCHAR(15)
);

INSERT INTO passengers (name, age, gender, ticket_number) VALUES
('Arjun', 34, 'M', 'TKT1001'),
('Meena', 28, 'F', 'TKT1002'),
('Raj', 40, 'M', 'TKT1003'),
('Priya', 32, 'F', 'TKT1004'),
('Kiran', 29, 'M', 'TKT1005'),
('Sita', 25, 'F', 'TKT1006'),
('Ravi', 37, 'M', 'TKT1007'),
('Anita', 30, 'F', 'TKT1008'),
('Vikram', 35, 'M', 'TKT1009'),
('Pooja', 27, 'F', 'TKT1010');

#queries:
SELECT * FROM passengers WHERE age > 30;
UPDATE passengers SET age = age + 1 WHERE gender = 'F';
DELETE FROM passengers WHERE ticket_number = 'TKT1009';
ALTER TABLE passengers ADD nationality VARCHAR(30);
SELECT gender, COUNT(*) FROM passengers GROUP BY gender;
SELECT * FROM passengers ORDER BY age DESC;
SELECT MIN(age) FROM passengers;
SELECT MAX(age) FROM passengers;
SELECT * FROM passengers WHERE name LIKE 'P%';
SELECT COUNT(*) FROM passengers;

CREATE TABLE complaints (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    complaint_text VARCHAR(255),
    complaint_date DATE
);

INSERT INTO complaints (passenger_id, flight_id, complaint_text, complaint_date) VALUES
(1, 1, 'Lost baggage', '2024-01-15'),
(2, 2, 'Flight delay', '2024-01-18'),
(3, 3, 'Poor service', '2024-01-20'),
(4, 4, 'Seat issue', '2024-01-22'),
(5, 5, 'Food quality', '2024-01-25'),
(6, 6, 'No entertainment', '2024-01-27'),
(7, 7, 'Cabin too cold', '2024-01-29'),
(8, 8, 'Overbooking', '2024-02-01'),
(9, 9, 'Crew behaviour', '2024-02-03'),
(10, 10, 'Late boarding', '2024-02-05');

#queries:
SELECT * FROM complaints WHERE complaint_date >= '2024-02-01';
UPDATE complaints SET complaint_text = 'Delayed boarding' WHERE complaint_id = 10;
DELETE FROM complaints WHERE complaint_text = 'No entertainment';
ALTER TABLE complaints ADD complaint_status VARCHAR(20);
SELECT flight_id, COUNT(*) FROM complaints GROUP BY flight_id;
SELECT * FROM complaints ORDER BY complaint_date;
SELECT MIN(complaint_date) FROM complaints;
SELECT MAX(complaint_date) FROM complaints;
SELECT * FROM complaints WHERE complaint_text LIKE '%service%';
SELECT COUNT(*) FROM complaints;
#=====================================================================================================================================
CREATE DATABASE gym01;
USE gym01;


-- 1. Members Table
CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    city VARCHAR(30)
);

INSERT INTO members (name, age, gender, city) VALUES
('Rahul', 25, 'M', 'Delhi'),
('Sneha', 28, 'F', 'Mumbai'),
('Amit', 22, 'M', 'Pune'),
('Priya', 30, 'F', 'Chennai'),
('Ravi', 27, 'M', 'Hyderabad'),
('Anita', 26, 'F', 'Bangalore'),
('Vikram', 32, 'M', 'Kolkata'),
('Neha', 24, 'F', 'Jaipur'),
('Karan', 29, 'M', 'Ahmedabad'),
('Simran', 23, 'F', 'Surat');

# Queries:
SELECT * FROM members WHERE city = 'Mumbai';
SELECT city, COUNT(*) FROM members GROUP BY city;
UPDATE members SET age = age + 1 WHERE gender = 'F';
DELETE FROM members WHERE city = 'Surat';
ALTER TABLE members ADD phone VARCHAR(15);
SELECT * FROM members ORDER BY age ASC LIMIT 1;
SELECT * FROM members ORDER BY age DESC LIMIT 1;
SELECT * FROM members WHERE name LIKE 'A%';
SELECT COUNT(*) FROM members;
SELECT * FROM members ORDER BY city, name;

-- 2. Trainers Table
CREATE TABLE trainers (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    specialty VARCHAR(30),
    experience_years INT,
    salary INT
);

INSERT INTO trainers (name, specialty, experience_years, salary) VALUES
('Mr. Sharma', 'Weight Training', 8, 40000),
('Ms. Verma', 'Yoga', 5, 35000),
('Mr. Khan', 'Cardio', 10, 45000),
('Mrs. Das', 'Zumba', 6, 38000),
('Mr. Rao', 'CrossFit', 7, 42000),
('Mrs. Patel', 'Pilates', 9, 43000),
('Mr. Gupta', 'MMA', 12, 50000),
('Mrs. Singh', 'Dance Fitness', 8, 41000),
('Mr. Mehta', 'Bodybuilding', 11, 47000),
('Mrs. Nair', 'Functional Training', 6, 39000);

# Queries:
SELECT * FROM trainers WHERE salary > 42000;
UPDATE trainers SET salary = salary + 2000 WHERE specialty = 'Cardio';
DELETE FROM trainers WHERE experience_years < 6;
ALTER TABLE trainers ADD phone_number VARCHAR(15);
SELECT specialty, COUNT(*) FROM trainers GROUP BY specialty;
SELECT * FROM trainers ORDER BY salary DESC LIMIT 1;
SELECT * FROM trainers ORDER BY salary ASC LIMIT 1;
SELECT * FROM trainers WHERE name LIKE '%Mr.%';
SELECT SUM(salary) AS total_salary FROM trainers;
SELECT AVG(salary) AS avg_salary FROM trainers;

-- 3. Equipment Table
CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    purchase_year INT
);

INSERT INTO equipment (name, category, quantity, purchase_year) VALUES
('Treadmill', 'Cardio', 5, 2020),
('Dumbbells', 'Strength', 20, 2019),
('Bench Press', 'Strength', 3, 2021),
('Exercise Bike', 'Cardio', 4, 2020),
('Rowing Machine', 'Cardio', 2, 2022),
('Kettlebells', 'Strength', 15, 2021),
('Pull-up Bar', 'Strength', 6, 2018),
('Elliptical', 'Cardio', 3, 2021),
('Squat Rack', 'Strength', 2, 2022),
('Resistance Bands', 'Strength', 30, 2023);

# Queries:
SELECT * FROM equipment WHERE category = 'Cardio';
SELECT category, COUNT(*) FROM equipment GROUP BY category;
UPDATE equipment SET quantity = quantity + 1 WHERE name = 'Dumbbells';
DELETE FROM equipment WHERE purchase_year < 2019;
ALTER TABLE equipment ADD brand VARCHAR(30);
SELECT * FROM equipment ORDER BY quantity DESC;
SELECT MAX(quantity) FROM equipment;
SELECT MIN(quantity) FROM equipment;
SELECT * FROM equipment WHERE purchase_year = 2021;
SELECT COUNT(*) FROM equipment;

-- 4. Memberships Table
CREATE TABLE memberships (
    membership_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    type VARCHAR(20),
    start_date DATE,
    end_date DATE
);

INSERT INTO memberships (member_id, type, start_date, end_date) VALUES
(1, 'Monthly', '2024-01-01', '2024-01-31'),
(2, 'Quarterly', '2024-02-01', '2024-04-30'),
(3, 'Yearly', '2024-03-01', '2025-02-28'),
(4, 'Monthly', '2024-04-01', '2024-04-30'),
(5, 'Quarterly', '2024-05-01', '2024-07-31'),
(6, 'Yearly', '2024-06-01', '2025-05-31'),
(7, 'Monthly', '2024-07-01', '2024-07-31'),
(8, 'Quarterly', '2024-08-01', '2024-10-31'),
(9, 'Yearly', '2024-09-01', '2025-08-31'),
(10, 'Monthly', '2024-10-01', '2024-10-31');

# Queries:
SELECT * FROM memberships WHERE type = 'Yearly';
SELECT type, COUNT(*) FROM memberships GROUP BY type;
UPDATE memberships SET type = 'Yearly' WHERE membership_id = 1;
DELETE FROM memberships WHERE type = 'Monthly' AND start_date < '2024-05-01';
ALTER TABLE memberships ADD price INT;
SELECT * FROM memberships ORDER BY start_date;
SELECT MIN(start_date) FROM memberships;
SELECT MAX(end_date) FROM memberships;
SELECT * FROM memberships WHERE start_date >= '2024-06-01';
SELECT COUNT(*) FROM memberships;

-- 5. Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    membership_id INT,
    amount INT,
    payment_date DATE,
    payment_method VARCHAR(20)
);

INSERT INTO payments (membership_id, amount, payment_date, payment_method) VALUES
(1, 1500, '2024-01-01', 'Cash'),
(2, 4000, '2024-02-01', 'Card'),
(3, 12000, '2024-03-01', 'Online'),
(4, 1500, '2024-04-01', 'Cash'),
(5, 4000, '2024-05-01', 'Card'),
(6, 12000, '2024-06-01', 'Online'),
(7, 1500, '2024-07-01', 'Cash'),
(8, 4000, '2024-08-01', 'Card'),
(9, 12000, '2024-09-01', 'Online'),
(10, 1500, '2024-10-01', 'Cash');

# Queries:
SELECT * FROM payments WHERE payment_method = 'Cash';
SELECT payment_method, COUNT(*) FROM payments GROUP BY payment_method;
UPDATE payments SET amount = amount + 500 WHERE payment_method = 'Cash';
DELETE FROM payments WHERE amount < 2000;
ALTER TABLE payments ADD status VARCHAR(20);
SELECT * FROM payments ORDER BY amount DESC;
SELECT MAX(amount) FROM payments;
SELECT MIN(amount) FROM payments;
SELECT * FROM payments WHERE payment_date BETWEEN '2024-06-01' AND '2024-09-30';
SELECT COUNT(*) FROM payments;
#======================================================================================================================================
CREATE DATABASE amazon01;
USE amazon01;

-- Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(30),
    join_date DATE
);

-- Insert 10 Records
INSERT INTO customers (name, email, city, join_date) VALUES
('John Doe', 'john@example.com', 'Delhi', '2023-01-15'),
('Sara Smith', 'sara@example.com', 'Mumbai', '2023-02-10'),
('Amit Kumar', 'amit@example.com', 'Chennai', '2023-03-05'),
('Priya Singh', 'priya@example.com', 'Kolkata', '2023-04-12'),
('Ravi Patel', 'ravi@example.com', 'Hyderabad', '2023-05-01'),
('Simran Kaur', 'simran@example.com', 'Pune', '2023-06-18'),
('Karan Malhotra', 'karan@example.com', 'Bangalore', '2023-07-20'),
('Anita Sharma', 'anita@example.com', 'Delhi', '2023-08-25'),
('Manoj Mehta', 'manoj@example.com', 'Jaipur', '2023-09-10'),
('Neha Gupta', 'neha@example.com', 'Ahmedabad', '2023-10-02');

-- Queries
SELECT * FROM customers WHERE city = 'Delhi';
SELECT city, COUNT(*) FROM customers GROUP BY city;
UPDATE customers SET city = 'Noida' WHERE name = 'John Doe';
DELETE FROM customers WHERE city = 'Ahmedabad';
ALTER TABLE customers ADD phone_number VARCHAR(15);
SELECT * FROM customers ORDER BY join_date ASC LIMIT 1;
SELECT * FROM customers ORDER BY join_date DESC LIMIT 1;
SELECT * FROM customers WHERE name LIKE 'A%';
SELECT COUNT(*) FROM customers;
SELECT * FROM customers ORDER BY city, name;

-- Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock INT
);

-- Insert 10 Records
INSERT INTO products (name, category, price, stock) VALUES
('Laptop', 'Electronics', 60000.00, 50),
('Smartphone', 'Electronics', 25000.00, 150),
('Headphones', 'Accessories', 2000.00, 300),
('Shoes', 'Fashion', 1500.00, 100),
('T-shirt', 'Fashion', 500.00, 200),
('Microwave', 'Home Appliances', 8000.00, 40),
('Refrigerator', 'Home Appliances', 30000.00, 20),
('Watch', 'Accessories', 3000.00, 120),
('Book', 'Books', 300.00, 500),
('Tablet', 'Electronics', 15000.00, 80);

-- Queries
SELECT * FROM products WHERE category = 'Electronics';
SELECT category, COUNT(*) FROM products GROUP BY category;
UPDATE products SET price = price * 1.1 WHERE category = 'Electronics';
DELETE FROM products WHERE stock < 30;
ALTER TABLE products ADD brand VARCHAR(30);
SELECT * FROM products ORDER BY price DESC LIMIT 1;
SELECT * FROM products ORDER BY price ASC LIMIT 1;
SELECT * FROM products WHERE name LIKE '%o%';
SELECT SUM(stock) FROM products;
SELECT AVG(price) FROM products;

-- Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);

-- Insert 10 Records
INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2023-11-01'),
(2, 2, 2, '2023-11-02'),
(3, 3, 1, '2023-11-03'),
(4, 4, 3, '2023-11-04'),
(5, 5, 2, '2023-11-05'),
(6, 6, 1, '2023-11-06'),
(7, 7, 4, '2023-11-07'),
(8, 8, 2, '2023-11-08'),
(9, 9, 5, '2023-11-09'),
(10, 10, 1, '2023-11-10');

-- Queries
SELECT * FROM orders WHERE quantity > 2;
SELECT customer_id, COUNT(*) FROM orders GROUP BY customer_id;
UPDATE orders SET quantity = quantity + 1 WHERE order_id = 1;
DELETE FROM orders WHERE order_id = 10;
ALTER TABLE orders ADD status VARCHAR(20);
SELECT * FROM orders ORDER BY order_date DESC;
SELECT MIN(quantity) FROM orders;
SELECT MAX(quantity) FROM orders;
SELECT * FROM orders WHERE customer_id = 5;
SELECT COUNT(*) FROM orders;


-- Table
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    rating INT,
    review_date DATE
);

-- Insert 10 Records
INSERT INTO reviews (customer_id, product_id, rating, review_date) VALUES
(1, 1, 5, '2023-11-11'),
(2, 2, 4, '2023-11-12'),
(3, 3, 3, '2023-11-13'),
(4, 4, 5, '2023-11-14'),
(5, 5, 2, '2023-11-15'),
(6, 6, 4, '2023-11-16'),
(7, 7, 3, '2023-11-17'),
(8, 8, 5, '2023-11-18'),
(9, 9, 4, '2023-11-19'),
(10, 10, 5, '2023-11-20');

-- Queries
SELECT * FROM reviews WHERE rating >= 4;
SELECT product_id, COUNT(*) FROM reviews GROUP BY product_id;
UPDATE reviews SET rating = 5 WHERE rating < 3;
DELETE FROM reviews WHERE rating = 1;
ALTER TABLE reviews ADD comment VARCHAR(255);
SELECT * FROM reviews ORDER BY review_date DESC;
SELECT MIN(rating) FROM reviews;
SELECT MAX(rating) FROM reviews;
SELECT AVG(rating) FROM reviews;
SELECT COUNT(*) FROM reviews;

-- Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    payment_date DATE
);

-- Insert 10 Records
INSERT INTO payments (order_id, amount, payment_method, payment_date) VALUES
(1, 60000.00, 'Credit Card', '2023-11-21'),
(2, 50000.00, 'UPI', '2023-11-22'),
(3, 2000.00, 'Debit Card', '2023-11-23'),
(4, 4500.00, 'Credit Card', '2023-11-24'),
(5, 5000.00, 'UPI', '2023-11-25'),
(6, 8000.00, 'Net Banking', '2023-11-26'),
(7, 6000.00, 'Credit Card', '2023-11-27'),
(8, 3000.00, 'UPI', '2023-11-28'),
(9, 300.00, 'Debit Card', '2023-11-29'),
(10, 15000.00, 'UPI', '2023-11-30');

-- Queries
SELECT * FROM payments WHERE amount > 10000;
SELECT payment_method, COUNT(*) FROM payments GROUP BY payment_method;
UPDATE payments SET amount = amount + 500 WHERE payment_id = 1;
DELETE FROM payments WHERE amount < 500;
ALTER TABLE payments ADD transaction_id VARCHAR(50);
SELECT * FROM payments ORDER BY amount DESC;
SELECT MIN(amount) FROM payments;
SELECT MAX(amount) FROM payments;
SELECT SUM(amount) FROM payments;
SELECT COUNT(*) FROM payments;
#=====================================================================================================================================
-- 7.
create database Myntra;
use Myntra;
drop database Myntra;

CREATE TABLE myntra_users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    mobile VARCHAR(15),
    city VARCHAR(50),
    membership_status VARCHAR(20)
);

select * from myntra_users;
truncate table myntra_users;
drop table myntra_users;

INSERT INTO myntra_users VALUES
(1, 'rohit123', 'rohit@mail.com', '9876543210', 'Mumbai', 'Active'),
(2, 'neha_k', 'neha@mail.com', '9123456780', 'Delhi', 'Inactive'),
(3, 'sachin_89', 'sachin@mail.com', '9988776655', 'Bangalore', 'Active'),
(4, 'anita_p', 'anita@mail.com', '9876501234', 'Hyderabad', 'Active'),
(5, 'vikram_s', 'vikram@mail.com', '9123467890', 'Chennai', 'Inactive'),
(6, 'meera_r', 'meera@mail.com', '9988112233', 'Pune', 'Active'),
(7, 'aditya_m', 'aditya@mail.com', '9876540987', 'Kolkata', 'Active'),
(8, 'priya_g', 'priya@mail.com', '9123498765', 'Ahmedabad', 'Inactive'),
(9, 'rahul_t', 'rahul@mail.com', '9988770099', 'Mumbai', 'Active'),
(10, 'sneha_w', 'sneha@mail.com', '9876509876', 'Delhi', 'Active');

CREATE TABLE myntra_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

select * from myntra_products;
truncate table myntra_products;
drop table myntra_products;

INSERT INTO myntra_products VALUES
(1, 'Men T-Shirt', 'Clothing', 'Nike', 799.00, 100),
(2, 'Women Dress', 'Clothing', 'Zara', 1499.00, 50),
(3, 'Sports Shoes', 'Footwear', 'Adidas', 2499.00, 30),
(4, 'Handbag', 'Accessories', 'Guess', 2999.00, 20),
(5, 'Jeans', 'Clothing', 'Levis', 1799.00, 40),
(6, 'Sunglasses', 'Accessories', 'Ray-Ban', 3499.00, 15),
(7, 'Men Sneakers', 'Footwear', 'Puma', 2199.00, 25),
(8, 'Women Sandals', 'Footwear', 'Bata', 999.00, 60),
(9, 'Jacket', 'Clothing', 'Columbia', 3999.00, 10),
(10, 'Wrist Watch', 'Accessories', 'Fossil', 5999.00, 5);

CREATE TABLE myntra_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    status VARCHAR(20)
);

select * from myntra_orders;
truncate table myntra_orders;
drop table myntra_orders;

INSERT INTO myntra_orders VALUES
(1, 1, 2, '2025-07-01', 1, 'Delivered'),
(2, 2, 3, '2025-07-05', 2, 'Cancelled'),
(3, 3, 1, '2025-07-10', 1, 'Delivered'),
(4, 4, 5, '2025-07-15', 1, 'Shipped'),
(5, 5, 7, '2025-07-20', 1, 'Processing'),
(6, 6, 4, '2025-07-25', 1, 'Delivered'),
(7, 7, 9, '2025-07-30', 1, 'Delivered'),
(8, 8, 8, '2025-08-01', 3, 'Processing'),
(9, 9, 6, '2025-08-05', 1, 'Cancelled'),
(10, 10, 10, '2025-08-10', 1, 'Delivered');

CREATE TABLE myntra_reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT,
    comment VARCHAR(255),
    review_date DATE
);

select * from myntra_reviews;
truncate table myntra_reviews;
drop table myntra_reviews;

INSERT INTO myntra_reviews VALUES
(1, 1, 3, 5, 'Excellent quality!', '2025-07-12'),
(2, 2, 1, 4, 'Good fit and fabric', '2025-07-15'),
(3, 3, 7, 3, 'Comfortable but pricey', '2025-07-18'),
(4, 4, 6, 5, 'Loved the design', '2025-07-20'),
(5, 5, 4, 4, 'Nice jeans', '2025-07-22'),
(6, 6, 9, 5, 'Stylish sunglasses', '2025-07-25'),
(7, 7, 5, 4, 'Great sneakers', '2025-07-28'),
(8, 8, 2, 3, 'Average sandals', '2025-07-30'),
(9, 9, 10, 5, 'Warm and comfortable', '2025-08-02'),
(10, 10, 8, 4, 'Nice watch', '2025-08-05');

CREATE TABLE myntra_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    description VARCHAR(255),
    parent_category VARCHAR(50),
    status VARCHAR(20)
);

select * from myntra_categories;
truncate table myntra_categories;
drop table myntra_categories;

INSERT INTO myntra_categories VALUES
(1, 'Clothing', 'Wearable garments', NULL, 'Active'),
(2, 'Footwear', 'Shoes and sandals', NULL, 'Active'),
(3, 'Accessories', 'Fashion accessories', NULL, 'Active'),
(4, 'Men', 'Men clothing and accessories', 'Clothing', 'Active'),
(5, 'Women', 'Women clothing and accessories', 'Clothing', 'Active'),
(6, 'Sports', 'Sportswear and shoes', 'Clothing', 'Active'),
(7, 'Bags', 'All types of bags', 'Accessories', 'Active'),
(8, 'Watches', 'Wrist watches', 'Accessories', 'Active'),
(9, 'Winter Wear', 'Warm clothing', 'Clothing', 'Active'),
(10, 'Casual', 'Casual wear', 'Clothing', 'Active');

-------------------------------------------------------------------------------------------------------------------------------------------
-- 8.
create database reliance_digital;
use reliance_digital;
drop database reliance_digital;

CREATE TABLE reliance_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    loyalty_status VARCHAR(20)
);

select * from reliance_customers;
truncate table reliance_customers;
drop table reliance_customers;

INSERT INTO reliance_customers VALUES
(1, 'Amit Kumar', 'amit.k@rd.com', '9876543210', 'Mumbai', 'Gold'),
(2, 'Sneha Patel', 'sneha.p@rd.com', '9123456780', 'Delhi', 'Silver'),
(3, 'Rohit Singh', 'rohit.s@rd.com', '9988776655', 'Bangalore', 'Platinum'),
(4, 'Anjali Sharma', 'anjali.s@rd.com', '9876501234', 'Hyderabad', 'Gold'),
(5, 'Vikram Joshi', 'vikram.j@rd.com', '9123467890', 'Chennai', 'Silver'),
(6, 'Meena Gupta', 'meena.g@rd.com', '9988112233', 'Pune', 'Gold'),
(7, 'Rajesh Rao', 'rajesh.r@rd.com', '9876540987', 'Kolkata', 'Platinum'),
(8, 'Priya Singh', 'priya.s@rd.com', '9123498765', 'Ahmedabad', 'Silver'),
(9, 'Rahul Tiwari', 'rahul.t@rd.com', '9988770099', 'Mumbai', 'Gold'),
(10, 'Sonal Verma', 'sonal.v@rd.com', '9876509876', 'Delhi', 'Silver');

CREATE TABLE reliance_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

select * from reliance_products;
truncate table reliance_products;
drop table reliance_products;

INSERT INTO reliance_products VALUES
(1, 'Smartphone', 'Mobile', 'Samsung', 24999.00, 100),
(2, 'LED TV', 'Television', 'LG', 39999.00, 50),
(3, 'Laptop', 'Computers', 'HP', 54999.00, 30),
(4, 'Air Conditioner', 'Home Appliances', 'Daikin', 29999.00, 20),
(5, 'Washing Machine', 'Home Appliances', 'Bosch', 34999.00, 40),
(6, 'Bluetooth Speaker', 'Audio', 'JBL', 4999.00, 15),
(7, 'Refrigerator', 'Home Appliances', 'Whirlpool', 27999.00, 25),
(8, 'Smart Watch', 'Wearables', 'Apple', 19999.00, 60),
(9, 'Microwave Oven', 'Kitchen Appliances', 'IFB', 9999.00, 10),
(10, 'Gaming Console', 'Entertainment', 'Sony', 29999.00, 5);

CREATE TABLE reliance_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    status VARCHAR(20)
);

select * from reliance_orders;
truncate table reliance_orders;
drop table reliance_orders;

INSERT INTO reliance_orders VALUES
(1, 1, 2, '2025-07-01', 1, 'Delivered'),
(2, 2, 3, '2025-07-05', 2, 'Cancelled'),
(3, 3, 1, '2025-07-10', 1, 'Delivered'),
(4, 4, 5, '2025-07-15', 1, 'Shipped'),
(5, 5, 7, '2025-07-20', 1, 'Processing'),
(6, 6, 4, '2025-07-25', 1, 'Delivered'),
(7, 7, 9, '2025-07-30', 1, 'Delivered'),
(8, 8, 8, '2025-08-01', 3, 'Processing'),
(9, 9, 6, '2025-08-05', 1, 'Cancelled'),
(10, 10, 10, '2025-08-10', 1, 'Delivered');

CREATE TABLE reliance_suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_person VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    city VARCHAR(50)
);

select * from reliance_suppliers;
truncate table reliance_suppliers;
drop table reliance_suppliers;

INSERT INTO reliance_suppliers VALUES
(1, 'Electro Supplies', 'Rajesh Kumar', '9876543210', 'rajesh@electro.com', 'Mumbai'),
(2, 'Tech Warehouse', 'Sneha Gupta', '9123456780', 'sneha@techware.com', 'Delhi'),
(3, 'Gadget World', 'Rohit Singh', '9988776655', 'rohit@gadget.com', 'Bangalore'),
(4, 'Home Essentials', 'Anjali Sharma', '9876501234', 'anjali@homeessentials.com', 'Hyderabad'),
(5, 'Appliance Hub', 'Vikram Joshi', '9123467890', 'vikram@appliance.com', 'Chennai'),
(6, 'Audio Plus', 'Meena Gupta', '9988112233', 'meena@audioplus.com', 'Pune'),
(7, 'Cooling Systems', 'Rajesh Rao', '9876540987', 'rajesh@cooling.com', 'Kolkata'),
(8, 'Wearable Tech', 'Priya Singh', '9123498765', 'priya@wearable.com', 'Ahmedabad'),
(9, 'Kitchen King', 'Rahul Tiwari', '9988770099', 'rahul@kitchen.com', 'Mumbai'),
(10, 'Gaming Gear', 'Sonal Verma', '9876509876', 'sonal@gaming.com', 'Delhi');

CREATE TABLE reliance_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    description VARCHAR(255),
    parent_category VARCHAR(50),
    status VARCHAR(20)
);

select * from reliance_categories;
truncate table reliance_categories;
drop table reliance_categories;

INSERT INTO reliance_categories VALUES
(1, 'Mobile', 'Mobile phones and accessories', NULL, 'Active'),
(2, 'Television', 'LED and Smart TVs', NULL, 'Active'),
(3, 'Computers', 'Laptops and desktops', NULL, 'Active'),
(4, 'Home Appliances', 'Appliances for home use', NULL, 'Active'),
(5, 'Audio', 'Speakers, headphones, and audio devices', NULL, 'Active'),
(6, 'Wearables', 'Smart watches and fitness bands', NULL, 'Active'),
(7, 'Kitchen Appliances', 'Microwaves, ovens, and more', NULL, 'Active'),
(8, 'Entertainment', 'Gaming consoles and accessories', NULL, 'Active'),
(9, 'Cooling', 'Air conditioners and coolers', NULL, 'Active'),
(10, 'Cleaning', 'Washing machines and cleaners', NULL, 'Active');

------------------------------------------------------------------------------------------------------------------------------------------
-- 9.
create database Jiomart;
use Jiomart;
drop database Jiomart;

CREATE TABLE jiomart_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    membership VARCHAR(20)
);

select * from jiomart_customers;
truncate table jiomart_customers;
drop table jiomart_customers;

INSERT INTO jiomart_customers VALUES
(1, 'Rakesh Sharma', 'rakesh@mail.com', '9876543210', 'Mumbai', 'Prime'),
(2, 'Pooja Gupta', 'pooja@mail.com', '9123456780', 'Delhi', 'Standard'),
(3, 'Suresh Kumar', 'suresh@mail.com', '9988776655', 'Bangalore', 'Prime'),
(4, 'Neha Singh', 'neha@mail.com', '9876501234', 'Hyderabad', 'Standard'),
(5, 'Vikas Joshi', 'vikas@mail.com', '9123467890', 'Chennai', 'Prime'),
(6, 'Meena Patel', 'meena@mail.com', '9988112233', 'Pune', 'Standard'),
(7, 'Rajesh Verma', 'rajesh@mail.com', '9876540987', 'Kolkata', 'Prime'),
(8, 'Priya Reddy', 'priya@mail.com', '9123498765', 'Ahmedabad', 'Standard'),
(9, 'Rahul Tiwari', 'rahul@mail.com', '9988770099', 'Mumbai', 'Prime'),
(10, 'Sonal Mehta', 'sonal@mail.com', '9876509876', 'Delhi', 'Standard');

CREATE TABLE jiomart_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

select * from jiomart_products;
truncate table jiomart_products;
drop table jiomart_products;

INSERT INTO jiomart_products VALUES
(1, 'Rice', 'Groceries', 'India Gate', 50.00, 1000),
(2, 'Wheat Flour', 'Groceries', 'Aashirvaad', 40.00, 800),
(3, 'Sugar', 'Groceries', 'Tata', 35.00, 600),
(4, 'Cooking Oil', 'Groceries', 'Fortune', 120.00, 500),
(5, 'Milk', 'Dairy', 'Amul', 50.00, 700),
(6, 'Butter', 'Dairy', 'Amul', 60.00, 400),
(7, 'Eggs', 'Poultry', 'Local Farm', 5.00, 1000),
(8, 'Bread', 'Bakery', 'Britannia', 30.00, 300),
(9, 'Salt', 'Groceries', 'Tata', 10.00, 900),
(10, 'Tea', 'Beverages', 'Tata', 80.00, 450);

CREATE TABLE jiomart_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    status VARCHAR(20)
);

select * from jiomart_orders;
truncate table jiomart_orders;
drop table jiomart_orders;

INSERT INTO jiomart_orders VALUES
(1, 1, 1, '2025-07-01', 10, 'Delivered'),
(2, 2, 4, '2025-07-05', 5, 'Cancelled'),
(3, 3, 2, '2025-07-10', 15, 'Delivered'),
(4, 4, 5, '2025-07-15', 20, 'Shipped'),
(5, 5, 3, '2025-07-20', 10, 'Processing'),
(6, 6, 6, '2025-07-25', 7, 'Delivered'),
(7, 7, 7, '2025-07-30', 12, 'Delivered'),
(8, 8, 8, '2025-08-01', 8, 'Processing'),
(9, 9, 9, '2025-08-05', 10, 'Cancelled'),
(10, 10, 10, '2025-08-10', 6, 'Delivered');

CREATE TABLE jiomart_suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_person VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    city VARCHAR(50)
);

select * from jiomart_suppliers;
truncate table jiomart_suppliers;
drop table jiomart_suppliers;

INSERT INTO jiomart_suppliers VALUES
(1, 'Fresh Farms', 'Ramesh Kumar', '9876543210', 'ramesh@freshfarms.com', 'Mumbai'),
(2, 'Organic Supplies', 'Sneha Gupta', '9123456780', 'sneha@organic.com', 'Delhi'),
(3, 'Daily Needs', 'Rohit Singh', '9988776655', 'rohit@dailyneeds.com', 'Bangalore'),
(4, 'Farm Fresh', 'Anjali Sharma', '9876501234', 'anjali@farmfresh.com', 'Hyderabad'),
(5, 'Kitchen Essentials', 'Vikram Joshi', '9123467890', 'vikram@kitchen.com', 'Chennai'),
(6, 'Milk Producers', 'Meena Gupta', '9988112233', 'meena@milk.com', 'Pune'),
(7, 'Egg Distributors', 'Rajesh Rao', '9876540987', 'rajesh@eggs.com', 'Kolkata'),
(8, 'Bakery Supplies', 'Priya Singh', '9123498765', 'priya@bakery.com', 'Ahmedabad'),
(9, 'Salt Suppliers', 'Rahul Tiwari', '9988770099', 'rahul@salt.com', 'Mumbai'),
(10, 'Tea Traders', 'Sonal Verma', '9876509876', 'sonal@tea.com', 'Delhi');

CREATE TABLE jiomart_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    description VARCHAR(255),
    parent_category VARCHAR(50),
    status VARCHAR(20)
);

select * from jiomart_categories;
truncate table jiomart_categories;
drop table jiomart_categories;

INSERT INTO jiomart_categories VALUES
(1, 'Groceries', 'Daily grocery items', NULL, 'Active'),
(2, 'Dairy', 'Milk and dairy products', NULL, 'Active'),
(3, 'Poultry', 'Eggs and meat products', NULL, 'Active'),
(4, 'Bakery', 'Bread and baked goods', NULL, 'Active'),
(5, 'Beverages', 'Tea, coffee, and juices', NULL, 'Active'),
(6, 'Fruits', 'Fresh fruits', NULL, 'Active'),
(7, 'Vegetables', 'Fresh vegetables', NULL, 'Active'),
(8, 'Snacks', 'Chips and snacks', NULL, 'Active'),
(9, 'Personal Care', 'Hygiene products', NULL, 'Active'),
(10, 'Household', 'Cleaning and home supplies', NULL, 'Active');

-------------------------------------------------------------------------------------------------------------------------------------------

create database bluedart;
use bluedart;
drop database bluedart;

CREATE TABLE bluedart_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    membership VARCHAR(20)
);

select * from bluedart_customers;
truncate table bluedart_customers;
drop table bluedart_customers;

INSERT INTO bluedart_customers VALUES
(1, 'Arjun Mehta', 'arjun@mail.com', '9876543210', 'Mumbai', 'Premium'),
(2, 'Divya Singh', 'divya@mail.com', '9123456780', 'Delhi', 'Standard'),
(3, 'Karan Verma', 'karan@mail.com', '9988776655', 'Bangalore', 'Premium'),
(4, 'Neelam Patel', 'neelam@mail.com', '9876501234', 'Hyderabad', 'Standard'),
(5, 'Rohit Joshi', 'rohit@mail.com', '9123467890', 'Chennai', 'Premium'),
(6, 'Megha Gupta', 'megha@mail.com', '9988112233', 'Pune', 'Standard'),
(7, 'Sanjay Kumar', 'sanjay@mail.com', '9876540987', 'Kolkata', 'Premium'),
(8, 'Priya Reddy', 'priya@mail.com', '9123498765', 'Ahmedabad', 'Standard'),
(9, 'Rahul Sharma', 'rahul@mail.com', '9988770099', 'Mumbai', 'Premium'),
(10, 'Sonal Mehta', 'sonal@mail.com', '9876509876', 'Delhi', 'Standard');

CREATE TABLE bluedart_packages (
    package_id INT PRIMARY KEY,
    customer_id INT,
    origin_city VARCHAR(50),
    destination_city VARCHAR(50),
    weight DECIMAL(5,2),
    status VARCHAR(20)
);

select * from bluedart_packages;
truncate table bluedart_packages;
drop table bluedart_packages;

INSERT INTO bluedart_packages VALUES
(1, 1, 'Mumbai', 'Delhi', 2.5, 'Delivered'),
(2, 2, 'Delhi', 'Bangalore', 1.2, 'In Transit'),
(3, 3, 'Bangalore', 'Chennai', 3.0, 'Delivered'),
(4, 4, 'Hyderabad', 'Mumbai', 2.0, 'Cancelled'),
(5, 5, 'Chennai', 'Kolkata', 1.5, 'In Transit'),
(6, 6, 'Pune', 'Ahmedabad', 4.0, 'Delivered'),
(7, 7, 'Kolkata', 'Mumbai', 2.8, 'Delivered'),
(8, 8, 'Ahmedabad', 'Delhi', 1.0, 'In Transit'),
(9, 9, 'Mumbai', 'Bangalore', 3.5, 'Cancelled'),
(10, 10, 'Delhi', 'Pune', 2.2, 'Delivered');

CREATE TABLE bluedart_employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    city VARCHAR(50)
);

select * from bluedart_employees;
truncate table bluedart_employees;
drop table bluedart_employees;

INSERT INTO bluedart_employees VALUES
(1, 'Vikram Singh', 'Delivery Executive', '9876543210', 'vikram@bluedart.com', 'Mumbai'),
(2, 'Neha Sharma', 'Customer Service', '9123456780', 'neha@bluedart.com', 'Delhi'),
(3, 'Rakesh Kumar', 'Warehouse Manager', '9988776655', 'rakesh@bluedart.com', 'Bangalore'),
(4, 'Anjali Verma', 'Logistics Coordinator', '9876501234', 'anjali@bluedart.com', 'Hyderabad'),
(5, 'Sanjay Gupta', 'Delivery Executive', '9123467890', 'sanjay@bluedart.com', 'Chennai'),
(6, 'Meera Joshi', 'Customer Service', '9988112233', 'meera@bluedart.com', 'Pune'),
(7, 'Rajesh Patel', 'Warehouse Staff', '9876540987', 'rajesh@bluedart.com', 'Kolkata'),
(8, 'Priya Singh', 'Delivery Executive', '9123498765', 'priya@bluedart.com', 'Ahmedabad'),
(9, 'Rahul Tiwari', 'Logistics Coordinator', '9988770099', 'rahul@bluedart.com', 'Mumbai'),
(10, 'Sonal Mehta', 'Customer Service', '9876509876', 'sonal@bluedart.com', 'Delhi');

CREATE TABLE bluedart_offices (
    office_id INT PRIMARY KEY,
    city VARCHAR(50),
    address VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(100),
    manager VARCHAR(100)
);

select * from bluedart_offices;
truncate table bluedart_offices;
drop table bluedart_offices;

INSERT INTO bluedart_offices VALUES
(1, 'Mumbai', '123 Marine Drive', '9876543210', 'mumbai@bluedart.com', 'Vikram Singh'),
(2, 'Delhi', '456 Connaught Place', '9123456780', 'delhi@bluedart.com', 'Neha Sharma'),
(3, 'Bangalore', '789 MG Road', '9988776655', 'bangalore@bluedart.com', 'Rakesh Kumar'),
(4, 'Hyderabad', '321 Banjara Hills', '9876501234', 'hyderabad@bluedart.com', 'Anjali Verma'),
(5, 'Chennai', '654 T Nagar', '9123467890', 'chennai@bluedart.com', 'Sanjay Gupta'),
(6, 'Pune', '987 Koregaon Park', '9988112233', 'pune@bluedart.com', 'Meera Joshi'),
(7, 'Kolkata', '159 Park Street', '9876540987', 'kolkata@bluedart.com', 'Rajesh Patel'),
(8, 'Ahmedabad', '753 CG Road', '9123498765', 'ahmedabad@bluedart.com', 'Priya Singh'),
(9, 'Nagpur', '852 Sitabuldi', '9988770099', 'nagpur@bluedart.com', 'Rahul Tiwari'),
(10, 'Surat', '951 Adajan', '9876509876', 'surat@bluedart.com', 'Sonal Mehta');

CREATE TABLE bluedart_services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    description VARCHAR(255),
    cost DECIMAL(10,2),
    duration_days INT,
    status VARCHAR(20)
);

select * from bluedart_services;
truncate table bluedart_services;
drop table bluedart_services;

INSERT INTO bluedart_services VALUES
(1, 'Same Day Delivery', 'Delivery within the same day', 500.00, 0, 'Active'),
(2, 'Next Day Delivery', 'Delivery by next day', 300.00, 1, 'Active'),
(3, 'Standard Delivery', 'Delivery within 3-5 days', 150.00, 3, 'Active'),
(4, 'Express Delivery', 'Delivery within 24 hours', 400.00, 1, 'Active'),
(5, 'International Shipping', 'Shipping outside India', 2000.00, 7, 'Active'),
(6, 'Cash on Delivery', 'Payment after delivery', 0.00, 3, 'Active'),
(7, 'Fragile Handling', 'Special care for fragile items', 250.00, 3, 'Active'),
(8, 'Bulk Shipping', 'Discounted rates for bulk', 1000.00, 5, 'Active'),
(9, 'Return Service', 'Easy returns', 100.00, 3, 'Active'),
(10, 'Insurance', 'Shipping insurance', 150.00, 3, 'Active');

------------------------------------------------------------------------------------------------------------------------------------------

Create database IMD;
use IMD;
drop database IMD;

CREATE TABLE imd_stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    latitude DECIMAL(8,5),
    longitude DECIMAL(8,5)
);

select * from imd_stations;
truncate table imd_stations;
drop table imd_stations;

INSERT INTO imd_stations VALUES
(1, 'Mumbai Weather Station', 'Mumbai', 'Maharashtra', 19.07600, 72.87766),
(2, 'Delhi Weather Station', 'Delhi', 'Delhi', 28.70406, 77.10249),
(3, 'Bangalore Weather Station', 'Bangalore', 'Karnataka', 12.97160, 77.59456),
(4, 'Chennai Weather Station', 'Chennai', 'Tamil Nadu', 13.08268, 80.27072),
(5, 'Kolkata Weather Station', 'Kolkata', 'West Bengal', 22.57265, 88.36389),
(6, 'Hyderabad Weather Station', 'Hyderabad', 'Telangana', 17.38504, 78.48667),
(7, 'Ahmedabad Weather Station', 'Ahmedabad', 'Gujarat', 23.02250, 72.57136),
(8, 'Pune Weather Station', 'Pune', 'Maharashtra', 18.52043, 73.85674),
(9, 'Jaipur Weather Station', 'Jaipur', 'Rajasthan', 26.91243, 75.78727),
(10, 'Lucknow Weather Station', 'Lucknow', 'Uttar Pradesh', 26.84670, 80.94616);

CREATE TABLE imd_forecasts (
    forecast_id INT PRIMARY KEY,
    station_id INT,
    forecast_date DATE,
    temperature_max DECIMAL(4,1),
    temperature_min DECIMAL(4,1),
    rainfall_mm DECIMAL(5,2)
);

select * from imd_forecasts;
truncate table imd_forecasts;
drop table imd_forecasts;

INSERT INTO imd_forecasts VALUES
(1, 1, '2025-08-01', 34.5, 27.0, 5.00),
(2, 2, '2025-08-01', 36.0, 28.5, 0.00),
(3, 3, '2025-08-01', 33.0, 25.5, 12.00),
(4, 4, '2025-08-01', 35.5, 27.5, 10.00),
(5, 5, '2025-08-01', 32.0, 26.0, 8.00),
(6, 6, '2025-08-01', 34.0, 27.0, 15.00),
(7, 7, '2025-08-01', 37.5, 29.0, 2.00),
(8, 8, '2025-08-01', 33.5, 26.5, 7.50),
(9, 9, '2025-08-01', 38.0, 30.0, 0.00),
(10, 10, '2025-08-01', 35.0, 28.0, 1.00);

CREATE TABLE imd_alerts (
    alert_id INT PRIMARY KEY,
    station_id INT,
    alert_date DATE,
    alert_type VARCHAR(50),
    description VARCHAR(255),
    severity VARCHAR(20)
);

select * from imd_alerts;
truncate table imd_alerts;
drop table imd_alerts;

INSERT INTO imd_alerts VALUES
(1, 1, '2025-08-01', 'Heavy Rainfall', 'Possible heavy rainfall in the area', 'High'),
(2, 2, '2025-08-01', 'Heat Wave', 'Temperatures expected to exceed 40C', 'Severe'),
(3, 3, '2025-08-01', 'Thunderstorm', 'Localized thunderstorm expected', 'Moderate'),
(4, 4, '2025-08-01', 'Cyclone Warning', 'Cyclone approaching coast', 'Severe'),
(5, 5, '2025-08-01', 'Flood Alert', 'Rising river levels expected', 'High'),
(6, 6, '2025-08-01', 'Heat Wave', 'High temperatures forecast', 'Moderate'),
(7, 7, '2025-08-01', 'Dry Spell', 'Lack of rainfall expected', 'Low'),
(8, 8, '2025-08-01', 'Heavy Rainfall', 'Heavy rain in localized areas', 'High'),
(9, 9, '2025-08-01', 'Thunderstorm', 'Storm expected in region', 'Moderate'),
(10, 10, '2025-08-01', 'Fog Alert', 'Dense fog expected in morning', 'Low');

CREATE TABLE imd_sensors (
    sensor_id INT PRIMARY KEY,
    station_id INT,
    sensor_type VARCHAR(50),
    installation_date DATE,
    status VARCHAR(20)
);

select * from imd_sensors;
truncate table imd_sensors;
drop table imd_sensors;

INSERT INTO imd_sensors VALUES
(1, 1, 'Temperature', '2020-01-15', 'Active'),
(2, 1, 'Rainfall', '2020-01-15', 'Active'),
(3, 2, 'Temperature', '2019-12-10', 'Active'),
(4, 2, 'Wind Speed', '2019-12-10', 'Inactive'),
(5, 3, 'Humidity', '2021-03-22', 'Active'),
(6, 4, 'Cyclone Radar', '2018-06-30', 'Active'),
(7, 5, 'Flood Sensor', '2017-11-11', 'Active'),
(8, 6, 'Temperature', '2019-07-07', 'Active'),
(9, 7, 'Rainfall', '2020-05-01', 'Inactive'),
(10, 8, 'Wind Speed', '2021-09-15', 'Active');

CREATE TABLE imd_personnel (
    personnel_id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    station_id INT,
    contact_phone VARCHAR(15),
    email VARCHAR(100)
);

select * from imd_personnel;
truncate table imd_personnel;
drop table imd_personnel;

INSERT INTO imd_personnel VALUES
(1, 'Dr. Ramesh Kumar', 'Meteorologist', 1, '9876543210', 'ramesh@imd.gov.in'),
(2, 'Ms. Anjali Sharma', 'Meteorologist', 2, '9123456780', 'anjali@imd.gov.in'),
(3, 'Mr. Suresh Singh', 'Technician', 3, '9988776655', 'suresh@imd.gov.in'),
(4, 'Dr. Priya Verma', 'Cyclone Specialist', 4, '9876501234', 'priya@imd.gov.in'),
(5, 'Mr. Rahul Joshi', 'Hydrologist', 5, '9123467890', 'rahul@imd.gov.in'),
(6, 'Ms. Meena Patel', 'Meteorologist', 6, '9988112233', 'meena@imd.gov.in'),
(7, 'Mr. Rajesh Rao', 'Technician', 7, '9876540987', 'rajesh@imd.gov.in'),
(8, 'Ms. Priya Singh', 'Researcher', 8, '9123498765', 'priya@imd.gov.in'),
(9, 'Dr. Vikram Tiwari', 'Meteorologist', 9, '9988770099', 'vikram@imd.gov.in'),
(10, 'Ms. Sonal Mehta', 'Technician', 10, '9876509876', 'sonal@imd.gov.in');

-------------------------------------------------------------------------------------------------------------------------------------------

create database Make_my_trip;
use Make_my_trip;
drop database Make_my_trip;
 
CREATE TABLE mmt_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from mmt_customers;
truncate table mmt_customers;
drop table mmt_customers;

INSERT INTO mmt_customers VALUES
(1, 'Ankit Sharma', 'ankit@mail.com', '9876543210', 'Delhi'),
(2, 'Riya Singh', 'riya@mail.com', '9123456780', 'Mumbai'),
(3, 'Vikram Patel', 'vikram@mail.com', '9988776655', 'Bangalore'),
(4, 'Neha Gupta', 'neha@mail.com', '9876501234', 'Chennai'),
(5, 'Rahul Verma', 'rahul@mail.com', '9123467890', 'Hyderabad'),
(6, 'Pooja Joshi', 'pooja@mail.com', '9988112233', 'Pune'),
(7, 'Sanjay Kumar', 'sanjay@mail.com', '9876540987', 'Kolkata'),
(8, 'Megha Reddy', 'megha@mail.com', '9123498765', 'Ahmedabad'),
(9, 'Rohit Tiwari', 'rohit@mail.com', '9988770099', 'Jaipur'),
(10, 'Sonal Mehta', 'sonal@mail.com', '9876509876', 'Lucknow');

CREATE TABLE mmt_flights (
    flight_id INT PRIMARY KEY,
    airline VARCHAR(100),
    flight_number VARCHAR(20),
    origin_city VARCHAR(50),
    destination_city VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME
);

select * from mmt_flights;
truncate table mmt_flights;
drop table mmt_flights;

INSERT INTO mmt_flights VALUES
(1, 'Air India', 'AI101', 'Delhi', 'Mumbai', '2025-08-20 09:00:00', '2025-08-20 11:00:00'),
(2, 'IndiGo', '6E202', 'Mumbai', 'Bangalore', '2025-08-21 13:00:00', '2025-08-21 15:00:00'),
(3, 'SpiceJet', 'SG303', 'Bangalore', 'Chennai', '2025-08-22 07:30:00', '2025-08-22 08:30:00'),
(4, 'GoAir', 'G845', 'Chennai', 'Hyderabad', '2025-08-23 14:00:00', '2025-08-23 15:30:00'),
(5, 'Vistara', 'UK505', 'Hyderabad', 'Delhi', '2025-08-24 18:00:00', '2025-08-24 20:30:00'),
(6, 'AirAsia', 'I525', 'Pune', 'Mumbai', '2025-08-25 06:00:00', '2025-08-25 07:00:00'),
(7, 'Jet Airways', '9W707', 'Kolkata', 'Delhi', '2025-08-26 10:00:00', '2025-08-26 12:00:00'),
(8, 'Air India', 'AI808', 'Ahmedabad', 'Pune', '2025-08-27 16:00:00', '2025-08-27 17:30:00'),
(9, 'IndiGo', '6E909', 'Jaipur', 'Mumbai', '2025-08-28 09:00:00', '2025-08-28 10:30:00'),
(10, 'SpiceJet', 'SG010', 'Lucknow', 'Delhi', '2025-08-29 11:00:00', '2025-08-29 12:00:00');

CREATE TABLE mmt_bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    booking_date DATE,
    seat_number VARCHAR(10),
    status VARCHAR(20)
);

select * from mmt_bookings;
truncate table mmt_bookings;
drop table mmt_bookings;

INSERT INTO mmt_bookings VALUES
(1, 1, 1, '2025-07-15', '12A', 'Confirmed'),
(2, 2, 2, '2025-07-16', '14C', 'Cancelled'),
(3, 3, 3, '2025-07-17', '10B', 'Confirmed'),
(4, 4, 4, '2025-07-18', '9D', 'Confirmed'),
(5, 5, 5, '2025-07-19', '7F', 'Pending'),
(6, 6, 6, '2025-07-20', '15A', 'Confirmed'),
(7, 7, 7, '2025-07-21', '3C', 'Confirmed'),
(8, 8, 8, '2025-07-22', '5B', 'Cancelled'),
(9, 9, 9, '2025-07-23', '1A', 'Confirmed'),
(10, 10, 10, '2025-07-24', '11E', 'Confirmed');

CREATE TABLE mmt_hotels (
    hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(2,1),
    price_per_night DECIMAL(10,2)
);

select * from mmt_hotels;
truncate table mmt_hotels;
drop table mmt_hotels;

INSERT INTO mmt_hotels VALUES
(1, 'Taj Palace', 'Delhi', 4.5, 5000.00),
(2, 'The Oberoi', 'Mumbai', 4.7, 7000.00),
(3, 'ITC Gardenia', 'Bangalore', 4.6, 6000.00),
(4, 'Park Hyatt', 'Chennai', 4.4, 5500.00),
(5, 'Hyatt Regency', 'Hyderabad', 4.3, 4800.00),
(6, 'Le Meridien', 'Pune', 4.2, 4500.00),
(7, 'The Lalit', 'Kolkata', 4.1, 4000.00),
(8, 'Radisson Blu', 'Ahmedabad', 4.0, 4200.00),
(9, 'JW Marriott', 'Jaipur', 4.5, 5200.00),
(10, 'ITC Mughal', 'Lucknow', 4.3, 4700.00);

CREATE TABLE mmt_reviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    hotel_id INT,
    rating INT,
    review_text VARCHAR(255),
    review_date DATE
);

select * from mmt_reviews;
truncate table mmt_reviews;
drop table mmt_reviews;

INSERT INTO mmt_reviews VALUES
(1, 1, 1, 5, 'Excellent stay with great service', '2025-07-20'),
(2, 2, 2, 4, 'Good experience but a bit costly', '2025-07-21'),
(3, 3, 3, 5, 'Loved the hospitality', '2025-07-22'),
(4, 4, 4, 4, 'Comfortable rooms and good food', '2025-07-23'),
(5, 5, 5, 3, 'Average experience', '2025-07-24'),
(6, 6, 6, 4, 'Nice ambiance', '2025-07-25'),
(7, 7, 7, 3, 'Could improve cleanliness', '2025-07-26'),
(8, 8, 8, 4, 'Good location and service', '2025-07-27'),
(9, 9, 9, 5, 'Amazing hotel with great facilities', '2025-07-28'),
(10, 10, 10, 4, 'Comfortable and friendly staff', '2025-07-29');

-------------------------------------------------------------------------------------------------------------------------------------------

Create database Spotify;
use Spotify;
drop database Spotify;

CREATE TABLE spotify_users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    subscription_type VARCHAR(20),
    country VARCHAR(50)
);

select * from spotify_users;
truncate table spotify_users;
drop table spotify_users;

INSERT INTO spotify_users VALUES
(1, 'musiclover1', 'user1@spotify.com', 'Premium', 'USA'),
(2, 'rockfan', 'user2@spotify.com', 'Free', 'UK'),
(3, 'popqueen', 'user3@spotify.com', 'Premium', 'Canada'),
(4, 'jazzman', 'user4@spotify.com', 'Free', 'Australia'),
(5, 'classicalcat', 'user5@spotify.com', 'Premium', 'India'),
(6, 'hiphopking', 'user6@spotify.com', 'Premium', 'USA'),
(7, 'indiemusic', 'user7@spotify.com', 'Free', 'Germany'),
(8, 'bluesman', 'user8@spotify.com', 'Premium', 'France'),
(9, 'electrofan', 'user9@spotify.com', 'Free', 'Brazil'),
(10, 'reggaelover', 'user10@spotify.com', 'Premium', 'Jamaica');

CREATE TABLE spotify_artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(100),
    genre VARCHAR(50),
    country VARCHAR(50),
    debut_year INT
);

select * from spotify_artists;
truncate table spotify_artists;
drop table spotify_artists;

INSERT INTO spotify_artists VALUES
(1, 'The Weeknd', 'R&B', 'Canada', 2010),
(2, 'Taylor Swift', 'Pop', 'USA', 2006),
(3, 'Ed Sheeran', 'Pop', 'UK', 2011),
(4, 'Adele', 'Pop', 'UK', 2008),
(5, 'Drake', 'Hip-Hop', 'Canada', 2009),
(6, 'Beyonce', 'R&B', 'USA', 2003),
(7, 'Coldplay', 'Rock', 'UK', 1996),
(8, 'Bruno Mars', 'Pop', 'USA', 2010),
(9, 'Billie Eilish', 'Alternative', 'USA', 2015),
(10, 'Shakira', 'Pop', 'Colombia', 1990);

CREATE TABLE spotify_albums (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(100),
    artist_id INT,
    release_year INT,
    total_tracks INT
);

select * from spotify_albums;
truncate table spotify_albums;
drop table spotify_albums;

INSERT INTO spotify_albums VALUES
(1, 'After Hours', 1, 2020, 14),
(2, '1989', 2, 2014, 13),
(3, 'Divide', 3, 2017, 16),
(4, '25', 4, 2015, 11),
(5, 'Scorpion', 5, 2018, 25),
(6, 'Lemonade', 6, 2016, 12),
(7, 'Parachutes', 7, 2000, 10),
(8, '24K Magic', 8, 2016, 9),
(9, 'When We All Fall Asleep', 9, 2019, 14),
(10, 'Laundry Service', 10, 2001, 13);

CREATE TABLE spotify_playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    creation_date DATE,
    total_songs INT
);

select * from spotify_playlists;
truncate table spotify_playlists;
drop table spotify_playlists;

INSERT INTO spotify_playlists VALUES
(1, 1, 'Top Hits', '2025-01-01', 50),
(2, 2, 'Rock Classics', '2025-02-01', 40),
(3, 3, 'Pop Party', '2025-03-01', 45),
(4, 4, 'Jazz Vibes', '2025-04-01', 30),
(5, 5, 'Classical Essentials', '2025-05-01', 25),
(6, 6, 'Hip Hop Beats', '2025-06-01', 35),
(7, 7, 'Indie Mix', '2025-07-01', 20),
(8, 8, 'Blues Soul', '2025-08-01', 15),
(9, 9, 'Electro Dance', '2025-09-01', 60),
(10, 10, 'Reggae Rhythms', '2025-10-01', 22);

CREATE TABLE spotify_songs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(100),
    artist_id INT,
    album_id INT,
    duration_seconds INT
);

select * from spotify_songs;
truncate table spotify_songs;
drop table spotify_songs;

INSERT INTO spotify_songs VALUES
(1, 'Blinding Lights', 1, 1, 200),
(2, 'Shake It Off', 2, 2, 242),
(3, 'Shape of You', 3, 3, 233),
(4, 'Hello', 4, 4, 295),
(5, 'God\'s Plan', 5, 5, 198),
(6, 'Formation', 6, 6, 210),
(7, 'Yellow', 7, 7, 269),
(8, '24K Magic', 8, 8, 230),
(9, 'Bad Guy', 9, 9, 194),
(10, 'Hips Don\'t Lie', 10, 10, 218);

------------------------------------------------------------------------------------------------------------------------------------------

create database Dominos;
use Dominos;
drop database Dominos;

CREATE TABLE dominos_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from dominos_customers;
truncate table dominos_customers;
drop table dominos_customers;

INSERT INTO dominos_customers VALUES
(1, 'John Doe', 'john@example.com', '9876543210', 'New York'),
(2, 'Jane Smith', 'jane@example.com', '9123456780', 'Los Angeles'),
(3, 'Michael Brown', 'michael@example.com', '9988776655', 'Chicago'),
(4, 'Emily Davis', 'emily@example.com', '9876501234', 'Houston'),
(5, 'Chris Wilson', 'chris@example.com', '9123467890', 'Phoenix'),
(6, 'Anna Johnson', 'anna@example.com', '9988112233', 'Philadelphia'),
(7, 'David Lee', 'david@example.com', '9876540987', 'San Antonio'),
(8, 'Sarah Miller', 'sarah@example.com', '9123498765', 'San Diego'),
(9, 'James Garcia', 'james@example.com', '9988770099', 'Dallas'),
(10, 'Laura Martinez', 'laura@example.com', '9876509876', 'San Jose');

CREATE TABLE dominos_pizzas (
    pizza_id INT PRIMARY KEY,
    pizza_name VARCHAR(100),
    size VARCHAR(20),
    price DECIMAL(5,2),
    toppings VARCHAR(255)
);

select * from dominos_pizzas;
truncate table dominos_pizzas;
drop table dominos_pizzas;

INSERT INTO dominos_pizzas VALUES
(1, 'Margherita', 'Medium', 8.99, 'Cheese, Tomato'),
(2, 'Pepperoni', 'Large', 12.99, 'Pepperoni, Cheese'),
(3, 'Veggie', 'Medium', 9.99, 'Onion, Capsicum, Olives'),
(4, 'BBQ Chicken', 'Large', 13.99, 'Chicken, BBQ Sauce'),
(5, 'Cheese Burst', 'Medium', 10.99, 'Extra Cheese'),
(6, 'Farmhouse', 'Large', 14.99, 'Onion, Capsicum, Tomato'),
(7, 'Mexican Green Wave', 'Medium', 11.99, 'Jalapeno, Corn, Capsicum'),
(8, 'Deluxe Veggie', 'Large', 15.99, 'Mushroom, Corn, Capsicum'),
(9, 'Chicken Dominator', 'Large', 16.99, 'Chicken, Pepperoni'),
(10, 'Paneer Makhani', 'Medium', 10.49, 'Paneer, Makhani Sauce');

CREATE TABLE dominos_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(7,2),
    status VARCHAR(20)
);

select * from dominos_orders;
truncate table dominos_orders;
drop table dominos_orders;

INSERT INTO dominos_orders VALUES
(1, 1, '2025-08-01', 15.98, 'Delivered'),
(2, 2, '2025-08-02', 12.99, 'Cancelled'),
(3, 3, '2025-08-03', 9.99, 'Delivered'),
(4, 4, '2025-08-04', 13.99, 'Pending'),
(5, 5, '2025-08-05', 21.98, 'Delivered'),
(6, 6, '2025-08-06', 14.99, 'Delivered'),
(7, 7, '2025-08-07', 16.99, 'Pending'),
(8, 8, '2025-08-08', 10.49, 'Delivered'),
(9, 9, '2025-08-09', 18.99, 'Delivered'),
(10, 10, '2025-08-10', 8.99, 'Cancelled');

CREATE TABLE dominos_order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    pizza_id INT,
    quantity INT,
    price DECIMAL(7,2)
);

select * from dominos_order_items;
truncate table dominos_order_items;
drop table dominos_order_items;

INSERT INTO dominos_order_items VALUES
(1, 1, 1, 1, 8.99),
(2, 1, 5, 1, 6.99),
(3, 2, 2, 1, 12.99),
(4, 3, 3, 1, 9.99),
(5, 4, 4, 1, 13.99),
(6, 5, 6, 1, 14.99),
(7, 5, 7, 1, 6.99),
(8, 6, 6, 1, 14.99),
(9, 7, 9, 1, 16.99),
(10, 8, 10, 1, 10.49);

CREATE TABLE dominos_delivery_personnel (
    personnel_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    status VARCHAR(20)
);

select * from dominos_delivery_personnel;
truncate table dominos_delivery_personnel;
drop table dominos_delivery_personnel;

INSERT INTO dominos_delivery_personnel VALUES
(1, 'Rajesh Kumar', '9876543210', 'New York', 'Active'),
(2, 'Anita Singh', '9123456780', 'Los Angeles', 'Active'),
(3, 'Sunil Patel', '9988776655', 'Chicago', 'Inactive'),
(4, 'Priya Sharma', '9876501234', 'Houston', 'Active'),
(5, 'Vikram Joshi', '9123467890', 'Phoenix', 'Active'),
(6, 'Neha Gupta', '9988112233', 'Philadelphia', 'Active'),
(7, 'Rohan Mehta', '9876540987', 'San Antonio', 'Inactive'),
(8, 'Simran Kaur', '9123498765', 'San Diego', 'Active'),
(9, 'Amit Verma', '9988770099', 'Dallas', 'Active'),
(10, 'Pooja Reddy', '9876509876', 'San Jose', 'Active');

------------------------------------------------------------------------------------------------------------------------------------------

create database Gym;
use Gym;
drop database Gym;

CREATE TABLE gym_members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    membership_type VARCHAR(50)
);

select * from gym_members;
truncate table gym_members;
drop table gym_members;

INSERT INTO gym_members VALUES
(1, 'John Carter', 'john.carter@gmail.com', '9876543210', 'Annual'),
(2, 'Emma Watson', 'emma.watson@gmail.com', '9123456780', 'Monthly'),
(3, 'Michael Johnson', 'michael.j@gmail.com', '9988776655', 'Quarterly'),
(4, 'Sophia Lee', 'sophia.lee@gmail.com', '9876501234', 'Annual'),
(5, 'David Kim', 'david.kim@gmail.com', '9123467890', 'Monthly'),
(6, 'Olivia Brown', 'olivia.brown@gmail.com', '9988112233', 'Quarterly'),
(7, 'James Wilson', 'james.wilson@gmail.com', '9876540987', 'Annual'),
(8, 'Isabella Martinez', 'isabella.m@gmail.com', '9123498765', 'Monthly'),
(9, 'Benjamin Davis', 'benjamin.d@gmail.com', '9988770099', 'Quarterly'),
(10, 'Mia Clark', 'mia.clark@gmail.com', '9876509876', 'Annual');

CREATE TABLE gym_trainers (
    trainer_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    experience_years INT
);

select * from gym_trainers;
truncate table gym_trainers;
drop table gym_trainers;

INSERT INTO gym_trainers VALUES
(1, 'Mark Smith', 'Weight Training', '9876543210', 5),
(2, 'Linda Green', 'Yoga', '9123456780', 7),
(3, 'Kevin Lee', 'Cardio', '9988776655', 6),
(4, 'Anna White', 'CrossFit', '9876501234', 4),
(5, 'James Brown', 'Pilates', '9123467890', 8),
(6, 'Sarah Black', 'Zumba', '9988112233', 3),
(7, 'Tom Wilson', 'Weight Training', '9876540987', 9),
(8, 'Jessica Adams', 'Yoga', '9123498765', 2),
(9, 'Robert Clark', 'Cardio', '9988770099', 7),
(10, 'Laura Scott', 'CrossFit', '9876509876', 5);

CREATE TABLE gym_classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100),
    trainer_id INT,
    schedule VARCHAR(50),
    capacity INT
);

select * from gym_classes;
truncate table gym_classes;
drop table gym_classes;

INSERT INTO gym_classes VALUES
(1, 'Morning Yoga', 2, 'Mon-Wed-Fri 7AM', 20),
(2, 'Evening Cardio', 3, 'Tue-Thu 6PM', 25),
(3, 'CrossFit Basics', 4, 'Mon-Wed-Fri 5PM', 15),
(4, 'Pilates Core', 5, 'Sat 9AM', 10),
(5, 'Zumba Dance', 6, 'Sun 11AM', 30),
(6, 'Weight Lifting', 1, 'Tue-Thu 7AM', 20),
(7, 'Yoga Advanced', 8, 'Mon-Wed 8AM', 15),
(8, 'Cardio Blast', 9, 'Fri 6PM', 25),
(9, 'CrossFit Advanced', 10, 'Sat 5PM', 10),
(10, 'Pilates Stretch', 5, 'Sun 7AM', 12);

CREATE TABLE gym_memberships (
    membership_id INT PRIMARY KEY,
    member_id INT,
    start_date DATE,
    end_date DATE,
    fee DECIMAL(7,2)
);

select * from gym_memberships;
truncate table gym_memberships;
drop table gym_memberships;

INSERT INTO gym_memberships VALUES
(1, 1, '2025-01-01', '2025-12-31', 600.00),
(2, 2, '2025-07-01', '2025-07-31', 60.00),
(3, 3, '2025-04-01', '2025-06-30', 150.00),
(4, 4, '2025-01-01', '2025-12-31', 600.00),
(5, 5, '2025-07-01', '2025-07-31', 60.00),
(6, 6, '2025-04-01', '2025-06-30', 150.00),
(7, 7, '2025-01-01', '2025-12-31', 600.00),
(8, 8, '2025-07-01', '2025-07-31', 60.00),
(9, 9, '2025-04-01', '2025-06-30', 150.00),
(10, 10, '2025-01-01', '2025-12-31', 600.00);

CREATE TABLE gym_attendance (
    attendance_id INT PRIMARY KEY,
    member_id INT,
    class_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);

select * from gym_attendance;
truncate table gym_attendance;
drop table gym_attendance;

INSERT INTO gym_attendance VALUES
(1, 1, 1, '2025-08-01', 'Present'),
(2, 2, 2, '2025-08-02', 'Absent'),
(3, 3, 3, '2025-08-03', 'Present'),
(4, 4, 4, '2025-08-04', 'Present'),
(5, 5, 5, '2025-08-05', 'Absent'),
(6, 6, 6, '2025-08-06', 'Present'),
(7, 7, 7, '2025-08-07', 'Present'),
(8, 8, 8, '2025-08-08', 'Absent'),
(9, 9, 9, '2025-08-09', 'Present'),
(10, 10, 10, '2025-08-10', 'Present');

-------------------------------------------------------------------------------------------------------------------------------------------
create database Viviana_mall;
use Viviana_mall;
drop database Viviana_mall;

CREATE TABLE viviana_stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    category VARCHAR(50),
    floor INT,
    contact_number VARCHAR(15)
);

select * from viviana_stores;
truncate table viviana_stores;
drop table viviana_stores;

INSERT INTO viviana_stores VALUES
(1, 'Zara', 'Fashion', 1, '9876543210'),
(2, 'H&M', 'Fashion', 1, '9123456780'),
(3, 'Samsung', 'Electronics', 2, '9988776655'),
(4, 'The Body Shop', 'Cosmetics', 1, '9876501234'),
(5, 'Nike', 'Sportswear', 2, '9123467890'),
(6, 'Cafe Coffee Day', 'Food & Beverage', 3, '9988112233'),
(7, 'Reliance Digital', 'Electronics', 2, '9876540987'),
(8, 'Pantaloons', 'Fashion', 1, '9123498765'),
(9, 'GameStop', 'Entertainment', 2, '9988770099'),
(10, 'KFC', 'Food & Beverage', 3, '9876509876');

CREATE TABLE viviana_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    visit_date DATE
);

select * from viviana_customers;
truncate table viviana_customers;
drop table viviana_customers;

INSERT INTO viviana_customers VALUES
(1, 'Alice Johnson', 'alice.johnson@gmail.com', '9876543210', '2025-08-01'),
(2, 'Bob Smith', 'bob.smith@gmail.com', '9123456780', '2025-08-02'),
(3, 'Charlie Brown', 'charlie.brown@gmail.com', '9988776655', '2025-08-03'),
(4, 'Diana Prince', 'diana.prince@gmail.com', '9876501234', '2025-08-04'),
(5, 'Evan Davis', 'evan.davis@gmail.com', '9123467890', '2025-08-05'),
(6, 'Fiona Clark', 'fiona.clark@gmail.com', '9988112233', '2025-08-06'),
(7, 'George Miller', 'george.miller@gmail.com', '9876540987', '2025-08-07'),
(8, 'Hannah Lee', 'hannah.lee@gmail.com', '9123498765', '2025-08-08'),
(9, 'Ian Scott', 'ian.scott@gmail.com', '9988770099', '2025-08-09'),
(10, 'Julia Adams', 'julia.adams@gmail.com', '9876509876', '2025-08-10');

CREATE TABLE viviana_events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    location VARCHAR(100),
    organizer VARCHAR(100)
);

select * from viviana_events;
truncate table viviana_events;
drop table viviana_events;

INSERT INTO viviana_events VALUES
(1, 'Fashion Show', '2025-09-01', 'Main Atrium', 'Zara'),
(2, 'Tech Expo', '2025-09-10', 'Hall B', 'Samsung'),
(3, 'Food Festival', '2025-09-15', 'Food Court', 'Cafe Coffee Day'),
(4, 'Music Concert', '2025-09-20', 'Open Ground', 'KFC'),
(5, 'Art Exhibition', '2025-09-25', 'Gallery', 'Pantaloons'),
(6, 'Sports Meet', '2025-10-01', 'Play Area', 'Nike'),
(7, 'Cosmetics Workshop', '2025-10-05', 'Hall A', 'The Body Shop'),
(8, 'Gaming Tournament', '2025-10-10', 'Game Zone', 'GameStop'),
(9, 'Holiday Sale', '2025-12-01', 'All Stores', 'Mall Management'),
(10, 'New Year Party', '2025-12-31', 'Main Atrium', 'Mall Management');

CREATE TABLE viviana_store_staff (
    staff_id INT PRIMARY KEY,
    store_id INT,
    name VARCHAR(100),
    position VARCHAR(50),
    contact_number VARCHAR(15)
);

select * from viviana_store_staff;
truncate table viviana_store_staff;
drop table viviana_store_staff;

INSERT INTO viviana_store_staff VALUES
(1, 1, 'Rachel Green', 'Manager', '9876543210'),
(2, 2, 'Monica Geller', 'Assistant Manager', '9123456780'),
(3, 3, 'Ross Geller', 'Technician', '9988776655'),
(4, 4, 'Phoebe Buffay', 'Sales Associate', '9876501234'),
(5, 5, 'Joey Tribbiani', 'Sales Associate', '9123467890'),
(6, 6, 'Chandler Bing', 'Barista', '9988112233'),
(7, 7, 'Janice Litman', 'Sales Manager', '9876540987'),
(8, 8, 'Gunther Centralperk', 'Cashier', '9123498765'),
(9, 9, 'Mike Hannigan', 'Game Expert', '9988770099'),
(10, 10, 'Carol Willick', 'Chef', '9876509876');

CREATE TABLE viviana_feedback (
    feedback_id INT PRIMARY KEY,
    customer_id INT,
    store_id INT,
    rating INT,
    comments VARCHAR(255)
);

select * from viviana_feedback;
truncate table viviana_feedback;
drop table viviana_feedback;

INSERT INTO viviana_feedback VALUES
(1, 1, 1, 5, 'Excellent service!'),
(2, 2, 2, 4, 'Good variety of products.'),
(3, 3, 3, 3, 'Average experience.'),
(4, 4, 4, 5, 'Loved the staff friendliness.'),
(5, 5, 5, 4, 'Nice ambience.'),
(6, 6, 6, 5, 'Great coffee!'),
(7, 7, 7, 4, 'Helpful sales team.'),
(8, 8, 8, 3, 'Could improve product range.'),
(9, 9, 9, 5, 'Fantastic gaming setup.'),
(10, 10, 10, 4, 'Good food quality.');

-------------------------------------------------------------------------------------------------------------------------------------------

create database book_my_show;
use book_my_show;
drop database booky_my_show;

CREATE TABLE bms_users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from bms_users;
truncate table bms_users;
drop table bms_users;

INSERT INTO bms_users VALUES
(1, 'Aarav Mehta', 'aarav@gmail.com', '9876543210', 'Mumbai'),
(2, 'Isha Roy', 'isha@gmail.com', '9123456780', 'Delhi'),
(3, 'Kabir Khan', 'kabir@gmail.com', '9988776655', 'Bangalore'),
(4, 'Tanya Verma', 'tanya@gmail.com', '9876501234', 'Chennai'),
(5, 'Rohit Sharma', 'rohit@gmail.com', '9123467890', 'Hyderabad'),
(6, 'Neha Singh', 'neha@gmail.com', '9988112233', 'Pune'),
(7, 'Anjali Das', 'anjali@gmail.com', '9876540987', 'Kolkata'),
(8, 'Sameer Joshi', 'sameer@gmail.com', '9123498765', 'Ahmedabad'),
(9, 'Divya Nair', 'divya@gmail.com', '9988770099', 'Jaipur'),
(10, 'Yash Patel', 'yash@gmail.com', '9876509876', 'Lucknow');

CREATE TABLE bms_movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    language VARCHAR(50),
    genre VARCHAR(50),
    duration_minutes INT
);

select * from bms_movies;
truncate table bms_movies;
drop table bms_movies;

INSERT INTO bms_movies VALUES
(1, 'Jawan', 'Hindi', 'Action', 165),
(2, 'Oppenheimer', 'English', 'Drama', 180),
(3, 'RRR', 'Telugu', 'Historical', 175),
(4, 'Leo', 'Tamil', 'Thriller', 160),
(5, 'Brahmastra', 'Hindi', 'Fantasy', 150),
(6, 'Top Gun: Maverick', 'English', 'Action', 131),
(7, 'KGF 2', 'Kannada', 'Action', 168),
(8, 'Pushpa', 'Telugu', 'Drama', 179),
(9, 'The Batman', 'English', 'Superhero', 176),
(10, '3 Idiots', 'Hindi', 'Comedy', 171);

CREATE TABLE bms_theatres (
    theatre_id INT PRIMARY KEY,
    theatre_name VARCHAR(100),
    location VARCHAR(100),
    total_seats INT,
    screen_count INT
);

select * from bms_theatres;
truncate table bms_theatres;
drop table bms_theatres;

INSERT INTO bms_theatres VALUES
(1, 'PVR Icon', 'Mumbai', 200, 4),
(2, 'INOX', 'Delhi', 180, 3),
(3, 'Cinepolis', 'Bangalore', 220, 5),
(4, 'Sathyam Cinemas', 'Chennai', 150, 2),
(5, 'Asian Radhika', 'Hyderabad', 250, 6),
(6, 'City Pride', 'Pune', 160, 3),
(7, 'Carnival', 'Kolkata', 170, 4),
(8, 'Mukta A2', 'Ahmedabad', 140, 2),
(9, 'Raj Mandir', 'Jaipur', 300, 1),
(10, 'Wave Cinemas', 'Lucknow', 190, 3);

CREATE TABLE bms_showtimes (
    showtime_id INT PRIMARY KEY,
    movie_id INT,
    theatre_id INT,
    show_date DATE,
    show_time TIME
);

select * from bms_showtimes;
truncate table bms_showtimes;
drop table bms_showtimes;

INSERT INTO bms_showtimes VALUES
(1, 1, 1, '2025-08-15', '18:00:00'),
(2, 2, 2, '2025-08-15', '21:00:00'),
(3, 3, 3, '2025-08-15', '19:00:00'),
(4, 4, 4, '2025-08-15', '20:00:00'),
(5, 5, 5, '2025-08-15', '17:30:00'),
(6, 6, 6, '2025-08-15', '16:00:00'),
(7, 7, 7, '2025-08-15', '20:30:00'),
(8, 8, 8, '2025-08-15', '18:15:00'),
(9, 9, 9, '2025-08-15', '21:45:00'),
(10, 10, 10, '2025-08-15', '19:45:00');

CREATE TABLE bms_bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    showtime_id INT,
    booking_date DATE,
    seats_booked INT
);

select * from bms_bookings;
truncate table bms_bookings;
drop table bms_bookings;

INSERT INTO bms_bookings VALUES
(1, 1, 1, '2025-08-10', 2),
(2, 2, 2, '2025-08-11', 3),
(3, 3, 3, '2025-08-11', 1),
(4, 4, 4, '2025-08-12', 4),
(5, 5, 5, '2025-08-12', 2),
(6, 6, 6, '2025-08-13', 1),
(7, 7, 7, '2025-08-13', 3),
(8, 8, 8, '2025-08-14', 2),
(9, 9, 9, '2025-08-14', 5),
(10, 10, 10, '2025-08-14', 2);

------------------------------------------------------------------------------------------------------------------------------------------

create database Swiggy;
use Swiggy;
drop database Swiggy;

CREATE TABLE swiggy_users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from swiggy_users;
truncate table swiggy_users;
drop table swiggy_users;

INSERT INTO swiggy_users VALUES
(1, 'Ankit Sharma', 'ankit@gmail.com', '9876543210', 'Mumbai'),
(2, 'Priya Rao', 'priya@gmail.com', '9123456780', 'Delhi'),
(3, 'Ravi Verma', 'ravi@gmail.com', '9988776655', 'Bangalore'),
(4, 'Sneha Nair', 'sneha@gmail.com', '9876501234', 'Chennai'),
(5, 'Vikram Joshi', 'vikram@gmail.com', '9123467890', 'Hyderabad'),
(6, 'Meera Kapoor', 'meera@gmail.com', '9988112233', 'Pune'),
(7, 'Aditya Jain', 'aditya@gmail.com', '9876540987', 'Kolkata'),
(8, 'Kritika Singh', 'kritika@gmail.com', '9123498765', 'Ahmedabad'),
(9, 'Raj Malhotra', 'raj@gmail.com', '9988770099', 'Jaipur'),
(10, 'Neelam Mehta', 'neelam@gmail.com', '9876509876', 'Lucknow');

CREATE TABLE swiggy_restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    cuisine VARCHAR(50),
    rating DECIMAL(3,1)
);

select * from swiggy_restaurants;
truncate table swiggy_restaurants;
drop table swiggy_restaurants;

INSERT INTO swiggy_restaurants VALUES
(1, 'Biryani House', 'Mumbai', 'Indian', 4.5),
(2, 'Pizza Hub', 'Delhi', 'Italian', 4.2),
(3, 'Tandoori Flames', 'Bangalore', 'North Indian', 4.6),
(4, 'Wok Express', 'Chennai', 'Chinese', 4.3),
(5, 'Curry Point', 'Hyderabad', 'South Indian', 4.1),
(6, 'Burger Cave', 'Pune', 'American', 4.0),
(7, 'Noodle King', 'Kolkata', 'Asian', 3.9),
(8, 'Dosa Zone', 'Ahmedabad', 'South Indian', 4.4),
(9, 'Grill & Wraps', 'Jaipur', 'Middle Eastern', 4.3),
(10, 'Taco Town', 'Lucknow', 'Mexican', 4.2);

CREATE TABLE swiggy_menu (
    item_id INT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    price DECIMAL(5,2),
    category VARCHAR(50)
);

select * from swiggy_menu;
truncate table swiggy_menu;
drop table swiggy_menu;

INSERT INTO swiggy_menu VALUES
(1, 1, 'Chicken Biryani', 250.00, 'Main Course'),
(2, 2, 'Margherita Pizza', 199.00, 'Pizza'),
(3, 3, 'Butter Chicken', 220.00, 'Main Course'),
(4, 4, 'Veg Noodles', 150.00, 'Chinese'),
(5, 5, 'Masala Dosa', 120.00, 'Breakfast'),
(6, 6, 'Chicken Burger', 180.00, 'Fast Food'),
(7, 7, 'Hakka Noodles', 160.00, 'Chinese'),
(8, 8, 'Onion Dosa', 130.00, 'Breakfast'),
(9, 9, 'Grilled Chicken Wrap', 200.00, 'Fast Food'),
(10, 10, 'Taco Supreme', 175.00, 'Mexican');

CREATE TABLE swiggy_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    order_date DATE,
    total_amount DECIMAL(6,2)
);

select * from swiggy_orders;
truncate table swiggy_orders;
drop table swiggy_orders;

INSERT INTO swiggy_orders VALUES
(1, 1, 1, '2025-08-10', 500.00),
(2, 2, 2, '2025-08-11', 199.00),
(3, 3, 3, '2025-08-12', 440.00),
(4, 4, 4, '2025-08-12', 300.00),
(5, 5, 5, '2025-08-13', 240.00),
(6, 6, 6, '2025-08-13', 360.00),
(7, 7, 7, '2025-08-13', 160.00),
(8, 8, 8, '2025-08-14', 260.00),
(9, 9, 9, '2025-08-14', 200.00),
(10, 10, 10, '2025-08-14', 175.00);

CREATE TABLE swiggy_delivery (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    delivery_partner_name VARCHAR(100),
    delivery_time_minutes INT,
    status VARCHAR(20)
);

select * from swiggy_delivery;
truncate table swiggy_delivery;
drop table swiggy_delivery;

INSERT INTO swiggy_delivery VALUES
(1, 1, 'Arjun Kumar', 30, 'Delivered'),
(2, 2, 'Suman Das', 25, 'Delivered'),
(3, 3, 'Ravi Reddy', 40, 'Delivered'),
(4, 4, 'Nikhil Sharma', 35, 'Cancelled'),
(5, 5, 'Ramesh Gupta', 28, 'Delivered'),
(6, 6, 'Amit Sen', 32, 'Delivered'),
(7, 7, 'Deepak Yadav', 20, 'Delivered'),
(8, 8, 'Sandeep Singh', 22, 'Delivered'),
(9, 9, 'Karan Mehra', 26, 'Pending'),
(10, 10, 'Harish Nair', 24, 'Delivered');

------------------------------------------------------------------------------------------------------------------------------------------

create database car_rental_service;
use car_rental_service;
drop database car_rental_service;

CREATE TABLE rental_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from rental_customers;
truncate table rental_customers;
drop table rental_customers;

INSERT INTO rental_customers VALUES
(1, 'Rajiv Sharma', 'rajiv@gmail.com', '9876543210', 'Delhi'),
(2, 'Anjali Rao', 'anjali@gmail.com', '9123456780', 'Mumbai'),
(3, 'Sandeep Kumar', 'sandeep@gmail.com', '9988776655', 'Bangalore'),
(4, 'Neha Joshi', 'neha@gmail.com', '9876501234', 'Hyderabad'),
(5, 'Arjun Verma', 'arjun@gmail.com', '9123467890', 'Pune'),
(6, 'Megha Shah', 'megha@gmail.com', '9988112233', 'Chennai'),
(7, 'Karan Singh', 'karan@gmail.com', '9876540987', 'Kolkata'),
(8, 'Divya Kapoor', 'divya@gmail.com', '9123498765', 'Ahmedabad'),
(9, 'Rohan Malhotra', 'rohan@gmail.com', '9988770099', 'Jaipur'),
(10, 'Isha Mehta', 'isha@gmail.com', '9876509876', 'Lucknow');

CREATE TABLE rental_cars (
    car_id INT PRIMARY KEY,
    model VARCHAR(100),
    brand VARCHAR(50),
    year INT,
    rental_price_per_day DECIMAL(6,2)
);

select * from rental_cars;
truncate table rental_cars;
drop table rental_cars;

INSERT INTO rental_cars VALUES
(1, 'Swift', 'Maruti', 2022, 1500.00),
(2, 'City', 'Honda', 2021, 2500.00),
(3, 'Innova Crysta', 'Toyota', 2023, 3500.00),
(4, 'Verna', 'Hyundai', 2020, 2200.00),
(5, 'XUV500', 'Mahindra', 2021, 3000.00),
(6, 'Fortuner', 'Toyota', 2023, 4500.00),
(7, 'Baleno', 'Maruti', 2022, 1600.00),
(8, 'Venue', 'Hyundai', 2021, 2100.00),
(9, 'EcoSport', 'Ford', 2020, 2000.00),
(10, 'Ciaz', 'Maruti', 2019, 1800.00);

CREATE TABLE rental_bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    car_id INT,
    booking_date DATE,
    rental_days INT
);

select * from rental_bookings;
truncate table rental_bookings;
drop table rental_bookings;

INSERT INTO rental_bookings VALUES
(1, 1, 1, '2025-08-10', 3),
(2, 2, 2, '2025-08-11', 2),
(3, 3, 3, '2025-08-11', 5),
(4, 4, 4, '2025-08-12', 1),
(5, 5, 5, '2025-08-12', 2),
(6, 6, 6, '2025-08-13', 4),
(7, 7, 7, '2025-08-13', 2),
(8, 8, 8, '2025-08-14', 3),
(9, 9, 9, '2025-08-14', 1),
(10, 10, 10, '2025-08-14', 2);

CREATE TABLE rental_drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    license_number VARCHAR(20),
    experience_years INT
);

select * from rental_drivers;
truncate table rental_drivers;
drop table rental_drivers;

INSERT INTO rental_drivers VALUES
(1, 'Amit Kumar', '9876543210', 'DL12345', 5),
(2, 'Suresh Mehta', '9123456780', 'DL23456', 8),
(3, 'Naresh Gupta', '9988776655', 'DL34567', 6),
(4, 'Vinod Yadav', '9876501234', 'DL45678', 4),
(5, 'Ramesh Sharma', '9123467890', 'DL56789', 10),
(6, 'Ravi Verma', '9988112233', 'DL67890', 3),
(7, 'Ashok Singh', '9876540987', 'DL78901', 7),
(8, 'Manoj Joshi', '9123498765', 'DL89012', 2),
(9, 'Pradeep Rao', '9988770099', 'DL90123', 9),
(10, 'Sanjay Patel', '9876509876', 'DL01234', 6);

CREATE TABLE rental_payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount_paid DECIMAL(8,2),
    payment_date DATE,
    payment_method VARCHAR(20)
);

select * from rental_payments;
truncate table rental_payments;
drop table rental_payments;

INSERT INTO rental_payments VALUES
(1, 1, 4500.00, '2025-08-10', 'UPI'),
(2, 2, 5000.00, '2025-08-11', 'Card'),
(3, 3, 17500.00, '2025-08-11', 'Cash'),
(4, 4, 2200.00, '2025-08-12', 'UPI'),
(5, 5, 6000.00, '2025-08-12', 'Card'),
(6, 6, 18000.00, '2025-08-13', 'Cash'),
(7, 7, 3200.00, '2025-08-13', 'UPI'),
(8, 8, 6300.00, '2025-08-14', 'Card'),
(9, 9, 2000.00, '2025-08-14', 'Cash'),
(10, 10, 3600.00, '2025-08-14', 'UPI');

------------------------------------------------------------------------------------------------------------------------------------------

create database Google_drive;
use Google_drive;
drop database Google_drive;

CREATE TABLE gd_users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    signup_date DATE
);

select * from gd_users;
truncate table gd_users;
drop table gd_users;

INSERT INTO gd_users VALUES
(1, 'Arjun Mehta', 'arjun@gmail.com', '9876543210', '2024-01-01'),
(2, 'Sneha Roy', 'sneha@gmail.com', '9123456780', '2024-03-15'),
(3, 'Ravi Kapoor', 'ravi@gmail.com', '9988776655', '2024-02-10'),
(4, 'Divya Nair', 'divya@gmail.com', '9876501234', '2024-05-05'),
(5, 'Vikram Singh', 'vikram@gmail.com', '9123467890', '2024-06-12'),
(6, 'Meera Das', 'meera@gmail.com', '9988112233', '2024-01-28'),
(7, 'Karan Shah', 'karan@gmail.com', '9876540987', '2024-04-20'),
(8, 'Neha Verma', 'neha@gmail.com', '9123498765', '2024-02-25'),
(9, 'Rahul Jain', 'rahul@gmail.com', '9988770099', '2024-06-01'),
(10, 'Pooja Reddy', 'pooja@gmail.com', '9876509876', '2024-03-30');

CREATE TABLE gd_files (
    file_id INT PRIMARY KEY,
    user_id INT,
    file_name VARCHAR(255),
    file_type VARCHAR(50),
    upload_date DATE
);

select * from gd_files;
truncate table gd_files;
drop table gd_files;

INSERT INTO gd_files VALUES
(1, 1, 'resume.pdf', 'PDF', '2024-01-10'),
(2, 2, 'vacation.jpg', 'Image', '2024-03-20'),
(3, 3, 'report.docx', 'Document', '2024-02-15'),
(4, 4, 'project.zip', 'Archive', '2024-05-07'),
(5, 5, 'notes.txt', 'Text', '2024-06-14'),
(6, 6, 'design.psd', 'Image', '2024-02-01'),
(7, 7, 'invoice.xlsx', 'Spreadsheet', '2024-04-23'),
(8, 8, 'video.mp4', 'Video', '2024-03-01'),
(9, 9, 'ebook.epub', 'Ebook', '2024-06-05'),
(10, 10, 'presentation.pptx', 'Presentation', '2024-04-01');

CREATE TABLE gd_shared_files (
    share_id INT PRIMARY KEY,
    file_id INT,
    shared_with_email VARCHAR(100),
    permission VARCHAR(20),
    shared_date DATE
);

select * from gd_shared_files;
truncate table gd_shared_files;
drop table gd_shared_files;

INSERT INTO gd_shared_files VALUES
(1, 1, 'friend1@gmail.com', 'viewer', '2024-01-15'),
(2, 2, 'colleague1@gmail.com', 'editor', '2024-03-22'),
(3, 3, 'teamlead@gmail.com', 'viewer', '2024-02-16'),
(4, 4, 'manager@gmail.com', 'editor', '2024-05-08'),
(5, 5, 'student1@gmail.com', 'viewer', '2024-06-15'),
(6, 6, 'client1@gmail.com', 'editor', '2024-02-03'),
(7, 7, 'boss@gmail.com', 'viewer', '2024-04-25'),
(8, 8, 'group@gmail.com', 'editor', '2024-03-02'),
(9, 9, 'professor@gmail.com', 'viewer', '2024-06-07'),
(10, 10, 'partner@gmail.com', 'editor', '2024-04-03');

CREATE TABLE gd_folders (
    folder_id INT PRIMARY KEY,
    user_id INT,
    folder_name VARCHAR(100),
    created_date DATE,
    total_files INT
);

select * from gd_folders;
truncate table gd_folders;
drop table gd_folders;

INSERT INTO gd_folders VALUES
(1, 1, 'Work', '2024-01-10', 5),
(2, 2, 'Travel Pics', '2024-03-18', 20),
(3, 3, 'Reports', '2024-02-14', 10),
(4, 4, 'Projects', '2024-05-06', 7),
(5, 5, 'Study Material', '2024-06-13', 12),
(6, 6, 'Designs', '2024-01-30', 8),
(7, 7, 'Invoices', '2024-04-22', 15),
(8, 8, 'Videos', '2024-02-28', 6),
(9, 9, 'Books', '2024-06-04', 9),
(10, 10, 'Presentations', '2024-03-29', 4);

CREATE TABLE gd_storage (
    storage_id INT PRIMARY KEY,
    user_id INT,
    used_space_gb DECIMAL(5,2),
    total_space_gb INT,
    last_updated DATE
);

select * from gd_storage;
truncate table gd_storage;
drop table gd_storage;

INSERT INTO gd_storage VALUES
(1, 1, 5.25, 15, '2024-08-01'),
(2, 2, 12.10, 15, '2024-08-01'),
(3, 3, 8.50, 15, '2024-08-01'),
(4, 4, 10.00, 15, '2024-08-01'),
(5, 5, 4.75, 15, '2024-08-01'),
(6, 6, 9.30, 15, '2024-08-01'),
(7, 7, 7.60, 15, '2024-08-01'),
(8, 8, 6.80, 15, '2024-08-01'),
(9, 9, 3.95, 15, '2024-08-01'),
(10, 10, 11.25, 15, '2024-08-01');

-------------------------------------------------------------------------------------------------------------------------------------------

create database TCS;
use TCS;
drop database TCS;

CREATE TABLE tcs_employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    department VARCHAR(50)
);

select * from tcs_employees;
truncate table tcs_employees;
drop table tcs_employees;

INSERT INTO tcs_employees VALUES
(1, 'Amit Verma', 'amit.verma@tcs.com', '9876543210', 'IT'),
(2, 'Sneha Joshi', 'sneha.joshi@tcs.com', '9123456780', 'HR'),
(3, 'Ravi Kumar', 'ravi.kumar@tcs.com', '9988776655', 'Finance'),
(4, 'Neha Shah', 'neha.shah@tcs.com', '9876501234', 'IT'),
(5, 'Arjun Rao', 'arjun.rao@tcs.com', '9123467890', 'Admin'),
(6, 'Meera Kapoor', 'meera.kapoor@tcs.com', '9988112233', 'Finance'),
(7, 'Karan Singh', 'karan.singh@tcs.com', '9876540987', 'IT'),
(8, 'Divya Patel', 'divya.patel@tcs.com', '9123498765', 'HR'),
(9, 'Rohan Nair', 'rohan.nair@tcs.com', '9988770099', 'IT'),
(10, 'Pooja Iyer', 'pooja.iyer@tcs.com', '9876509876', 'Marketing');

CREATE TABLE tcs_projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department VARCHAR(50),
    start_date DATE,
    status VARCHAR(20)
);

select * from tcs_projects;
truncate table tcs_projects;
drop table tcs_projects;

INSERT INTO tcs_projects VALUES
(1, 'ERP Implementation', 'IT', '2024-01-01', 'Ongoing'),
(2, 'Employee Onboarding', 'HR', '2024-02-01', 'Completed'),
(3, 'Payroll Automation', 'Finance', '2024-03-01', 'Ongoing'),
(4, 'Network Upgrade', 'IT', '2024-04-01', 'Pending'),
(5, 'Office Relocation', 'Admin', '2024-05-01', 'Ongoing'),
(6, 'Audit Compliance', 'Finance', '2024-06-01', 'Completed'),
(7, 'Cloud Migration', 'IT', '2024-07-01', 'Ongoing'),
(8, 'HRMS Integration', 'HR', '2024-08-01', 'Planned'),
(9, 'Security Audit', 'IT', '2024-09-01', 'Planned'),
(10, 'Brand Campaign', 'Marketing', '2024-10-01', 'Planned');

CREATE TABLE tcs_attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    date DATE,
    status VARCHAR(10),
    location VARCHAR(50)
);

select * from tcs_attendance;
truncate table tcs_attendance;
drop table tcs_attendance;

INSERT INTO tcs_attendance VALUES
(1, 1, '2025-08-01', 'Present', 'Mumbai'),
(2, 2, '2025-08-01', 'Present', 'Mumbai'),
(3, 3, '2025-08-01', 'Absent', 'Bangalore'),
(4, 4, '2025-08-01', 'Present', 'Chennai'),
(5, 5, '2025-08-01', 'Present', 'Hyderabad'),
(6, 6, '2025-08-01', 'Present', 'Pune'),
(7, 7, '2025-08-01', 'Present', 'Delhi'),
(8, 8, '2025-08-01', 'Present', 'Ahmedabad'),
(9, 9, '2025-08-01', 'Present', 'Mumbai'),
(10, 10, '2025-08-01', 'Absent', 'Kolkata');

CREATE TABLE tcs_trainings (
    training_id INT PRIMARY KEY,
    topic VARCHAR(100),
    department VARCHAR(50),
    trainer_name VARCHAR(100),
    training_date DATE
);

select * from tcs_trainings;
truncate table tcs_trainings;
drop table tcs_trainings;

INSERT INTO tcs_trainings VALUES
(1, 'Java Basics', 'IT', 'Rahul Mehta', '2025-07-01'),
(2, 'Leadership Skills', 'HR', 'Priya Singh', '2025-07-05'),
(3, 'Finance for Managers', 'Finance', 'Amit Khanna', '2025-07-10'),
(4, 'Cloud Fundamentals', 'IT', 'Suresh Menon', '2025-07-15'),
(5, 'Office Safety', 'Admin', 'Rajeev Yadav', '2025-07-20'),
(6, 'Tax Compliance', 'Finance', 'Alka Sharma', '2025-07-25'),
(7, 'Data Security', 'IT', 'Anil Kumar', '2025-07-28'),
(8, 'Communication Skills', 'HR', 'Divya Jain', '2025-07-30'),
(9, 'Agile Methodology', 'IT', 'Preeti Rana', '2025-08-01'),
(10, 'Digital Marketing', 'Marketing', 'Nitin Goel', '2025-08-03');

CREATE TABLE tcs_assets (
    asset_id INT PRIMARY KEY,
    employee_id INT,
    asset_type VARCHAR(50),
    issued_date DATE,
    return_date DATE
);

select * from tcs_assets;
truncate table tcs_assets;
drop table tcs_assets;

INSERT INTO tcs_assets VALUES
(1, 1, 'Laptop', '2024-01-01', NULL),
(2, 2, 'Headset', '2024-01-10', NULL),
(3, 3, 'Laptop', '2024-01-15', NULL),
(4, 4, 'Keyboard', '2024-01-20', '2025-01-20'),
(5, 5, 'Laptop', '2024-02-01', NULL),
(6, 6, 'Monitor', '2024-02-15', NULL),
(7, 7, 'Laptop', '2024-03-01', NULL),
(8, 8, 'Mouse', '2024-03-10', '2025-03-10'),
(9, 9, 'Laptop', '2024-04-01', NULL),
(10, 10, 'Tablet', '2024-05-01', NULL);

-------------------------------------------------------------------------------------------------------------------------------------------

create database Job_portal;
use Job_portal;
drop database Job_portal;

CREATE TABLE jp_users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    location VARCHAR(50)
);

select * from jp_users;
truncate table jp_users;
drop table jp_users;

INSERT INTO jp_users VALUES
(1, 'Aman Gupta', 'aman@gmail.com', '9876543210', 'Delhi'),
(2, 'Pooja Sharma', 'pooja@gmail.com', '9123456780', 'Mumbai'),
(3, 'Ravi Menon', 'ravi@gmail.com', '9988776655', 'Bangalore'),
(4, 'Neha Agarwal', 'neha@gmail.com', '9876501234', 'Hyderabad'),
(5, 'Vikram Singh', 'vikram@gmail.com', '9123467890', 'Pune'),
(6, 'Meera Iyer', 'meera@gmail.com', '9988112233', 'Chennai'),
(7, 'Kunal Jain', 'kunal@gmail.com', '9876540987', 'Kolkata'),
(8, 'Divya Nair', 'divya@gmail.com', '9123498765', 'Ahmedabad'),
(9, 'Rohan Malhotra', 'rohan@gmail.com', '9988770099', 'Jaipur'),
(10, 'Isha Desai', 'isha@gmail.com', '9876509876', 'Lucknow');

CREATE TABLE jp_companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    industry VARCHAR(50),
    city VARCHAR(50),
    size INT
);

select * from jp_companies;
truncate table jp_companies;
drop table jp_companies;

INSERT INTO jp_companies VALUES
(1, 'Infosys', 'IT', 'Bangalore', 25000),
(2, 'Amazon', 'E-Commerce', 'Hyderabad', 50000),
(3, 'TCS', 'IT', 'Mumbai', 40000),
(4, 'HDFC Bank', 'Finance', 'Delhi', 30000),
(5, 'Zomato', 'FoodTech', 'Gurgaon', 8000),
(6, 'L&T', 'Engineering', 'Chennai', 12000),
(7, 'Cognizant', 'IT', 'Pune', 35000),
(8, 'Byju\'s', 'EdTech', 'Bangalore', 7000),
(9, 'Reliance', 'Conglomerate', 'Mumbai', 60000),
(10, 'Flipkart', 'E-Commerce', 'Bangalore', 10000);

CREATE TABLE jp_jobs (
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title VARCHAR(100),
    location VARCHAR(50),
    salary INT
);

select * from jp_jobs;
truncate table jp_jobs;
drop table jp_jobs;

INSERT INTO jp_jobs VALUES
(1, 1, 'Software Engineer', 'Bangalore', 800000),
(2, 2, 'Data Analyst', 'Hyderabad', 700000),
(3, 3, 'Project Manager', 'Mumbai', 1200000),
(4, 4, 'Finance Executive', 'Delhi', 600000),
(5, 5, 'UI/UX Designer', 'Gurgaon', 750000),
(6, 6, 'Mechanical Engineer', 'Chennai', 680000),
(7, 7, 'QA Tester', 'Pune', 550000),
(8, 8, 'Content Developer', 'Bangalore', 500000),
(9, 9, 'HR Manager', 'Mumbai', 900000),
(10, 10, 'Business Analyst', 'Bangalore', 850000);

CREATE TABLE jp_applications (
    application_id INT PRIMARY KEY,
    user_id INT,
    job_id INT,
    apply_date DATE,
    status VARCHAR(20)
);

select * from jp_applications;
truncate table jp_applications;
drop table jp_applications;

INSERT INTO jp_applications VALUES
(1, 1, 1, '2025-08-01', 'Pending'),
(2, 2, 2, '2025-08-02', 'Reviewed'),
(3, 3, 3, '2025-08-02', 'Shortlisted'),
(4, 4, 4, '2025-08-03', 'Rejected'),
(5, 5, 5, '2025-08-03', 'Pending'),
(6, 6, 6, '2025-08-04', 'Reviewed'),
(7, 7, 7, '2025-08-04', 'Shortlisted'),
(8, 8, 8, '2025-08-05', 'Pending'),
(9, 9, 9, '2025-08-06', 'Pending'),
(10, 10, 10, '2025-08-06', 'Rejected');

CREATE TABLE jp_skills (
    skill_id INT PRIMARY KEY,
    user_id INT,
    skill_name VARCHAR(50),
    proficiency_level VARCHAR(20),
    years_experience INT
);

select * from jp_skills;
truncate table jp_skills;
drop table jp_skills;

INSERT INTO jp_skills VALUES
(1, 1, 'Java', 'Advanced', 3),
(2, 2, 'Python', 'Intermediate', 2),
(3, 3, 'Project Management', 'Expert', 5),
(4, 4, 'Finance', 'Advanced', 4),
(5, 5, 'Figma', 'Intermediate', 2),
(6, 6, 'AutoCAD', 'Advanced', 3),
(7, 7, 'Testing', 'Intermediate', 2),
(8, 8, 'Writing', 'Expert', 4),
(9, 9, 'Recruitment', 'Advanced', 3),
(10, 10, 'Excel', 'Expert', 5);

------------------------------------------------------------------------------------------------------------------------------------------

create database PharmEasy;
use PharmEasy;
drop database PharmEasy;

CREATE TABLE pe_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from pe_customers;
truncate table pe_customers;
drop table pe_customers;

INSERT INTO pe_customers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', '9876543210', 'Mumbai'),
(2, 'Sneha Rao', 'sneha@gmail.com', '9123456780', 'Delhi'),
(3, 'Ravi Verma', 'ravi@gmail.com', '9988776655', 'Bangalore'),
(4, 'Megha Nair', 'megha@gmail.com', '9876501234', 'Chennai'),
(5, 'Vikram Joshi', 'vikram@gmail.com', '9123467890', 'Hyderabad'),
(6, 'Divya Kapoor', 'divya@gmail.com', '9988112233', 'Pune'),
(7, 'Karan Jain', 'karan@gmail.com', '9876540987', 'Kolkata'),
(8, 'Priya Singh', 'priya@gmail.com', '9123498765', 'Ahmedabad'),
(9, 'Rohan Mehta', 'rohan@gmail.com', '9988770099', 'Jaipur'),
(10, 'Neha Malhotra', 'neha@gmail.com', '9876509876', 'Lucknow');

CREATE TABLE pe_medicines (
    medicine_id INT PRIMARY KEY,
    name VARCHAR(100),
    brand VARCHAR(50),
    price DECIMAL(6,2),
    stock_quantity INT
);

select * from pe_medicines;
truncate table pe_medicines;
drop table pe_medicines;

INSERT INTO pe_medicines VALUES
(1, 'Paracetamol 500mg', 'Cipla', 20.00, 500),
(2, 'Amoxicillin 250mg', 'Sun Pharma', 45.00, 300),
(3, 'Aspirin 100mg', 'Pfizer', 30.00, 400),
(4, 'Cetrizine 10mg', 'Zydus', 15.00, 200),
(5, 'Dolo 650', 'Micro Labs', 25.00, 350),
(6, 'Azithromycin 500mg', 'Alkem', 60.00, 250),
(7, 'Vitamin C 500mg', 'Abbott', 40.00, 100),
(8, 'Ibuprofen 200mg', 'Dr Reddy\'s', 35.00, 600),
(9, 'Pantoprazole 40mg', 'Cipla', 50.00, 150),
(10, 'Multivitamin Tablets', 'Himalaya', 55.00, 300);

CREATE TABLE pe_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(8,2),
    status VARCHAR(20)
);

select * from pe_orders;
truncate table pe_orders;
drop table pe_orders;

INSERT INTO pe_orders VALUES
(1, 1, '2025-08-01', 100.00, 'Delivered'),
(2, 2, '2025-08-02', 90.00, 'Pending'),
(3, 3, '2025-08-03', 150.00, 'Cancelled'),
(4, 4, '2025-08-04', 200.00, 'Delivered'),
(5, 5, '2025-08-04', 175.00, 'Delivered'),
(6, 6, '2025-08-05', 250.00, 'Delivered'),
(7, 7, '2025-08-05', 80.00, 'Pending'),
(8, 8, '2025-08-06', 300.00, 'Delivered'),
(9, 9, '2025-08-06', 60.00, 'Delivered'),
(10, 10, '2025-08-06', 120.00, 'Cancelled');

CREATE TABLE pe_order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    medicine_id INT,
    quantity INT,
    item_price DECIMAL(6,2)
);

select * from pe_order_items;
truncate table pe_order_items;
drop table pe_order_items;

INSERT INTO pe_order_items VALUES
(1, 1, 1, 2, 40.00),
(2, 1, 4, 2, 30.00),
(3, 2, 5, 3, 75.00),
(4, 3, 2, 2, 90.00),
(5, 4, 6, 2, 120.00),
(6, 5, 3, 3, 90.00),
(7, 6, 10, 4, 220.00),
(8, 7, 8, 2, 70.00),
(9, 8, 7, 5, 200.00),
(10, 9, 9, 1, 50.00);

CREATE TABLE pe_prescriptions (
    prescription_id INT PRIMARY KEY,
    customer_id INT,
    doctor_name VARCHAR(100),
    upload_date DATE,
    approved BOOLEAN
);

select * from pe_prescriptions;
truncate table pe_prescriptions;
drop table pe_prescriptions;

INSERT INTO pe_prescriptions VALUES
(1, 1, 'Dr. Sharma', '2025-07-30', TRUE),
(2, 2, 'Dr. Rao', '2025-07-31', FALSE),
(3, 3, 'Dr. Mehta', '2025-07-31', TRUE),
(4, 4, 'Dr. Iyer', '2025-08-01', TRUE),
(5, 5, 'Dr. Singh', '2025-08-02', TRUE),
(6, 6, 'Dr. Kapoor', '2025-08-02', FALSE),
(7, 7, 'Dr. Verma', '2025-08-03', TRUE),
(8, 8, 'Dr. Das', '2025-08-03', TRUE),
(9, 9, 'Dr. Roy', '2025-08-04', TRUE),
(10, 10, 'Dr. Malhotra', '2025-08-04', FALSE);

------------------------------------------------------------------------------------------------------------------------------------------

create database airlines;
use airlines;
drop database airlines;

CREATE TABLE airline_passengers (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    nationality VARCHAR(50)
);

select * from airline_passengers;
truncate table airline_passengers;
drop table airline_passengers;

INSERT INTO airline_passengers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', '9876543210', 'Indian'),
(2, 'Sneha Rao', 'sneha@gmail.com', '9123456780', 'Indian'),
(3, 'Ravi Kumar', 'ravi@gmail.com', '9988776655', 'Indian'),
(4, 'Megha Nair', 'megha@gmail.com', '9876501234', 'Indian'),
(5, 'Vikram Joshi', 'vikram@gmail.com', '9123467890', 'Indian'),
(6, 'Divya Kapoor', 'divya@gmail.com', '9988112233', 'Indian'),
(7, 'Karan Jain', 'karan@gmail.com', '9876540987', 'Indian'),
(8, 'Priya Singh', 'priya@gmail.com', '9123498765', 'Indian'),
(9, 'Rohan Mehta', 'rohan@gmail.com', '9988770099', 'Indian'),
(10, 'Neha Malhotra', 'neha@gmail.com', '9876509876', 'Indian');

CREATE TABLE airline_flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10),
    origin VARCHAR(50),
    destination VARCHAR(50),
    departure_time DATETIME
);

select * from airline_flights;
truncate table airline_flights;
drop table airline_flights;

INSERT INTO airline_flights VALUES
(1, 'AI101', 'Delhi', 'Mumbai', '2025-08-15 08:00:00'),
(2, 'AI102', 'Mumbai', 'Chennai', '2025-08-15 09:30:00'),
(3, 'AI103', 'Delhi', 'Bangalore', '2025-08-15 11:00:00'),
(4, 'AI104', 'Kolkata', 'Hyderabad', '2025-08-15 14:00:00'),
(5, 'AI105', 'Chennai', 'Delhi', '2025-08-15 16:00:00'),
(6, 'AI106', 'Bangalore', 'Mumbai', '2025-08-15 17:30:00'),
(7, 'AI107', 'Hyderabad', 'Pune', '2025-08-15 19:00:00'),
(8, 'AI108', 'Mumbai', 'Kolkata', '2025-08-15 20:30:00'),
(9, 'AI109', 'Delhi', 'Ahmedabad', '2025-08-15 22:00:00'),
(10, 'AI110', 'Lucknow', 'Delhi', '2025-08-15 23:00:00');

CREATE TABLE airline_bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_number VARCHAR(5)
);

select * from airline_bookings;
truncate table airline_bookings;
drop table airline_bookings;

INSERT INTO airline_bookings VALUES
(1, 1, 1, '2025-08-10', '12A'),
(2, 2, 2, '2025-08-10', '14C'),
(3, 3, 3, '2025-08-11', '16B'),
(4, 4, 4, '2025-08-11', '10D'),
(5, 5, 5, '2025-08-12', '18A'),
(6, 6, 6, '2025-08-12', '15F'),
(7, 7, 7, '2025-08-13', '20B'),
(8, 8, 8, '2025-08-13', '22E'),
(9, 9, 9, '2025-08-14', '24C'),
(10, 10, 10, '2025-08-14', '25A');

CREATE TABLE airline_payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount_paid DECIMAL(8,2),
    payment_method VARCHAR(20),
    payment_date DATE
);

select * from airline_payments;
truncate table airline_payments;
drop table airline_payments;

INSERT INTO airline_payments VALUES
(1, 1, 4500.00, 'UPI', '2025-08-10'),
(2, 2, 5500.00, 'Card', '2025-08-10'),
(3, 3, 5000.00, 'NetBanking', '2025-08-11'),
(4, 4, 6000.00, 'Card', '2025-08-11'),
(5, 5, 5200.00, 'UPI', '2025-08-12'),
(6, 6, 4800.00, 'Cash', '2025-08-12'),
(7, 7, 4700.00, 'UPI', '2025-08-13'),
(8, 8, 6100.00, 'Card', '2025-08-13'),
(9, 9, 5300.00, 'NetBanking', '2025-08-14'),
(10, 10, 4900.00, 'Cash', '2025-08-14');

CREATE TABLE airline_crew (
    crew_id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    flight_id INT,
    experience_years INT
);

select * from airline_crew;
truncate table airline_crew;
drop table airline_crew;

INSERT INTO airline_crew VALUES
(1, 'Captain Rajeev', 'Pilot', 1, 15),
(2, 'Anita Menon', 'Co-Pilot', 1, 10),
(3, 'Priya Verma', 'Cabin Crew', 2, 5),
(4, 'Ajay Singh', 'Pilot', 3, 12),
(5, 'Meera Joshi', 'Cabin Crew', 3, 4),
(6, 'Suresh Patel', 'Pilot', 4, 20),
(7, 'Divya Iyer', 'Cabin Crew', 5, 6),
(8, 'Ravi Yadav', 'Pilot', 6, 8),
(9, 'Neha Deshmukh', 'Co-Pilot', 7, 9),
(10, 'Anil Kumar', 'Cabin Crew', 8, 7);

------------------------------------------------------------------------------------------------------------------------------------------

create database isro;
use isro;
drop database isro;

CREATE TABLE isro_scientists (
    scientist_id INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(50),
    department VARCHAR(50),
    experience_years INT
);

select * from isro_scientists;
truncate table isro_scientists;
drop table isro_scientists;

INSERT INTO isro_scientists VALUES
(1, 'Dr. K. Sharma', 'Scientist-G', 'Aerospace', 20),
(2, 'Dr. R. Mehta', 'Scientist-F', 'Propulsion', 18),
(3, 'Dr. S. Rao', 'Scientist-E', 'Avionics', 15),
(4, 'Dr. N. Iyer', 'Scientist-D', 'Telemetry', 12),
(5, 'Dr. A. Kumar', 'Scientist-C', 'Structures', 10),
(6, 'Dr. P. Das', 'Scientist-F', 'Payload', 16),
(7, 'Dr. V. Nair', 'Scientist-E', 'Navigation', 14),
(8, 'Dr. J. Singh', 'Scientist-D', 'Launch Control', 11),
(9, 'Dr. M. Roy', 'Scientist-C', 'Mission Design', 9),
(10, 'Dr. T. Reddy', 'Scientist-B', 'Testing', 7);

CREATE TABLE isro_projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    launch_date DATE,
    status VARCHAR(20),
    lead_scientist INT
);

select * from isro_projects;
truncate table isro_projects;
drop table isro_projects;

INSERT INTO isro_projects VALUES
(1, 'Chandrayaan-3', '2023-07-14', 'Completed', 1),
(2, 'Gaganyaan', '2025-12-01', 'Planned', 2),
(3, 'Aditya-L1', '2023-09-02', 'Ongoing', 3),
(4, 'RISAT-2BR2', '2019-12-11', 'Completed', 4),
(5, 'GSAT-24', '2022-06-22', 'Completed', 5),
(6, 'PSLV-C58', '2025-10-15', 'Planned', 6),
(7, 'SSLV-D2', '2023-02-10', 'Completed', 7),
(8, 'INSAT-3DS', '2024-02-17', 'Completed', 8),
(9, 'Mars Orbiter Mission-2', '2026-05-05', 'Planned', 9),
(10, 'NAVIC Upgrade', '2025-11-11', 'Ongoing', 10);

CREATE TABLE isro_facilities (
    facility_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    type VARCHAR(50),
    capacity INT
);

select * from isro_facilities;
truncate table isro_facilities;
drop table isro_facilities;

INSERT INTO isro_facilities VALUES
(1, 'VSSC', 'Thiruvananthapuram', 'Research', 500),
(2, 'SDSC SHAR', 'Sriharikota', 'Launch Pad', 300),
(3, 'ISRO HQ', 'Bengaluru', 'Administration', 200),
(4, 'ISTRAC', 'Bengaluru', 'Tracking', 150),
(5, 'LPSC', 'Valiamala', 'Propulsion', 250),
(6, 'DECU', 'Ahmedabad', 'Development', 100),
(7, 'SAC', 'Ahmedabad', 'Satellite Design', 400),
(8, 'NRSC', 'Hyderabad', 'Remote Sensing', 180),
(9, 'SEOC', 'Mumbai', 'Earth Observation', 120),
(10, 'MCF', 'Hassan', 'Control Facility', 140);

CREATE TABLE isro_launch_vehicles (
    vehicle_id INT PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(50),
    max_payload_kg INT,
    status VARCHAR(20)
);

select * from isro_launch_vehicles;
truncate table isro_launch_vehicles;
drop table isro_launch_vehicles;

INSERT INTO isro_launch_vehicles VALUES
(1, 'PSLV', 'Orbital', 1750, 'Active'),
(2, 'GSLV Mk II', 'Orbital', 2500, 'Active'),
(3, 'GSLV Mk III', 'Orbital', 4000, 'Active'),
(4, 'SSLV', 'Orbital', 500, 'Active'),
(5, 'ASLV', 'Orbital', 150, 'Retired'),
(6, 'Rohini', 'Sub-Orbital', 40, 'Retired'),
(7, 'Gaganyaan LVM3', 'Manned', 8000, 'Planned'),
(8, 'Vikas Test Bed', 'Test', 0, 'Testing'),
(9, 'RLV-TD', 'Reusable', 0, 'Prototype'),
(10, 'GSLV Mk IV', 'Orbital', 6000, 'Proposed');

CREATE TABLE isro_satellites (
    satellite_id INT PRIMARY KEY,
    name VARCHAR(100),
    purpose VARCHAR(50),
    launch_date DATE,
    status VARCHAR(20)
);

select * from isro_satellites;
truncate table isro_satellites;
drop table isro_satellites;

INSERT INTO isro_satellites VALUES
(1, 'INSAT-3C', 'Communication', '2002-01-24', 'Retired'),
(2, 'Cartosat-3', 'Remote Sensing', '2019-11-27', 'Active'),
(3, 'GSAT-30', 'Communication', '2020-01-17', 'Active'),
(4, 'RISAT-2B', 'Surveillance', '2019-05-22', 'Active'),
(5, 'GSAT-24', 'Communication', '2022-06-22', 'Active'),
(6, 'INS-2TD', 'Technology Demo', '2022-02-14', 'Retired'),
(7, 'EOS-01', 'Earth Observation', '2020-11-07', 'Active'),
(8, 'Aditya-L1', 'Solar Study', '2023-09-02', 'Active'),
(9, 'IRNSS-1I', 'Navigation', '2018-04-12', 'Active'),
(10, 'Mangalyaan', 'Mars Mission', '2013-11-05', 'Retired');

-------------------------------------------------------------------------------------------------------------------------------------------

create database Taj_hotel;
use Taj_hotel;
drop database Taj_hotel;

CREATE TABLE taj_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from taj_customers;
truncate table taj_customers;
drop table taj_customers;

INSERT INTO taj_customers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', '9876543210', 'Delhi'),
(2, 'Sneha Rao', 'sneha@gmail.com', '9123456780', 'Mumbai'),
(3, 'Ravi Kumar', 'ravi@gmail.com', '9988776655', 'Hyderabad'),
(4, 'Megha Nair', 'megha@gmail.com', '9876501234', 'Chennai'),
(5, 'Vikram Joshi', 'vikram@gmail.com', '9123467890', 'Bangalore'),
(6, 'Divya Kapoor', 'divya@gmail.com', '9988112233', 'Kolkata'),
(7, 'Karan Jain', 'karan@gmail.com', '9876540987', 'Pune'),
(8, 'Priya Singh', 'priya@gmail.com', '9123498765', 'Ahmedabad'),
(9, 'Rohan Mehta', 'rohan@gmail.com', '9988770099', 'Lucknow'),
(10, 'Neha Malhotra', 'neha@gmail.com', '9876509876', 'Jaipur');

CREATE TABLE taj_rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    type VARCHAR(50),
    price_per_night DECIMAL(7,2),
    status VARCHAR(20)
);

select * from taj_rooms;
truncate table taj_rooms;
drop table taj_rooms;

INSERT INTO taj_rooms VALUES
(1, '101', 'Deluxe', 7500.00, 'Available'),
(2, '102', 'Suite', 12000.00, 'Occupied'),
(3, '103', 'Standard', 5000.00, 'Available'),
(4, '104', 'Suite', 12500.00, 'Occupied'),
(5, '105', 'Deluxe', 8000.00, 'Available'),
(6, '106', 'Standard', 5500.00, 'Available'),
(7, '107', 'Suite', 11000.00, 'Occupied'),
(8, '108', 'Deluxe', 7000.00, 'Available'),
(9, '109', 'Standard', 5200.00, 'Occupied'),
(10, '110', 'Deluxe', 7500.00, 'Available');

CREATE TABLE taj_bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE
);

select * from taj_bookings;
truncate table taj_bookings;
drop table taj_bookings;

INSERT INTO taj_bookings VALUES
(1, 1, 2, '2025-08-10', '2025-08-12'),
(2, 2, 4, '2025-08-11', '2025-08-14'),
(3, 3, 7, '2025-08-12', '2025-08-13'),
(4, 4, 9, '2025-08-10', '2025-08-15'),
(5, 5, 3, '2025-08-13', '2025-08-15'),
(6, 6, 5, '2025-08-13', '2025-08-16'),
(7, 7, 6, '2025-08-11', '2025-08-12'),
(8, 8, 8, '2025-08-14', '2025-08-15'),
(9, 9, 1, '2025-08-15', '2025-08-18'),
(10, 10, 10, '2025-08-16', '2025-08-17');

CREATE TABLE taj_services (
    service_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(6,2),
    type VARCHAR(50),
    availability VARCHAR(20)
);

select * from taj_services;
truncate table taj_services;
drop table taj_services;

INSERT INTO taj_services VALUES
(1, 'Spa', 2000.00, 'Wellness', 'Available'),
(2, 'Laundry', 500.00, 'Cleaning', 'Available'),
(3, 'Room Service', 0.00, 'Hospitality', 'Available'),
(4, 'Airport Pickup', 1000.00, 'Transport', 'Available'),
(5, 'Breakfast Buffet', 800.00, 'Dining', 'Available'),
(6, 'Gym Access', 0.00, 'Fitness', 'Available'),
(7, 'City Tour', 1500.00, 'Recreation', 'On Request'),
(8, 'Massage Therapy', 2500.00, 'Wellness', 'Available'),
(9, 'Swimming Pool', 0.00, 'Recreation', 'Available'),
(10, 'High Tea', 600.00, 'Dining', 'Available');

CREATE TABLE taj_payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(20)
);

select * from taj_payments;
truncate table taj_payments;
drop table taj_payments;

INSERT INTO taj_payments VALUES
(1, 1, 24000.00, '2025-08-10', 'Card'),
(2, 2, 37500.00, '2025-08-11', 'UPI'),
(3, 3, 11000.00, '2025-08-12', 'Cash'),
(4, 4, 26000.00, '2025-08-10', 'Card'),
(5, 5, 10000.00, '2025-08-13', 'UPI'),
(6, 6, 24000.00, '2025-08-13', 'NetBanking'),
(7, 7, 5500.00, '2025-08-11', 'Card'),
(8, 8, 7000.00, '2025-08-14', 'Cash'),
(9, 9, 22500.00, '2025-08-15', 'UPI'),
(10, 10, 7500.00, '2025-08-16', 'Card');

-------------------------------------------------------------------------------------------------------------------------------------------

create database purplle;
use purplle;
drop database purplle;

CREATE TABLE purplle_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from purplle_customers;
truncate table purplle_customers;
drop table purplle_customers;

INSERT INTO purplle_customers VALUES
(1, 'Anita Sharma', 'anita@gmail.com', '9876543210', 'Delhi'),
(2, 'Rohit Kumar', 'rohit@gmail.com', '9123456780', 'Mumbai'),
(3, 'Sonal Mehta', 'sonal@gmail.com', '9988776655', 'Bangalore'),
(4, 'Pooja Singh', 'pooja@gmail.com', '9876501234', 'Hyderabad'),
(5, 'Karan Verma', 'karan@gmail.com', '9123467890', 'Chennai'),
(6, 'Divya Patel', 'divya@gmail.com', '9988112233', 'Pune'),
(7, 'Ajay Joshi', 'ajay@gmail.com', '9876540987', 'Kolkata'),
(8, 'Priya Nair', 'priya@gmail.com', '9123498765', 'Ahmedabad'),
(9, 'Rakesh Gupta', 'rakesh@gmail.com', '9988770099', 'Lucknow'),
(10, 'Neha Malhotra', 'neha@gmail.com', '9876509876', 'Jaipur');

CREATE TABLE purplle_products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    brand VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(7,2)
);

select * from purplle_products;
truncate table purplle_products;
drop table purplle_products;

INSERT INTO purplle_products VALUES
(1, 'Lipstick Matte', 'Maybelline', 'Makeup', 499.00),
(2, 'Face Wash', 'Himalaya', 'Skincare', 199.00),
(3, 'Hair Oil', 'Dabur', 'Haircare', 299.00),
(4, 'Nail Polish', 'Lakme', 'Makeup', 250.00),
(5, 'Moisturizer', 'Neutrogena', 'Skincare', 799.00),
(6, 'Eyeliner', 'Lakme', 'Makeup', 399.00),
(7, 'Shampoo', 'Pantene', 'Haircare', 350.00),
(8, 'Body Lotion', 'Nivea', 'Skincare', 450.00),
(9, 'Foundation', 'L\'Oreal', 'Makeup', 899.00),
(10, 'Conditioner', 'Tresemme', 'Haircare', 320.00);

CREATE TABLE purplle_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20)
);

select * from purplle_orders;
truncate table purplle_orders;
drop table purplle_orders;

INSERT INTO purplle_orders VALUES
(1, 1, '2025-08-10', 1298.00, 'Delivered'),
(2, 2, '2025-08-11', 799.00, 'Cancelled'),
(3, 3, '2025-08-12', 599.00, 'Delivered'),
(4, 4, '2025-08-12', 399.00, 'Processing'),
(5, 5, '2025-08-13', 1149.00, 'Delivered'),
(6, 6, '2025-08-14', 350.00, 'Delivered'),
(7, 7, '2025-08-15', 250.00, 'Processing'),
(8, 8, '2025-08-15', 899.00, 'Delivered'),
(9, 9, '2025-08-16', 749.00, 'Cancelled'),
(10, 10, '2025-08-16', 670.00, 'Delivered');

CREATE TABLE purplle_order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(7,2)
);

select * from purplle_order_items;
truncate table purplle_order_items;
drop table purplle_order_items;

INSERT INTO purplle_order_items VALUES
(1, 1, 1, 2, 998.00),
(2, 1, 2, 1, 199.00),
(3, 2, 5, 1, 799.00),
(4, 3, 3, 2, 598.00),
(5, 4, 6, 1, 399.00),
(6, 5, 1, 1, 499.00),
(7, 5, 9, 1, 650.00),
(8, 6, 7, 1, 350.00),
(9, 7, 4, 1, 250.00),
(10, 8, 9, 1, 899.00);

CREATE TABLE purplle_reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    comment VARCHAR(255)
);

select * from purplle_reviews;
truncate table purplle_reviews;
drop table purplle_reviews;

INSERT INTO purplle_reviews VALUES
(1, 1, 1, 5, 'Great lipstick, long lasting'),
(2, 2, 2, 4, 'Good face wash, gentle on skin'),
(3, 3, 3, 5, 'Hair oil really improved hair texture'),
(4, 4, 4, 3, 'Nail polish chip quickly'),
(5, 5, 5, 4, 'Moisturizer works well'),
(6, 6, 6, 5, 'Eyeliner is smooth and easy to apply'),
(7, 7, 7, 4, 'Shampoo smells nice'),
(8, 8, 8, 5, 'Body lotion is very moisturizing'),
(9, 9, 9, 5, 'Foundation gives good coverage'),
(10, 10, 10, 4, 'Conditioner leaves hair soft');

------------------------------------------------------------------------------------------------------------------------------------------

create database event_management_system;
use event_management_system; 
drop database event_management_system;

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    start_date DATE,
    end_date DATE
);

select * from events;
truncate table events;
drop table events;

INSERT INTO events VALUES
(1, 'Tech Conference 2025', 'New York', '2025-09-15', '2025-09-17'),
(2, 'Music Festival', 'Los Angeles', '2025-10-01', '2025-10-03'),
(3, 'Art Expo', 'San Francisco', '2025-11-05', '2025-11-07'),
(4, 'Food Carnival', 'Chicago', '2025-08-20', '2025-08-22'),
(5, 'Marathon', 'Boston', '2025-09-10', '2025-09-10'),
(6, 'Book Fair', 'Seattle', '2025-10-15', '2025-10-18'),
(7, 'Startup Meetup', 'Austin', '2025-08-25', '2025-08-25'),
(8, 'Film Festival', 'Miami', '2025-11-20', '2025-11-23'),
(9, 'Fashion Week', 'New York', '2025-09-01', '2025-09-07'),
(10, 'Charity Gala', 'Dallas', '2025-12-05', '2025-12-05');

CREATE TABLE attendees (
    attendee_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    event_id INT
);

select * from attendees;
truncate table attendees;
drop table attendees;

INSERT INTO attendees VALUES
(1, 'Alice Johnson', 'alice.j@gmail.com', '9876543210', 1),
(2, 'Bob Smith', 'bob.smith@gmail.com', '9123456780', 2),
(3, 'Catherine Lee', 'catherine.l@gmail.com', '9988776655', 3),
(4, 'David Kim', 'david.k@gmail.com', '9876501234', 4),
(5, 'Eva Martinez', 'eva.m@gmail.com', '9123467890', 5),
(6, 'Frank White', 'frank.w@gmail.com', '9988112233', 6),
(7, 'Grace Chen', 'grace.c@gmail.com', '9876540987', 7),
(8, 'Henry Brown', 'henry.b@gmail.com', '9123498765', 8),
(9, 'Isabel Garcia', 'isabel.g@gmail.com', '9988770099', 9),
(10, 'Jack Wilson', 'jack.w@gmail.com', '9876509876', 10);

CREATE TABLE vendors (
    vendor_id INT PRIMARY KEY,
    name VARCHAR(100),
    service VARCHAR(100),
    contact_email VARCHAR(100),
    phone VARCHAR(15)
);

select * from vendors;
truncate table vendors;
drop table vendors;

INSERT INTO vendors VALUES
(1, 'Elite Catering', 'Catering', 'contact@elitecatering.com', '9112345678'),
(2, 'SoundPro', 'Sound System', 'info@soundpro.com', '9123456789'),
(3, 'Bright Lights', 'Lighting', 'support@brightlights.com', '9134567890'),
(4, 'StageMasters', 'Stage Setup', 'sales@stagemasters.com', '9145678901'),
(5, 'Event Décor', 'Decoration', 'contact@eventdecor.com', '9156789012'),
(6, 'PhotoSnap', 'Photography', 'hello@photosnap.com', '9167890123'),
(7, 'Floral Art', 'Florist', 'info@floralart.com', '9178901234'),
(8, 'Security Plus', 'Security', 'contact@securityplus.com', '9189012345'),
(9, 'Transport Co.', 'Transport', 'support@transportco.com', '9190123456'),
(10, 'Tech Solutions', 'IT Support', 'sales@techsolutions.com', '9101234567');

CREATE TABLE event_schedules (
    schedule_id INT PRIMARY KEY,
    event_id INT,
    activity VARCHAR(100),
    start_time TIME,
    end_time TIME
);

select * from event_schedules;
truncate table event_schedules;
drop table event_schedules;

INSERT INTO event_schedules VALUES
(1, 1, 'Keynote Speech', '09:00:00', '10:30:00'),
(2, 1, 'Networking', '10:45:00', '12:00:00'),
(3, 2, 'Live Band', '18:00:00', '20:00:00'),
(4, 3, 'Art Display', '10:00:00', '17:00:00'),
(5, 4, 'Cooking Demo', '12:00:00', '14:00:00'),
(6, 5, 'Marathon Start', '07:00:00', '09:00:00'),
(7, 6, 'Author Talk', '11:00:00', '12:30:00'),
(8, 7, 'Pitch Sessions', '14:00:00', '17:00:00'),
(9, 8, 'Film Screening', '19:00:00', '22:00:00'),
(10, 9, 'Fashion Show', '18:00:00', '21:00:00');

CREATE TABLE event_feedback (
    feedback_id INT PRIMARY KEY,
    attendee_id INT,
    event_id INT,
    rating INT,
    comments VARCHAR(255)
);

select * from event_feedback;
truncate table event_feedback;
drop table event_feedback;

INSERT INTO event_feedback VALUES
(1, 1, 1, 5, 'Excellent conference with great speakers.'),
(2, 2, 2, 4, 'Music festival was fun, but a bit crowded.'),
(3, 3, 3, 5, 'Loved the art displays and variety.'),
(4, 4, 4, 3, 'Food options were limited.'),
(5, 5, 5, 4, 'Well organized marathon event.'),
(6, 6, 6, 5, 'Book fair had a great collection.'),
(7, 7, 7, 4, 'Startup meetup was very insightful.'),
(8, 8, 8, 5, 'Film festival showcased amazing films.'),
(9, 9, 9, 5, 'Fashion week had stunning designs.'),
(10, 10, 10, 4, 'Charity gala was impactful.');

-------------------------------------------------------------------------------------------------------------------------------------------

create database insurance;
use insurance;
drop database insurance;

CREATE TABLE insurance_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

select * from insurance_customers;
truncate table insurance_customers;
drop table insurance_customers;

INSERT INTO insurance_customers VALUES
(1, 'Rahul Verma', 'rahul.verma@gmail.com', '9876543210', 'Delhi'),
(2, 'Sneha Gupta', 'sneha.gupta@gmail.com', '9123456780', 'Mumbai'),
(3, 'Anil Kumar', 'anil.kumar@gmail.com', '9988776655', 'Bangalore'),
(4, 'Priya Sharma', 'priya.sharma@gmail.com', '9876501234', 'Hyderabad'),
(5, 'Karan Singh', 'karan.singh@gmail.com', '9123467890', 'Chennai'),
(6, 'Divya Patel', 'divya.patel@gmail.com', '9988112233', 'Pune'),
(7, 'Ajay Joshi', 'ajay.joshi@gmail.com', '9876540987', 'Kolkata'),
(8, 'Priyanka Nair', 'priyanka.nair@gmail.com', '9123498765', 'Ahmedabad'),
(9, 'Rakesh Mehta', 'rakesh.mehta@gmail.com', '9988770099', 'Lucknow'),
(10, 'Neha Malhotra', 'neha.malhotra@gmail.com', '9876509876', 'Jaipur');

CREATE TABLE insurance_policies (
    policy_id INT PRIMARY KEY,
    policy_name VARCHAR(100),
    policy_type VARCHAR(50),
    premium_amount DECIMAL(10,2),
    coverage_period INT  -- months
);

select * from insurance_policies;
truncate table insurance_policies;
drop table insurance_policies;

INSERT INTO insurance_policies VALUES
(1, 'Term Life Insurance', 'Life', 12000.00, 120),
(2, 'Health Insurance', 'Health', 15000.00, 12),
(3, 'Car Insurance', 'Vehicle', 8000.00, 12),
(4, 'Home Insurance', 'Property', 10000.00, 24),
(5, 'Travel Insurance', 'Travel', 3000.00, 3),
(6, 'Personal Accident', 'Accident', 7000.00, 12),
(7, 'Motorcycle Insurance', 'Vehicle', 5000.00, 12),
(8, 'Critical Illness', 'Health', 20000.00, 60),
(9, 'Business Insurance', 'Business', 25000.00, 36),
(10, 'Child Education Plan', 'Life', 18000.00, 180);

CREATE TABLE insurance_customers_policies (
    customer_id INT,
    policy_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    PRIMARY KEY (customer_id, policy_id)
);

select * from insurance_customers_policies;
truncate table insurance_customers_policies;
drop table insurance_customers_policies;

INSERT INTO insurance_customers_policies VALUES
(1, 1, '2023-01-01', '2033-01-01', 'Active'),
(2, 2, '2024-02-15', '2025-02-14', 'Active'),
(3, 3, '2025-03-20', '2026-03-19', 'Active'),
(4, 4, '2023-07-10', '2025-07-09', 'Expired'),
(5, 5, '2025-08-01', '2025-11-01', 'Active'),
(6, 6, '2024-06-05', '2025-06-04', 'Active'),
(7, 7, '2025-01-10', '2026-01-09', 'Active'),
(8, 8, '2020-09-15', '2025-09-14', 'Expired'),
(9, 9, '2023-11-11', '2026-11-10', 'Active'),
(10, 10, '2015-05-01', '2030-05-01', 'Active');

CREATE TABLE insurance_claims (
    claim_id INT PRIMARY KEY,
    customer_id INT,
    policy_id INT,
    claim_date DATE,
    claim_amount DECIMAL(10,2),
    status VARCHAR(20)
);

select * from insurance_claims;
truncate table insurance_claims;
drop table insurance_claims;

INSERT INTO insurance_claims VALUES
(1, 1, 1, '2024-05-10', 500000.00, 'Approved'),
(2, 2, 2, '2025-06-20', 20000.00, 'Pending'),
(3, 3, 3, '2025-07-01', 15000.00, 'Rejected'),
(4, 4, 4, '2024-12-15', 30000.00, 'Approved'),
(5, 5, 5, '2025-08-05', 5000.00, 'Pending'),
(6, 6, 6, '2024-11-10', 10000.00, 'Approved'),
(7, 7, 7, '2025-02-20', 8000.00, 'Pending'),
(8, 8, 8, '2021-09-30', 150000.00, 'Approved'),
(9, 9, 9, '2024-01-25', 75000.00, 'Rejected'),
(10, 10, 10, '2023-06-18', 40000.00, 'Approved');

------------------------------------------------------------------------------------------------------------------------------------------

create database IARI;
use IARI;
drop database IARI;

CREATE TABLE researchers (
    researcher_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

select * from researchers;
truncate table researchers;
drop table researchers;

INSERT INTO researchers VALUES
(1, 'Dr. Anil Kumar', 'Plant Breeding', 'anil.kumar@iari.res.in', '9876543210'),
(2, 'Dr. Sunita Sharma', 'Soil Science', 'sunita.sharma@iari.res.in', '9123456780'),
(3, 'Dr. Rajesh Verma', 'Entomology', 'rajesh.verma@iari.res.in', '9988776655'),
(4, 'Dr. Meena Gupta', 'Horticulture', 'meena.gupta@iari.res.in', '9876501234'),
(5, 'Dr. Sanjay Singh', 'Agronomy', 'sanjay.singh@iari.res.in', '9123467890'),
(6, 'Dr. Kavita Joshi', 'Plant Pathology', 'kavita.joshi@iari.res.in', '9988112233'),
(7, 'Dr. Ajay Patel', 'Genetics', 'ajay.patel@iari.res.in', '9876540987'),
(8, 'Dr. Nisha Nair', 'Agricultural Economics', 'nisha.nair@iari.res.in', '9123498765'),
(9, 'Dr. Ramesh Mehta', 'Biotechnology', 'ramesh.mehta@iari.res.in', '9988770099'),
(10, 'Dr. Priya Malhotra', 'Agricultural Engineering', 'priya.malhotra@iari.res.in', '9876509876');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    title VARCHAR(150),
    department VARCHAR(50),
    start_date DATE,
    end_date DATE
);

select * from projects;
truncate table projects;
drop table projects;

INSERT INTO projects VALUES
(1, 'Drought Resistant Wheat Development', 'Plant Breeding', '2023-01-01', '2025-12-31'),
(2, 'Soil Nutrient Management', 'Soil Science', '2022-05-15', '2024-11-30'),
(3, 'Integrated Pest Management', 'Entomology', '2023-06-01', '2026-05-31'),
(4, 'Horticulture Crop Improvement', 'Horticulture', '2024-01-10', '2027-01-09'),
(5, 'Sustainable Agronomy Practices', 'Agronomy', '2023-03-20', '2025-03-19'),
(6, 'Plant Disease Resistance', 'Plant Pathology', '2022-08-01', '2024-07-31'),
(7, 'Genetic Mapping of Rice', 'Genetics', '2023-09-15', '2026-09-14'),
(8, 'Farm Economics Analysis', 'Agricultural Economics', '2024-02-10', '2026-02-09'),
(9, 'Biotech Crop Development', 'Biotechnology', '2023-11-01', '2025-10-31'),
(10, 'Irrigation System Design', 'Agricultural Engineering', '2023-04-01', '2025-03-31');

CREATE TABLE researcher_projects (
    researcher_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (researcher_id, project_id)
);

select * from researcher_projects;
truncate table researcher_projects;
drop table researcher_projects;

INSERT INTO researcher_projects VALUES
(1, 1, 'Lead Researcher'),
(2, 2, 'Co-Researcher'),
(3, 3, 'Lead Researcher'),
(4, 4, 'Project Coordinator'),
(5, 5, 'Lead Researcher'),
(6, 6, 'Research Assistant'),
(7, 7, 'Co-Researcher'),
(8, 8, 'Economist'),
(9, 9, 'Lead Researcher'),
(10, 10, 'Engineer');

CREATE TABLE publications (
    publication_id INT PRIMARY KEY,
    title VARCHAR(200),
    researcher_id INT,
    publish_date DATE,
    journal VARCHAR(100)
);

select * from publications;
truncate table publications;
drop table publications;

INSERT INTO publications VALUES
(1, 'Wheat Breeding for Drought Resistance', 1, '2024-06-15', 'Journal of Crop Science'),
(2, 'Soil Health and Fertility', 2, '2023-12-10', 'Soil Science Today'),
(3, 'Pest Management Strategies', 3, '2025-01-20', 'Entomology Journal'),
(4, 'Advances in Horticulture', 4, '2024-08-05', 'Horticulture International'),
(5, 'Sustainable Farming Techniques', 5, '2024-03-12', 'Agronomy Review'),
(6, 'Plant Disease Control Methods', 6, '2023-09-30', 'Plant Pathology Letters'),
(7, 'Genetics of Rice Varieties', 7, '2025-04-18', 'Genetics and Biotechnology'),
(8, 'Economic Impact of Farming', 8, '2024-11-22', 'Agricultural Economics'),
(9, 'Biotech Advances in Crops', 9, '2025-02-14', 'Biotechnology Reports'),
(10, 'Innovations in Irrigation', 10, '2024-07-25', 'Agricultural Engineering');

CREATE TABLE facilities (
    facility_id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    location VARCHAR(100),
    capacity INT
);

select * from facilities;
truncate table facilities;
drop table facilities;

INSERT INTO facilities VALUES
(1, 'Greenhouse A', 'Greenhouse', 'IARI Campus', 100),
(2, 'Soil Lab', 'Laboratory', 'IARI Campus', 50),
(3, 'Insectary', 'Laboratory', 'IARI Campus', 40),
(4, 'Horticulture Field', 'Field', 'IARI Campus', 500),
(5, 'Agronomy Research Plot', 'Field', 'IARI Campus', 400),
(6, 'Plant Pathology Lab', 'Laboratory', 'IARI Campus', 60),
(7, 'Genetics Lab', 'Laboratory', 'IARI Campus', 70),
(8, 'Economics Department', 'Office', 'IARI Campus', 30),
(9, 'Biotech Lab', 'Laboratory', 'IARI Campus', 80),
(10, 'Irrigation Facility', 'Field', 'IARI Campus', 350);


