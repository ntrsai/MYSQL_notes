use airline;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    grade CHAR(2)
);

INSERT INTO students VALUES
(1, 'Amit', 20, 'CSE', 'A'),
(2, 'Riya', 21, 'ECE', 'B'),
(3, 'Karan', 22, 'IT', 'A'),
(4, 'Neha', 23, 'MECH', 'C'),
(5, 'Raj', 20, 'EEE', 'B'),
(6, 'Pooja', 21, 'CSE', 'A'),
(7, 'Vikram', 22, 'IT', 'B'),
(8, 'Sneha', 23, 'ECE', 'C'),
(9, 'Ankit', 24, 'MECH', 'B'),
(10, 'Priya', 20, 'EEE', 'A');
