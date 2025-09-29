use zoom;
/*
* `Employee(emp_id, name, gender, dob, hire_date, dept_id, salary, email)`
* `Department(dept_id, dept_name, location)`
* `Project(proj_id, proj_name, start_date, end_date, budget, dept_id)`
* `Assignment(assign_id, emp_id, proj_id, role, hours_worked)`
*/

create table Department(
dep_id int primary key,
dep_name varchar(100),
location varchar(100)
);

INSERT INTO Department (dep_id, dep_name, location) VALUES
(01, 'IT', 'Mumbai'),
(02, 'Finance', 'Pune'),
(03, 'HR', 'Bangalore');

create TABLE Employee(
emp_id int auto_increment primary key,
name varchar(255),
gender varchar(10),
dob date,
hire_date date,
dep_id int,
salary int,
email varchar(100)
);

INSERT INTO Employee (name, gender, dob, hire_date, dep_id, salary, email) VALUES
('Aishwarya Rao', 'F', '1992-05-14', '2018-06-01', 1, 75000, 'aishwarya.rao@corp.com'),
('Rohan Mehta', 'M', '1988-11-23', '2016-03-15', 2, 82000, 'rohan.mehta@corp.com'),
('Sneha Kulkarni', 'F', '1990-07-30', '2019-01-10', 3, 68000, 'sneha.kulkarni@corp.com'),
('Arjun Desai', 'M', '1995-02-17', '2020-09-05', 1, 72000, 'arjun.desai@corp.com'),
('Priya Nair', 'F', '1993-12-08', '2021-04-20', 2, 70000, 'priya.nair@corp.com'),
('Karan Joshi', 'M', '1987-08-19', '2015-07-12', 3, 79000, 'karan.joshi@corp.com'),
('Meera Shah', 'F', '1994-03-22', '2022-02-01', 1, 67000, 'meera.shah@corp.com'),
('Vikram Patel', 'M', '1991-09-10', '2017-11-25', 2, 88000, 'vikram.patel@corp.com'),
('Neha Sinha', 'F', '1989-06-05', '2014-05-18', 3, 73000, 'neha.sinha@corp.com'),
('Amit Verma', 'M', '1996-01-29', '2023-06-15', 1, 71000, 'amit.verma@corp.com');


create table project(
proj_id int auto_increment primary key
, proj_name varchar(255)
, start_date date
, end_date date
, budget  int
, dept_id int null,
foreign key (dept_id) references Department(dep_id)
);

INSERT INTO Project (proj_name, start_date, end_date, budget, dept_id) VALUES
('Apollo Migration', '2023-01-01', '2023-12-31', 500000, 1),
('Budget Tracker', '2023-03-15', '2023-09-30', 300000, 2),
('Talent Portal', '2023-05-01', '2023-11-30', 250000, 3),
('Cloud Integration', '2024-01-10', '2024-08-20', 600000, 1),
('Compliance Audit', '2023-07-01', '2023-10-15', 200000, 2),
('Employee Wellness', '2023-04-01', '2023-12-01', 150000, 3);

CREATE TABLE Assignment (
  assign_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT null,
  proj_id INT null,
  role VARCHAR(100),
  hours_worked INT,
  FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) on delete set null on update cascade ,
  FOREIGN KEY (proj_id) REFERENCES Project(proj_id)on delete set null on update cascade
);


INSERT INTO Assignment (assign_id, emp_id, proj_id, role, hours_worked) VALUES
(1, 1, 1, 'Lead Developer', 1200),
(2, 2, 2, 'Financial Analyst', 950),
(3, 3, 3, 'HR Coordinator', 800),
(4, 4, 4, 'DevOps Engineer', 1100),
(5, 5, 2, 'Accountant', 700),
(6, 6, 3, 'Recruitment Lead', 850),
(7, 7, 1, 'Frontend Developer', 900),
(8, 8, 4, 'Cloud Architect', 1000),
(9, 9, 5, 'Compliance Officer', 750),
(10, 10, 6, 'Wellness Consultant', 600);

-- TYPE 1

-- 1. HR requests a `Department` table with proper datatypes and constraints. Write the DDL query.
-- Done above
-- 2. To avoid duplicate emails, enforce a **UNIQUE constraint** on `Employee.email`.
alter table Employee add constraint unique_email unique(email);

-- 3. Insert **3 sample employees** into the `Employee` table.
INSERT INTO Employee (name, gender, dob, hire_date, dep_id, salary, email) VALUES
('dUMMY1', 'F', '1992-05-14', '2018-06-01', 1, 75000, 'DUMMY1@corp.com'),
('DUMMY 2', 'M', '1988-11-23', '2016-03-15', 2, 82000, 'DUMMY2@corp.com'),
('DUMMY3', 'F', '1990-07-30', '2019-01-10', 3, 68000, 'DUMMY3@corp.com');


-- 4. The HR department decides to increase salaries by **10%**. Write the query.
select * FROM EMPLOYEE;
update Employee
set salary = salary + salary*0.10;

set sql_safe_updates = 0;
-- 5. Management wants to remove employees not assigned to any project. Write the query.
-- 6. Finance needs a list of employees with salary **between 50,000 and 80,000**.
select * from Employee where salary between 50000 and 80000;
-- 7. The recruiter wants names of employees starting with **‘A’**.
select * from Employee where name like 'A%';
-- 8. Show employees hired **after 1st Jan 2020**.
select * from Employee where hire_date > '2020-01-01';

-- 9. Retrieve all **unique job roles** from the `Assignment` table.
select distinct role from assignment;

-- 10. Count the total number of employees in each department.
select count(*) from employees group by department;

-- 11. Identify employees with **no department assigned** (`dept_id IS NULL`).
select * from Employee where dep_id is null;

-- 12. Sort all employees by salary in **descending order**.
select * from Employee order by salary desc;

-- 13. Display the **top 3 highest-paid employees**.
select * from Employee order by salary desc limit 3;

-- 14. List employees **not belonging to IT department**.
with cte_emp_dep as(
select * from department where dep_name !='IT'
)
SELECT emp_id, name, gender, dob, hire_date, dep_id, salary, email
from Employee inner join cte_emp_dep using(dep_id);

-- 15. Show employees with **salary < 60,000 and role = ‘Developer’**.

select * from Employee where salary > 60000;
#

-- 16. Find employees earning **above the company’s average salary**.
select * FROM Employee where salary > (
select avg(salary) from Employee
);

-- 17. Identify employees **born in March**.
select * from Employee where month(dob)=3 ;

-- 18. Compute **total salary per department**.
select dep_id,sum(salary) as total_salary_per_dep
from Employee
group by dep_id;

-- 19. Use `CASE` to classify employees as **Low, Medium, High** salary.
select emp_id,name,salary,
case
when salary >=80000 then 'HIGH'
when salary >=50000 then 'MEDIUM'
ELSE 'LOW'
END AS cat_salary from Employee;
-- 20. Verify if the **Finance department** exists in the database.
select * FROM DEPARTMENT
WHERE dep_name ='FINANCE';


-- CATEGORY 2 Section-2: Built-in & User Defined Functions, Joins, Subqueries, Alias (20 Questions)

-- 21. HR wants to know the **age of each employee**.
select * from Employee;
-- 22. Display the **current date** from the system.
select current_date();
-- 23. Show employee **name + email** concatenated as one column.
select concat(name," ",email) as Emp_name_email from Employee;

-- 24. Display only the **first 5 characters** of employee names.
select left(name,5) from Employee;#================================================================

-- 25. Print employee names in **uppercase**.
select upper(name) from Employee;

-- 26. Calculate **duration (days)** of each project.
select proj_name,datediff(end_date,start_date) from project;

-- 27. Find employees earning **more than ‘Amit’** using a subquery.
select * FROM Employee where salary > (
select salary from Employee where name ='Amit Verma'
);

-- 28. Display employees earning more than the **average salary of their own department**.
select name,employees from ASSIGNMENT where salary>(select avg(salary) from assignment);
-- 29. Find employees working on **multiple projects**.
select * from ASSIGNMENT;
select * from employee;


#30. Retrieve **highest-paid employee** in each department.
select * from employee order by salary desc limit 1;
#31. Join `Employee` and `Department` to show employee names with department names.
select name,dep_name from employee join department on employee.dep_id=department.dep_id;
#32. Show all projects with their department names (**INNER JOIN**).
select dep_name,proj_name from project join department on project.dep_id=department.dep_id;
#33. Display employees with their assigned projects (including employees without projects) (**LEFT JOIN**).
select * from employee as e left join assignment as a on e.emp_id=a.emp_id;
#34. List all departments and their employees (including departments with no employees) (**RIGHT JOIN**).
select * from employee as e right join department as d on e.dep_id=d.dep_id;
#35. Retrieve employees working on **Project Alpha**.
select * from employee as e left join  assignment as a on  e.emp_id=a.emp_id 
left join project as p on a.proj_id=a.proj_id;
#36. Rename columns in output using alias: employee as `emp_name`, department as `dept_title`.
select name,dep_name from employee as e left join assignment as a on e.emp_id=a.emp_id
left join department as d on d.dep_id = a.dep_id;
#37. Write a **User Defined Function** `get_bonus(salary)` to return 10% bonus.
delimiter //
create function get_bonus(salary int)
returns int
deterministic
begin
    return salary=salary*10;
end //
delimiter ;
select get_bonus(1);
#38. Calculate **average project budget** department-wise.
SELECT d.dept_name, 
       AVG(p.budget) AS avg_budget
FROM project AS p
JOIN department AS d 
     ON p.dept_id = d.dept_id
GROUP BY d.dept_name;

#39. Display employees with the **second-highest salary**.
select * from employee order by salary desc limit 1,1;
#40. Find employees whose names have exactly **5 characters**.
select left(name,5) from employee;

-- caterogy 3: triggers,windiows,store procedure ..etc

#41. Create a **View** showing employee name, department, and project role.
create view employees_name as

select name ,dep_name,role
from employee as e left join  department as d on e.dep_id=a.emp_id
left join project as p on p.dept_id=p_dep_id;

#42. Write a **Stored Procedure** to fetch all employees of a given department.

DELIMITER //
CREATE PROCEDURE GetEmployeesByDeptId(IN in_dept_id INT)
BEGIN
  SELECT
    e.emp_id,
    e.name,
    e.gender,
    e.dob,
    e.hire_date,
    e.dept_id,
    d.dept_name,
    e.salary,
    e.email
  FROM Employee e
  LEFT JOIN Department d ON e.dept_id = d.dept_id
  WHERE e.dept_id = in_dept_id
  ORDER BY e.name;
END //
DELIMITER ;
call GetEmployeesByDeptId(2);

#43. Use a **CTE** to list employees with salary above 75,000 and their departments.
WITH high_paid AS (
  SELECT
    e.emp_id,
    e.name,
    e.salary,
    e.dept_id
  FROM Employee e
  WHERE e.salary > 75000
)
SELECT
  h.emp_id,
  h.name,
  h.salary,
  d.dept_id,
  d.dept_name
FROM high_paid h
LEFT JOIN Department d ON h.dept_id = d.dept_id
ORDER BY h.salary DESC, h.name;

#44. Rank employees by salary **within each department** using a window function.
#45. Create a **Trigger** to log salary updates into an audit table.
#46. Demonstrate use of **SAVEPOINT** and rollback to a savepoint in a transaction.
#47. Grant `SELECT` and `INSERT` privileges on `Employee` to user `hr_user`.
#48. Revoke `INSERT` privilege from `hr_user`.
#49. Use regex to find employees with emails ending in `@gmail.com`.
#50. Use regex to retrieve employees with names containing **only alphabets**.
SELECT emp_id, name
FROM Employee
WHERE name REGEXP '^[A-Za-z]+$';





