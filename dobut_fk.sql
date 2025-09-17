use xyz;
create table stu(
id int primary key,
name varchar(70),
marks int not null,
age int check(age > 18)
);
INSERT INTO stu (id, name, marks,age) VALUES (1, 'Anjali', 88,28);
INSERT INTO stu (id, name, marks,age) VALUES (2, 'Ravi', 75,21);
INSERT INTO stu (id, name, marks,age) VALUES (3, 'Priya', 92,29);
INSERT INTO stu (id, name, marks,age) VALUES (4, 'Amit', 64,24);
INSERT INTO stu (id, name, marks,age) VALUES (5, 'Neha', 81,22);

drop table marks;
drop table stu;
select * from stu;
alter table stu add column (email varchar(60),pincode bigint,address varchar(80));
update stu
set email = 'sai@gmail',pincode = 2552,address = 'besii'
where id in(1,2,3);

update stu
set 
email=case
when id =1 then 'sai123@gmail'
when id =2 then 'ntr@gmaul'
end
where id in(1,2);


create table marks(
mark_id int primary key,
sub_name varchar(80),
stu_id int,
constraint fk_student
foreign key (stu_id) references stu(id)
on delete set null
on update cascade);

INSERT INTO marks (mark_id, sub_name, stu_id) VALUES (101, 'Math', 1);
INSERT INTO marks (mark_id, sub_name, stu_id) VALUES (102, 'Science', 2);
INSERT INTO marks (mark_id, sub_name, stu_id) VALUES (103, 'English', 3);
INSERT INTO marks (mark_id, sub_name, stu_id) VALUES (104, 'History', 4);
INSERT INTO marks (mark_id, sub_name, stu_id) VALUES (105, 'Geography', 5);

drop table marks;
select * from marks;


CREATE TABLE Departmentss (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    age int,
    constraint age_check check(age > 18)
);
INSERT INTO Departmentss VALUES (1, 'HR',22);
INSERT INTO Departmentss VALUES (2, 'IT',32);
INSERT INTO Departmentss VALUES (3, 'Finance',33);
INSERT INTO Departmentss VALUES (4, 'HR',12);

CREATE TABLE Employeesss (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary INT,
    dept_id INT,

    CONSTRAINT fk_dept
        FOREIGN KEY (dept_id) REFERENCES Departmentss(dept_id)
        ON DELETE cascade
        ON UPDATE CASCADE
);

INSERT INTO Employeesss VALUES (101, 'Anjali', 50000, 1);
INSERT INTO Employeesss VALUES (102, 'Ravi', 60000, 2);
INSERT INTO Employeesss VALUES (103, 'Neha', 55000, 3);
INSERT INTO Employeesss VALUES (104, 'Amit', 62000, 2);
INSERT INTO Employeesss VALUES (105, 'Priya', 58000, 1);

select * from Employeesss;
select * from Departmentss;
select * from marks;
select * from stu;

drop table Employeesss;
drop table Departmentss;
delete from Employeesss where dept_id = 1;
delete from marks where stu_id = 1;
alter table stu drop constraint age ;
alter table Departmentss drop constraint age_check;
SET SQL_SAFE_UPDATES = 1;
delete from stu;
delete from stu where id =1;
SET SQL_SAFE_UPDATES = 0;
#..................................................................................
#CONSTRAINT chk_EmailFormat CHECK (Email LIKE '%_@__%.__%'),

-- ---------------------------------------------------------pratice ----------------------------------------------------------
use airline;
create table abhi_bus (
id int primary key auto_increment,
name varchar(20),
location varchar(60),
destination varchar(30) not null,
date_of_travel date);