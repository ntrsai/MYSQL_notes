#single line comments

/*
Multiline 
Comments
*/

## This is also used for single line comment in sql

/*
Usage of Comments

1. Documentation: Comments can be used to document the purpose of a SQL query or the logic 
behind complex operations.
2.Debugging: You can temporarily disable parts of your SQL code by commenting them out, 
which is useful for debugging.
3. Collaboration: When working in teams, comments help communicate the intent and 
functionality of the code to other developers.
*/


-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
Create database Sahyog;

-- to work on it, you need to use it first
use sahyog;

-- delete database
-- to execute query(ctrl+enter)
drop database Sahyog;

-- SQL is not a case sensitive language, ex- AGE or Age or age will be treated as same word

-- ---------------------------------------- Database Analysis ----------------------------------------

/*
T1 : Student(id,name,std,address,age)

T2 : Teachers(TeacherID,Name,Subject,Experience,Email)

T3 : Classes(ClassID,ClassName,Section,TotalStudents,TeacherID)

T4 : Subjects(SubjectID,SubjectName,Credits,ClassID)

T5 : Exams(ExamID,ExamName,Date,TotalMarks,ClassID)

T6 : Attendance(AttendanceID,StudentID,ClassID,Date,Status)

T7 : Grades(GradeID,StudentID,SubjectID,Marks)

T8 : Library(BookID,Title,Author,ISBN,AvailableCopies)

T9 : ExtracurricularActivities(ActivityID,ActivityName,Description,ClassID)

T10: ParentDetails(ParentID,StudentID,ParentName,Relationship,ContactNumber)

*/

-- --------------------------------------- Basic Concepts -----------------------------------------------------

/*
Data types: ensure types ofdata and size of data to br stored in an attributes'
               ex. int ,varchar(10),date..
              
Constraint : used to apply some rules /restriction on a attribute
             ex. unique,not nyll,primary key

Commands : used to interact with database and tables as - DDL,DML,DQL,DCL,TCL
           ex. ceate,insert,select,drop

Clause :used to add some extra information/condition in commmnad 
         ex. select * from student;,
             select* from student where name="kavya".
*/

-- --------------------------------------- Table Related Queries ---------------------------------

-- Table-1 Student

create table Student(
id int primary key,  -- primary key = unique + not null
name varchar(100) not null,
std varchar(10) not null,
address varchar(200),
age int
);

-- to display/retrive table data
select * from student;

-- to insert a single record
insert into Student(id,name,std,address,age)
values 
(1,'Vikram', '1st', 'Dombivli',5);

-- to insert a single record without writing attributes name
insert into Student
values 
(2,'Pranay', '1st', 'Dombivli',5);

-- to insert multiple records together
insert into Student
values 
(3,'Yusuf', '1st', 'Dombivli',5),
(4,'Shoeb', '1st', 'Dombivli',5),
(5,'Kajal', '1st', 'Dombivli',5),
(6,'Trisha', '1st', 'Dombivli',5),
(7,'Khushi', '1st', 'Dombivli',5),
(8,'Mitali', '1st', 'Dombivli',5),
(9,'Anjali', '1st', 'Dombivli',5),
(10,'Priya', '1st', 'Dombivli',5);

-- to remove complete records from table
truncate table student;

-- to remove complete records and attributes from table
drop table student;


-- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(100),
    Subject VARCHAR(50),
    Experience INT,
    Email VARCHAR(100)
);

-- to display/retrive table data
select * from Teachers;



INSERT INTO Teachers (TeacherID, Name, Subject, Experience, Email) VALUES
(1, 'Mr. Rajesh Kumar', 'Mathematics', 10, 'rajesh.kumar@example.com'),
(2, 'Ms. Anita Desai', 'Science', 8, 'anita.desai@example.com'),
(3, 'Mr. Sanjay Gupta', 'English', 12, 'sanjay.gupta@example.com'),
(4, 'Ms. Priya Sharma', 'History', 5, 'priya.sharma@example.com'),
(5, 'Mr. Rakesh Mehta', 'Geography', 15, 'rakesh.mehta@example.com');

-- to remove complete records from table
truncate table Teachers;

-- to remove complete records and attributes from table
drop table Teachers;