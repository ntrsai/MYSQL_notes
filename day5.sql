use mncs;
create table stu_data(
id int,
name varchar(80),
city varchar(80)
);
drop table stu_data;
select * from stu_data;
select city,count(city) from stu_data
group by city;

alter table stu_data rename COLUMN name to stu_name ,rename column city to stu_city;#we can change multiple columns names 
insert into stu_data (id,name,city) values (1,"sai","hyd"),(2,"vicky","mumbai"),(3,"raj","delhi"),(4,"ramu","delhi"),(5,"raj","ripur");

create database if not exists phone;
use sys;
drop database if exists sys;
#........................................FOREIGN KEY................................................
/*what is foreign key ?
1...a foreign key is a column ( or set of column ) in one table referes to the  primary key in anther table.
2..it helps esthablish  a parent-child relationship between tables.
3.it creates relationship between two tables like.
employee.department_id-> department.department_id
4..foreign key ensures  that the values  in the referencing  column must exists  in the referenced table's primary key
5...it is used to  enforce referntial  integrity  in the database.

why use foreign key ?
--> To logically connect related data across multiple tables.
--> To avoid data redundancy and maintain normalized database design.
--> To maintain data accuracy and consistency through relationships.
--> To restrict invalid data entries (e.g., preventing a student being assigned to a non-existent class).

Key Properties of Foreign Key:

--> A foreign key refers to a primary key (or unique key) in another table.
--> Multiple foreign keys can exist in a table.
--> The referencing column can accept NULL values (unless explicitly marked NOT NULL).
--> Prevents insertion of invalid values (i.e., values not present in the parent table).
--> Can use ON DELETE or ON UPDATE rules like CASCADE, SET NULL, RESTRICT, etc.

real-world example  - company database relationship:
 |child table| foreign key     | parent table|
 ---------------------------------------------
 |employeee  | department_id   | ->departments |
 | projects  |  client_id      | ->clients     |
 |tasks      |  employee_id    | ->employees   |
 |salaries   |  employee_id    | ->employees   |
 |attendance |  employee_id    | ->employees   |
 |leaves     | employee_id     | ->employees   |
 |employees  | employee_id     | ->managers    |
 |assets     | employee_id     | ->employees   |
 
 conclusion:
 ---> A foreign key  are essential to maintain structered ,connected and meaningfull relational data.
 ---> they make the database more reliable  by enforecing valid references between records.
 
 
*/

use mncs;
#table 1 ( departments)
create table department(
dept_id int primary key,
dept_name varchar(70) not null,
location varchar(50),
head_person varchar(70),
established_year int check(established_year >=2000));

insert into department values
(1, 'HR', 'Delhi', 'Ritika', 2015), 
(2, 'Finance', 'Mumbai', 'Manish', 2012),
(3, 'IT', 'Bangalore', 'Amit', 2018), 
(4, 'Sales', 'Chennai', 'Divya', 2017),
(5, 'Marketing', 'Kolkata', 'Rohan', 2016);

select * from department;

#table 2 (managers)
create table managers(
managers_id int primary key,
name varchar(40),
experience int check(experience >0),
salary bigint check(salary >=50000),
contact bigint unique not null);

select * from managers;
insert into managers values 
(9001, 'Ritika', 10, 90000, '9876543210'),
(9002, 'Manish', 12, 95000, '9812345678'),
(9003, 'Amit', 8, 85000, '9765432101'),
(9004, 'Divya', 9, 88000, '9900112233'),
(9005, 'Rohan', 7, 82000, '9123456789');

#table 3 (employees)
create table employees(
employee_id int primary key,
name varchar(50),
dept_id int  not null,
manager_id int,
position varchar(70) not null,
foreign key (dept_id) references department(dept_id),
foreign key (manager_id) references managers(managers_id));

insert into employees values 
(101, 'Shalini', 1, 9001, 'HR Executive'),
(102, 'Rahul', 2, 9002, 'Accountant'),
(103, 'Trisha', 3, 9003, 'Developer'),
(104, 'Kavita', 4, 9004, 'Sales Executive'),
(105, 'Jay', 5, 9005, 'Marketing Analyst');

#table 4
create table clients(
client_id int primary key,
name varchar(60),
company varchar(70),
contact bigint unique not null,
email varchar(60) unique not null);

insert into clients values 


(601, 'Mr. Roy', 'Tata', '9876543211', 'roy@tata.com'),
(602,' Ms. Nisha', 'Infosys', '9876543212', 'nisha@infosys.com'),
(603, 'Mr. Khan', 'Reliance', '9876543213', 'khan@reliance.com'),
(604, 'Mr. Mehta', 'HCL', '9876543214', 'mehta@hcl.com'),
(605, 'Ms. Sharma', 'IBM', '9876543215', 'vicky@hag.com');

#table 5

create table projects (
project_id int primary key,
name varchar(69),
client_id int,
budget bigint check(budget > 100000),
start_date date ,
foreign key (client_id) references clients(client_id)
);
insert into projects values 
(501, 'ERP System', 601, 500000, '2025-06-01'),
(502, 'CRM App', 602, 400000, '2025-06-10'),
(503, 'E-Commerce', 603, 450000, '2025-06-15'),
(504, 'Payroll System', 604, 300000, '2025-06-20'), 
(505, 'HR Portal', 605, 250000, '2025-06-25');
 
#table 6
create table salaries (
salary_id int primary key,
employee_id int not null unique,
basic int  check(basic >= 25000),
hra int,
bonus int,
foreign key (employee_id) references employees(employee_id));

insert into salaries values
(201, 101, 30000, 5000, 2000),
(202, 102, 35000, 6000, 2500),
(203, 103, 40000, 7000, 3000),
(204, 104, 28000, 4500, 1500),
(205, 105, 32000, 4800, 1800);


-- 7. Attendance
use mncs;

CREATE TABLE Attendance (
  attendance_id INT PRIMARY KEY,
  employee_id INT NOT NULL,
  date DATE,
  status VARCHAR(10) CHECK(status IN ('Present', 'Absent', 'Leave')),
  shift VARCHAR(10),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Attendance VALUES
(301, 101, '2025-07-15', 'Present', 'Day'),
(302, 102, '2025-07-15', 'Absent', 'Night'),
(303, 103, '2025-07-15', 'Present', 'Day'),
(304, 104, '2025-07-15', 'Present', 'Day'),
(305, 105, '2025-07-15', 'Leave', 'Night');

SELECT * FROM Attendance;

--  8. Leaves

CREATE TABLE Leaves (
  leave_id INT PRIMARY KEY,
  employee_id INT NOT NULL,
  from_date DATE,
  to_date DATE,
  reason VARCHAR(50),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Leaves VALUES
(401, 101, '2025-07-01', '2025-07-03', 'Personal'),
(402, 102, '2025-07-05', '2025-07-07', 'Medical'),
(403, 103, '2025-07-10', '2025-07-11', 'Family Function'),
(404, 104, '2025-07-12', '2025-07-13', 'Emergency'),
(405, 105, '2025-07-14', '2025-07-14', 'One-day leave');

SELECT * FROM Leaves;


-- 9. Tasks

CREATE TABLE Tasks (
  task_id INT PRIMARY KEY,
  employee_id INT NOT NULL,
  task_name VARCHAR(50) NOT NULL,
  status VARCHAR(20) DEFAULT 'Pending',
  deadline DATE,
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Tasks VALUES
(701, 101, 'Resume Shortlisting', 'Completed', '2025-07-10'),
(702, 102, 'Invoice Checking', 'In Progress', '2025-07-20'),
(703, 103, 'API Development', 'Pending', '2025-07-25'),
(704, 104, 'Sales Pitch', 'Completed', '2025-07-12'),
(705, 105, 'Ad Campaign Plan', 'In Progress', '2025-07-18');

SELECT * FROM Tasks;

-- 10. Assets

CREATE TABLE Assets (
  asset_id INT PRIMARY KEY,
  asset_name VARCHAR(50) NOT NULL,
  assigned_to INT,
  status VARCHAR(20) CHECK(status IN ('Working', 'Damaged', 'Under Repair')),
  issue_date DATE,
  FOREIGN KEY (assigned_to) REFERENCES Employees(employee_id)
  
);

INSERT INTO Assets VALUES
(801, 'Laptop', 101, 'Working', '2025-07-01'),
(802, 'Mobile', 102, 'Damaged', '2025-06-28'),
(803, 'Headset', 103, 'Working', '2025-07-05'),
(804, 'Projector', 104, 'Under Repair', '2025-07-03'),
(805, 'Tablet', 105, 'Working', '2025-07-07');

SELECT * FROM Assets;




select * from department; #table 1
select * from managers;#table 2
select * from employees;#table 3
select * from clients;#table 4
select * from projects; #table 5
select * from salaries;#table 6
SELECT * FROM Attendance;#table 7
SELECT * FROM Leaves;#table 8
SELECT * FROM Tasks;#table 9
SELECT * FROM Assets;#10






