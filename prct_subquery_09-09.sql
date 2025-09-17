use airline;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT
);
INSERT INTO employees VALUES
(1, 'Alice',   70000, 10),
(2, 'Bob',     50000, 10),
(3, 'Charlie', 90000, 20),
(4, 'Diana',   85000, 20),
(5, 'Eve',     60000, 10),
(6, 'Frank',   95000, 30),
(7, 'Grace',   40000, 30);

#queries----------------------------------------
select * from employees;
-- Find employees who earn more than the average salary
#single row subquery:
select avg(salary) from employees ;
select name,salary from employees where salary >(select avg(salary) from employees);
#multiple rows subqueries:

-- Employees who earn the minimum salary in their department
select  name,salary,dept_id from employees where salary in (select min(salary) from employees);








