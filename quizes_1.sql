create database devlearn_comapny;#create the database

use devlearn_comapny;#use them the databases

drop database devlearn_comapny; #remove the database 


#table-1  --->create the employee table
create table employee(
id int primary key ,
name varchar(60) not null,
salary bigint not null,
location varchar(80) not null,
married_status varchar(80));

#insert the values 
insert into employee values (1,'sai',25000,'mankoli','no'),(2,'raju',38000,'besii','no'),(3,'mahi',34000,'sompeta','yes'),
(4,'arjun',16000,'thane','no'),(5,'rahul',14000,'korlam','yes');

#queries :select,alter,update,delete,oderby ,group by
select * from employee;#1
select name from employee where id >3;#2
select count(name) from employee where married_status = 'yes';#3
select name,location from employee 
order by id;#4
select * from employee where location in('thane','mankoli');#5
alter table employee add column age int not null;#6
alter table employee change column age employ_age int;#7
alter table employee modify location char(80) not null;#8
alter table employee modify salary int not null;#9
alter table employee rename to employee_company;#10
alter table employee_company drop column employ_age ;#11

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES= 1;

update employee_company
set married_status = 'yes'
where married_status ='no';#12

update employee_company
set employ_age =21
where id in(1,2,3,4,5);#13

update employee_company
set employ_age = employ_age + 21
where id = 2;#14

update employee_company
set salary= salary *2
where id =3;#15

delete from employee_company where id =1;#16
delete from employee_company where salary < 12000;#17
delete from employee_company where salary in(14000);#18
drop table  employee_company;#19
truncate table  employee_company;#20


#=====================================================================================================================

#table 2 --> create table  staff 
create table staff(
staff_id int primary key ,
names varchar(80),
staff_salary bigint not null,
contact bigint,
address varchar(80));

#insert the values 
insert into staff values(11,'suraj',16000,8989897654,'virar'),(12,'ramesh',170000,8992929292,'mankoli'),
(13,'rohit',50000,8989765467,'sompeta'),(14,'virat',560000,987777776,'korlam'),(15,'roshan_kumar',45000,9897666554,'mankoli');

#queries:
select * from staff;#1
select names from staff where staff_id >13;#2
select count(names) from staff where address = 'virar';#3
select names,address from staff 
order by staff_id;#4
select * from staff where address in('virar','mankoli');#5
alter table staff add column age int not null;#6
alter table staff_company change column age staff_age int;#7
alter table staff modify address char(80) not null;#8
alter table staff modify contact bigint not null;#9
alter table staff rename to staff_companies;#10
alter table staff_company drop column staff_age ;#11
update staff_company
set address = 'kalyan'
where address='mankoli';#12

update staff
set staff_age = 21
where staff_id =11;#13

update staff
set staff_age = staff_age + 21
where staff_id > 18;#14

use devlearn;
select * from staff_companies;
update staff_company
set staff_salary= staff_salary * 2
where staff_id =13;#15

delete from staff_companies where id =11;#16
delete from staff_companies where staff_salary < 12000;#17
delete from staff_companies where staff_salary in(14000);#18
drop table  staff;#19
truncate table  staff_companies;#20


#==================================================================================================================


#table 3 --> create table department
create table department01111(
id int primary key,
emp_id int null,
dep_name varchar(30) not null,
staff_id  int,
contact bigint,
constraint fk_emp
foreign key(emp_id) references employee(id)
on delete set null
on update cascade,
constraint fk_staff
foreign key(staff_id) references staff(staff_id)
on delete cascade
on update cascade);

#insert the values
insert into department values(21,1,'hr',12,988282992),(22,2,'developer',11,9882998992),(23,3,'python developer',13,788282992),
(24,5,'project_lead',14,788282992),(25,4,'hr',15,678282992);


#queries-------------------------------------------------

select * from department01111;#1
select name from department where id >23;#2
select count(dep_name) from department where contact = 988282992;#3
select dep_name,contact from department
order by id;#4
select * from department where contact in(988282992);#5
alter table department add column age int not null;#6
alter table department change column age dep_age int;#7
alter table department modify address char(80) not null;#8
alter table department modify contact int not null;#9
alter table department rename to department_company;#10
alter table department_company drop column dep_age ;#11
update department_company
set contact = '98828828289'
where address='988282992';#12

update department_company
set dep_age =21
where id in(11,12,13,14,15);#13

update department_company
set dep_age =dep_age + 21
where id = 22;#14

update staff_comapny
set contact= 28282221
where id =23;#15

delete from department_company where id =21;#16
delete from department_company where id >2 ;#17
delete from department_company where contact in(9828889822);#18
drop table  department_company;#19
truncate table  department_company;#20




#table 4 ---> create table projects
create table projects(
id int primary key,
emp_name varchar(49),
dep_name varchar(50),
status varchar(70),
emp_id int ,
foreign key(emp_id) references employee(id)
on delete set null
on update cascade
);
#insert the values 
insert into projects values(31,'raju','developer','completed',2),(32,'sai','python developer','completed',1),
(33,'mahi','java developer','In-completed',3),(34,'arjun','hr','completed',4),(35,'rahul','developer','completed',5);

#queriess------------------------------------------------
select * from projects;#1
select name from projects where id >23;#2
select count(*) from projects where status = 'completed' ;#3
select emp_name ,dep_name from projects
order by id;#4
select * from projects where status in('In-completed');#5
alter table projects add column age int not null;#6
alter table projects change column age emp_age int;#7
alter table projects modify address char(80) not null;#8
alter table projects modify status char not null;#9
alter table projects rename to projects_company;#10
alter table projects_company drop column emp_age ;#11
update projects_company
set status = 'completed'
where status = 'In-completed';#12

update projects_company
set emp_age =21
where id in(11,12,13,14,15);#13

update projects_company
set emp_age =emp_age + 21
where id = 32;#14

update projects_comapny
set status = 'In-comp[leted'
where id =33;#15

delete from projects_company where id =31;#16
delete from projects_company where id >32 ;#17
delete from projects_company where emp_id = 32;#18
drop table  projects_company;#19
truncate table  projects_company;#20

#table 5 --->create table salary
create table salary(
id int primary key,
emp_id int,
staff_id int,
emp_salary bigint,
staff_salary bigint,
foreign key(emp_id) references employee(id),
foreign key(staff_id) references staff(staff_id)
);

#insert the values 
insert into salary values(41,1,11,23000,67000),(42,2,12,93000,27000),(43,3,13,73000,17000),(44,4,14,43000,77000),
(45,5,15,63000,67000);

#queries---------------------------------------

select * from salary;#1
select name from salary where id >43;#2
select count(*) from projects;#3
select emp_salary ,emp_id as employees from projects
order by id;#4
select * from salary where staff_salary > 12000 ;#5
alter table salary  add column age int not null;#6
alter table salary  change column age emp_age int;#7
alter table salary  modify staff_slary int not null;#8
alter table salary  modify staff_salary int default 25000;#9
alter table salary  rename to salary_company;#10
alter table salary_company drop column emp_age ;#11
update salary_company
set staff_salary = 24000
where id = 44;#12

update salary_company
set emp_age =21
where id in(41,42,43,44,45);#13

update salary_company
set emp_age =emp_age + 21
where id = 42;#14

update projects_comapny
set emp_salary =28000
where id =43;#15

delete from salary_company where id =41;#16
delete from salary_company where id >42 ;#17
delete from salary_company where emp_id = 42;#18
drop table  salary_company;#19
truncate table  salary_company;#20


#table 6--> create table client
create table client(
id int primary key,
client_name varchar(70),
scheduling date,
amount_project bigint,
address varchar(80));

#insert the values 
insert into client values(51,'gill','2026-06-11',12900,'bhiwandi'),(52,'kiran','2026-06-12',17900,'bhiwandi'),
(53,'sai_sudrashan','2026-06-13',19900,'kalyan'),(54,'jaiswal','2026-06-14',16900,'besi'),(55,'karun','2026-06-15',2900,'bhiwandi');
#table 7 --> create table extra_charges
create table extra_charges(
extra_id int primary key ,
extra_charges_name varchar(70),
extra_charges_amount bigint,
date_of_payment date,
total_amount bigint);

#insert the values 
insert into extra_charges values(61,'ac',2600,'2026-06-01',25000),(62,'fans',1600,'2026-06-02',15000),(63,'chairs',1500,'2026-06-01',28000),
(64,'computers',4000,'2026-06-01',60000),(65,'food_items',26000,'2026-06-06',150000);

#table 8 --> create table adverstiments
create table advertsiment(
id int primary key,
adv_name varchar(70),
amount_charges bigint,
area_of_adv varchar(70),
adv_method varchar(80));
#insert the values
insert into advertsiment values(71,'hotel',12000,'mankoli','instragram'),(72,'house',19000,'besi','instragram'),(73,'swiggy',12000,'mankoli','instagram'),
(74,'hospital',22000,'mankoli','instragram'),(75,'abhi_bus',15000,'korlam','instragram');


#table 9 -->create table targets of comapany
create table targets(
id int primary key,
dep_id int,
emp_id int,
dep_name varchar(30),
emp_status varchar(80),
status varchar(70),
foreign key(emp_id) references employee(id),
foreign key(dep_id) references department(emp_id)
on delete cascade
on update cascade
);

#insert the values 
insert into targets values(81,1,11,'hr','completed'),(82,2,12,'java developer','completed'),(83,3,13,'python developer','IN-completed'),
(84,4,14,'lead_manager','completed'),(85,5,15,'manager','completed');

#table 10 --> create table torrent_bill_of company
create table bills_of_company(
bill_id int primary key,
extra_amount bigint,
torrent_bill bigint,
date_of_payment date,
total_amount_bill bigint not null,
foreign key(bill_id) references extra_charges(extra_id)
on delete cascade
on update cascade);

#insert the values 
insert into bills_of_company values(101,12000,13000,'2026-05-11',25000),(102,13000,14000,'2026-05-12',26000),
(103,14000,14000,'2026-05-13',28000),(104,18000,11000,'2026-05-11',35000),(105,22000,33000,'2026-05-15',55000);







