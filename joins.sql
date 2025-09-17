-- create a new database named 'dempjoins'
create database demojoins;
use demojoins;
/*
ex-university database
1.faculty
2.departments
3.students
4.marks

result-- student_id, student_name,faculty_name,total_nam,e,department_name
--> there must be  1 common attribute in each table to joins each.
In mysql,joins are used to combine rows from two or more tables based on a related
column between them. joins allow you to retrieve data from multiple tables in a single
query,making it easier to work with relationship databases.




1. INNER JOIN:
   - Definition: The INNER JOIN keyword selects records that have matching values in both tables.
   - Purpose: To retrieve only the rows where there is a match in both tables, effectively filtering out 
   non-matching rows.
   
   - Example:
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     INNER JOIN Departments b ON a.DepartmentID = b.DepartmentID;
 2.LEFT JOIN (orv left outer join):
    -definition : The left join keywords retuirn all rcordds from leftv table and the mactched  records from 
    the right table.
    - purpose : To retrieve all records from the left table and the regardless of whether there is a matched the right  table,
    allowing for null values in the result set of non-matching rows.
    
    exmaple:
    select a.employeeid,a.name,b,departmentname
    from employee alterleft join department b on a.departmentid=b.departmentid;
    
 3.RIGHT JOIN (orv right outer join):
    -definition : The right join keywords retuirn all rcordds from right table and the mactched  records from 
    the left table.
    - purpose : To retrieve all records from the right table and the regardless of whether there is a matched the  left table,
    allowing for null values in the result set of non-matching rows.
    
    exmaple:
    select a.employeeid,a.name,b,departmentname
    from employee alterleft join department b on a.departmentid=b.departmentid;
    
 4.FULL JOIN(OR FULL OUTER JOIN):
      -Definition: the full join keywords  records from both tables ,includoing those that do not have  matches in either table.
      mysql does not support full join directly,but it can be simultaed using a combination of left join and 
      right join with a union.
      -example :
      select a.employeeid,a.name,b.departmentname  from employee a
      left join departments b on a.departmentid = b.departmentid;
      
      5.LEFT EXCLUSIVE JOIN:
      -Definition : this is not a standard sql join type,but it can be simluted by using a left join and 
      filtering out the matched records from the rioght table.
      
      -purpose : to retrieve records from the left table  that do not have corresponding  reciords  in the left table.
      
      example:
      select a.employeeid,a.name
      from employee 
      left join departments b on a.departmentid = b.departmentid
      where b.department is null;
      
      
      6.RIGHT EXCLUSIVE JOIN:
      -Definition : this is not a standard sql join type,but it can be simluted by using a right join and 
      filtering out the matched records from the left table.
      
      -purpose : to retrieve records from the right table  that do not have corresponding  reciords  in the right table.
      
      example:
      select a.employeeid,a.name
      from employee 
      right join departments b on a.departmentid = b.departmentid
      where b.department is null;
      
      7.CROSS join:
      -defintion : the cross join keywords  return the cartesian product of both tables,meaning it  combines
      every row of first table with every roe of the second table.
      
      -purpose: to genarate  a combination of all  records  from tables.\, which can be useful in certain
      scenarios but may result in a large  numbers of rows in the result set.
      
      example:
      select a.employeeid,b.departmentname
      from employee a 
      cross join departments b;
      
      8.SELF JOIN:
      -definition : a self join is a regular  join but the table is joined with itself.
      
      -purpose: to compare rows within the same table,such as funding  hierarchiacal relationsahips or related
      data within the same dataset.
      example:
      select a.employeeid,a.anme,b.name as managername
      from employee a
      inner join employee b on a.managerid = b.employeeid;
      
      
In summary, joins are a powerful feature in SQL that allow you to combine data from multiple tables based on 
relationships between them. Understanding how to use different types of joins effectively is crucial for 
querying relational databases.
*/

-- Create a table named 'student' with an ID and name
CREATE TABLE student (
    id INT PRIMARY KEY,          -- 'id' is the primary key and must be unique
    student_name VARCHAR(50)    -- 'student_name' can hold up to 50 characters
);

-- Insert records into the 'student' table
INSERT INTO student VALUES 
(101, 'Kirti'),                -- ID 101 for student Kirti
(102, 'Ravi'),                 -- ID 102 for student Ravi
(103, 'Lavish'),               -- ID 103 for student Lavish
(104, 'Trisha');               -- ID 104 for student Trisha

-- Retrieve all records from the 'student' table
SELECT * FROM student;

-- Create a table named 'course' with an ID and course name
CREATE TABLE course (
    id INT PRIMARY KEY,          -- 'id' is the primary key and must be unique
    course_name VARCHAR(80)      -- 'course_name' can hold up to 80 characters
);
      
    -- Insert records into the 'course' table
INSERT INTO course VALUES
(107, 'English'),              -- ID 107 for course English
(102, 'Python'),               -- ID 102 for course Python
(104, 'Hindi'),                -- ID 104 for course Hindi
(108, 'Maths');                -- ID 108 for course Maths

-- Retrieve all records from the 'course' table
SELECT * FROM course;
  
-- Inner Join (also known as Simple Join / Equi Join): 
-- retrieves records that have matching values in both tables involved in the join.
-- Retrieve records with matching IDs from both tables
#===========================================INNER JOIN==================================================================
alter table student change column id student_id int ;

SELECT student_id, student_name, course_name 
FROM student 
INNER JOIN course ON student.student_id = course.id;    

select course.id,  student_name, course_name 
FROM course 
inner join student on student.student_id = course.id;    
#==========================================LEFT JOIN=========================================================================

-- Left Join (also known as Left Outer Join): 
-- retrieves all records from the left table and the matched records from the right table.
-- Retrieve all records from 'student' and matching records from 'course'
SELECT student.student_id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.student_id = course.id;
#================================================RIGHT JOIN=============================================================
-- Right Join (also known as Right Outer Join): 
-- retrieves all records from the right table and the matched records from the left table.
-- Retrieve all records from 'course' and matching records from 'student'
SELECT course.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.student_id = course.id;

#====================================================FULL OUTER JOIN======================================================

-- Full Join (also known as Full Outer Join): 
-- It retrieves all records from both tables, matching rows where possible, and filling in NULL values where 
-- there are no matches.
-- Retrieve all records from both tables, with NULLs where there are no matches
SELECT student.student_id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.student_id = course.id
UNION
SELECT student.student_id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.student_id = course.id;
#================================================LEFT-EXCLUSIVE JOIN===============================================================

-- Left Exclusive Join (also known as Left Anti Join):
-- retrieves rows from the left table that do not have matching rows in the right table.  
-- Retrieve records from 'student' that do not have matches in 'course'
SELECT student.STUDENT_id, student_name, course_name 
FROM student 
LEFT JOIN course ON student.STUDENT_id = course.id
WHERE course.id IS NULL;
#=================================================RIGHT-EXCLUSIVE JOIN========================================================================
-- Right Exclusive Join (also known as Right Anti Join): 
-- retrieves rows from the right table that do not have matching rows in the left table. 
-- Retrieve records from 'course' that do not have matches in 'student'
SELECT course.id, student_name, course_name 
FROM student 
RIGHT JOIN course ON student.student_id = course.id
WHERE student.student_id IS NULL;
#=========================================SELF JOIN ==================================================================================
-- Self Join: (Inner Self Join/Outer Self Join/Self-Reference Join/Self-Relating Join/Table Self Join)
-- Self Join is a special case of a join that allows a table to be joined with itself. 
-- Join the 'student' table with itself based on matching IDs
SELECT student.student_id, student_name, course_name 
FROM student, course 
WHERE student.student_id = course.id;
#================================================CROSS JOIN====================================================================

-- Cross Join:(also known as a Cartesian Join or Cartesian Product Join) 
-- A Cross Join retrieves the Cartesian product of two tables, meaning every row from the first table is 
-- combined with every row from the second table.
-- Retrieve the Cartesian product of 'student' and 'course' tables
SELECT student.student_id, student_name, course_name 
FROM  student
CROSS JOIN course;


SELECT student.student_id, student_name, course_name 
FROM  course
CROSS JOIN student;
#=================================================TABLES-1======================================================================
-- Create the faculty table to store information about faculty members
CREATE TABLE faculty (
  faculty_id INT PRIMARY KEY, -- Unique identifier for each faculty
  faculty_name VARCHAR(255), -- Name of the faculty
  faculty_description TEXT, -- Description of the faculty
  dean VARCHAR(255), -- Dean of the faculty
  faculty_location VARCHAR(255), -- Location of the faculty
  faculty_contact_info VARCHAR(255) -- Contact information for the faculty
);
-- Insert sample data into the faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_description, dean, faculty_location, 
faculty_contact_info) VALUES
(1, 'Faculty of Science', 'Covers various scientific disciplines', 'Dr. Alice Smith', 'Building A', 
'alice.smith@example.com'),
(2, 'Faculty of Engineering', 'Focuses on engineering and technology', 'Dr. Bob Johnson', 'Building B', 
'bob.johnson@example.com'),
(3, 'Faculty of Arts', 'Includes humanities and social sciences', 'Dr. Carol Williams', 'Building C', 
'carol.williams@example.com'),
(4, 'Faculty of Business', 'Offers business and management courses', 'Dr. David Brown', 'Building D',
'david.brown@example.com'),
(5, 'Faculty of Education', 'Dedicated to teacher training and education studies', 'Dr. Eva Davis', 
'Building E', 'eva.davis@example.com');

#==============================================table-2=================================================
-- Create the department table to store information about departments within faculties
CREATE TABLE department (
  department_id INT PRIMARY KEY, -- Unique identifier for each department
  department_name VARCHAR(255), -- Name of the department
  department_description TEXT, -- Description of the department
  faculty_id INT, -- Foreign key referencing the faculty
  department_head VARCHAR(255), -- Head of the department
  department_location VARCHAR(255), -- Location of the department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the department table
INSERT INTO department (department_id, department_name, department_description, faculty_id, department_head, 
department_location) VALUES(1, 'Department of Physics', 'Study of matter and energy', 1, 'Dr. Emily White', 'Room 101'),
(2, 'Department of Computer Science', 'Focus on computing and programming', 1, 'Dr. Frank Green', 'Room 102'),
(3, 'Department of Civil Engineering', 'Deals with infrastructure and construction', 2, 'Dr. Grace Black', 
'Room 201'),
(4, 'Department of Mechanical Engineering', 'Focus on machinery and mechanics', 2, 'Dr. Henry Blue', 'Room 202'),
(5, 'Department of History', 'Study of past events and societies', 3, 'Dr. Irene Red', 'Room 301');

#===================================================table-3====================================================
-- Create the students table to store information about students
CREATE TABLE students (
  student_id INT PRIMARY KEY, -- Unique identifier for each student
  student_name VARCHAR(255), -- Name of the student
  student_email VARCHAR(255), -- Email of the student
  department_id INT, -- Foreign key referencing the department
  enrollment_year INT, -- Year of enrollment
  faculty_id INT, -- Foreign key referencing the faculty
  FOREIGN KEY (department_id) REFERENCES department(department_id), -- Establishing relationship with department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);
-- Insert sample data into the students table
INSERT INTO students (student_id, student_name, student_email, department_id, enrollment_year, faculty_id) VALUES
(1, 'John Doe', 'john.doe@example.com', 1, 2021, 1),
(2, 'Jane Smith', 'jane.smith@example.com', 2, 2020, 1),
(3, 'Alice Johnson', 'alice.johnson@example.com', 1, 2022, 1),
(4, 'Bob Brown', 'bob.brown@example.com', 3, 2021, 2),
(5, 'Charlie Davis', 'charlie.davis@example.com', 4, 2023, 2);
#==============================================table-4==============================================

-- Table-4
-- Create the salary table to store salary information for faculty members
CREATE TABLE salary (
  salary_id INT PRIMARY KEY, -- Unique identifier for each salary record
  faculty_id INT, -- Foreign key referencing the faculty
  amount DECIMAL(10, 2), -- Salary amount
  payment_date DATE, -- Date of salary payment
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the salary table
INSERT INTO salary (salary_id, faculty_id, amount, payment_date) VALUES
(1, 1, 75000.00, '2023-01-15'),
(2, 2, 80000.00, '2023-01-15'),
(3, 3, 70000.00, '2023-01-15'),
(4, 4, 72000.00, '2023-01-15'),
(5, 5, 68000.00, '2023-01-15');
#=======================================table-5========================================================
-- create the marks table to store marks obtained by students
CREATE TABLE marks (
  marks_id INT PRIMARY KEY, -- Unique identifier for each marks record
  student_id INT, -- Foreign key referencing the student
  subject_name VARCHAR(255), -- Name of the subject
  marks_obtained INT, -- Marks obtained by the student
  semester INT, -- Semester in which the marks were obtained
  FOREIGN KEY (student_id) REFERENCES students(student_id) -- Establishing relationship with students
);

-- Insert sample data into the marks table
INSERT INTO marks (marks_id, student_id, subject_name, marks_obtained, semester) VALUES
(1, 1, 'Physics', 85, 1),
(2, 1, 'Mathematics', 90, 1),
(3, 2, 'Computer Science', 88, 2),
(4, 3, 'Physics', 92, 1),
(5, 4, 'Civil Engineering', 75, 2),
(6, 5, 'Business Management', 80, 1);


#===============================================INNER-JOINS OF MULTIPLE TABLES==========================================================

-- 1."Inner Join" (also known as Simple Join / Equi Join): 
-- retrieves records that have matching values in both tables involved in the join.

#1
-- join (2 tables)
SELECT faculty.faculty_id, faculty_name, student_name 
FROM students
INNER JOIN faculty ON students.faculty_id = faculty.faculty_id;
select * from faculty;
select * from students;

#2:
-- join (2 tables)
SELECT faculty.*, student_name 
FROM students
INNER JOIN faculty ON students.faculty_id = faculty.faculty_id;

#3
-- join(3 tables)
SELECT T1.faculty_id, faculty_name, department_name, student_name 
FROM students as T1
INNER JOIN faculty as T2 ON T1.faculty_id = T2.faculty_id
INNER JOIN department as T3 ON T2.faculty_id = T3.faculty_id;

#4
-- join (4 tables-department_id = st.department_id;)
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
INNER JOIN students s ON m.student_id = s.student_id
INNER JOIN department d ON s.department_id = d.department_id
INNER JOIN faculty f ON d.faculty_id = f.faculty_id;

SELECT f.faculty_name, s.amount, d.department_name, st.student_name
FROM salary s
INNER JOIN faculty f ON s.faculty_id = f.faculty_id
INNER JOIN department d ON f.faculty_id = d.faculty_id
INNER JOIN students st ON  d.department_id = st.department_id;

#5
-- join (5 tables)
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
INNER JOIN students st ON m.student_id = st.student_id
INNER JOIN department d ON st.department_id = d.department_id
INNER JOIN faculty f ON d.faculty_id = f.faculty_id
INNER JOIN salary s ON f.faculty_id = s.faculty_id;
select * from department;
#=========================================left-join of multiple tables===================================================================
-- Left Join (also known as Left Outer Join): 
-- retrieves all records from the left table and the matched records from the right table.
#1
-- Join 2 Tables: marks and students
SELECT T1.student_name, T2.subject_name, T2.marks_obtained
FROM students T1
LEFT JOIN marks T2 ON T1.student_id = T2.student_id;
#2
-- Join 2 Tables: salary and faculty
SELECT T1.faculty_name, T2.amount
FROM faculty T1
LEFT JOIN salary T2 ON T1.faculty_id = T2.faculty_id;
#3
-- Join 3 Tables: students, department, and faculty
SELECT T1.student_name, T2.department_name, T3.faculty_name
FROM students T1
LEFT JOIN department T2 ON T1.department_id = T2.department_id
LEFT JOIN faculty T3 ON T2.faculty_id = T3.faculty_id;

select * from students left join department on students.department_id=department.department_id;
select * from department;
#3
 -- Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
LEFT JOIN department d ON s.department_id = d.department_id;
#4
-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id;
#4
-- Join 4 Tables: salary, faculty, department, and students
SELECT f.faculty_name, s.amount, d.department_name, st.student_name
FROM faculty f
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
LEFT JOIN department d ON f.faculty_id = d.faculty_id
LEFT JOIN students st ON d.department_id = st.department_id;
#5
-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM students st
LEFT JOIN marks m ON st.student_id = m.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id;
#========================================================RIGHT JOIN OF MULTIPLE JOINS=====================================================
-- Right Join (also known as Right Outer Join): 
-- retrieves all records from the right table and the matched records from the left table.

-- Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
RIGHT JOIN marks m ON s.student_id = m.student_id;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id;

--  Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

--  Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 4 Tables: salary, faculty, department, and students
SELECT f.faculty_name, s.amount, d.department_name, st.student_name
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id
RIGHT JOIN department d ON f.faculty_id = d.faculty_id
RIGHT JOIN students st ON d.department_id = st.department_id;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
RIGHT JOIN students st ON m.student_id = st.student_id
RIGHT JOIN department d ON st.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
RIGHT JOIN salary s ON f.faculty_id = s.faculty_id;

#=================================================FUL-OUTER JOIN OF MUTIPLE JOINS==================================================
-- Full Join (also known as Full Outer Join): 
-- It retrieves all records from both tables, matching rows where possible, and filling in NULL values where there are no matches.
-- Retrieve all records from both tables, with NULLs where there are no matches

--  Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
UNION
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
RIGHT JOIN marks m ON s.student_id = m.student_id;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM faculty f
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
UNION
SELECT f.faculty_name, s.amount
FROM faculty f
RIGHT JOIN salary s ON f.faculty_id = s.faculty_id;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
UNION
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
UNION
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id;

--  Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
UNION
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
RIGHT JOIN department d ON s.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
LEFT JOIN students st ON m.student_id = st.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
UNION
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
RIGHT JOIN students st ON m.student_id = st.student_id
RIGHT JOIN department d ON st.department_id = d.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
RIGHT JOIN salary s ON f.faculty_id = s.faculty_id;


#==================================================LEFT-EXCLUSIVE OF MULTIPLE JOINS============================================
-- Left Exclusive Join (also known as Left Anti Join):
-- retrieves rows from the left table that do not have matching rows in the right table.  

-- Join 2 Tables: marks and students#------------------------------------------doubt---------------------------------------
select * from students;
select * from marks;

SELECT s.student_name, m.subject_name, m.marks_obtained
FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id
WHERE m.student_id IS NULL; 

#=================================================================================================================
-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM faculty f
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
WHERE s.faculty_id IS NULL;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM students s
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL;

-- Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM marks m
LEFT JOIN students s ON m.student_id = s.student_id
LEFT JOIN department d ON s.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM marks m
LEFT JOIN students st ON m.student_id = st.student_id
LEFT JOIN department d ON st.department_id = d.department_id
LEFT JOIN faculty f ON d.faculty_id = f.faculty_id
LEFT JOIN salary s ON f.faculty_id = s.faculty_id
WHERE d.department_id IS NULL AND f.faculty_id IS NULL AND s.faculty_id IS NULL;


#===========================================RIGHT-EXCLUSIVE OF MULTIPLE JOIN ===========================================================
-- Right Exclusive Join (also known as Right Anti Join): 
-- retrieves rows from the right table that do not have matching rows in the left table. 

-- Join 2 Tables: marks and students
SELECT s.student_name, m.subject_name, m.marks_obtained
FROM marks m
RIGHT JOIN students s ON m.student_id = s.student_id
WHERE m.student_id IS NULL;

-- Join 2 Tables: salary and faculty
SELECT f.faculty_name, s.amount
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id
WHERE s.faculty_id IS NULL;

-- Join 3 Tables: students, department, and faculty
SELECT s.student_name, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE s.student_id IS NULL;

-- Join 3 Tables: marks, students, and department
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN marks m ON s.student_id = m.student_id
WHERE s.student_id IS NULL;

-- Join 4 Tables: marks, students, department, and faculty
SELECT s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
FROM department d
RIGHT JOIN students s ON d.department_id = s.department_id
RIGHT JOIN marks m ON s.student_id = m.student_id
RIGHT JOIN faculty f ON d.faculty_id = f.faculty_id
WHERE s.student_id IS NULL;

-- Join 5 Tables: marks, students, department, faculty, and salary
SELECT st.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name, s.amount
FROM salary s
RIGHT JOIN faculty f ON s.faculty_id = f.faculty_id
RIGHT JOIN department d ON f.faculty_id = d.faculty_id
RIGHT JOIN students st ON d.department_id = st.department_id
RIGHT JOIN marks m ON st.student_id = m.student_id
WHERE st.student_id IS NULL;



