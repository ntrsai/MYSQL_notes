create database company_of_tcs;
use company_of_tcs;
-- ==========================================TABLE -01=============================================================
#creating the table
create table employee_01(
id int primary key ,
name varchar(60) not null,
salary bigint not null,
location varchar(80) not null,
married_status varchar(80));

#insert the values 
insert into employee_01 values (1,'sai',25000,'mankoli','no'),(2,'raju',38000,'besii','no'),(3,'mahi',34000,'sompeta','yes'),
(4,'arjun',16000,'thane','no'),(5,'rahul',14000,'korlam','yes');

#queries :select,alter,update,delete,oderby ,group by
select * from employee_01 ;#1
select name from employee_01  where id >3;#2
select count(name) from employee_01  where married_status = 'yes';#3
select name,location from employee_01  
order by id;#4
select * from employee_01  where location in('thane','mankoli');#5
alter table employee_01  add column age int not null;#6
alter table employee_01  change column age emp_age int;#7
alter table employee_01  modify location char(80) not null;#8
alter table employee_01  modify salary int not null;#9
alter table employee_01  rename to employee_company;#10
alter table employee_company drop column emp_age ;#11
alter table employee_company  add column age int not null;
select * from employee_company;
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES= 1;

update employee_company
set married_status = 'yes'
where married_status ='no';#12

update employee_company
set age =21
where id in(1,2,3,4,5);#13

update employee_company
set age = age + 21
where id = 2;#14

update employee_company
set salary= salary *2
where id =3;#15

delete from employee_company where id =1;#16
delete from employee_company where salary < 12000;#17
delete from employee_company where salary in(14000);#18
drop table  employee_company;#19
truncate table  employee_company;#20



-- =============================================TABLE-02=================================================================
create table staff_02(
staff_id int primary key ,
names varchar(80),
staff_salary bigint not null,
contact bigint,
address varchar(80));

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES= 1;

#insert the values 
insert into staff_02 values(11,'suraj',16000,8989897654,'virar'),(12,'ramesh',170000,8992929292,'mankoli'),
(13,'rohit',50000,8989765467,'sompeta'),(14,'virat',560000,987777776,'korlam'),(15,'roshan_kumar',45000,9897666554,'mankoli');

#queries:
select * from staff_02;#1
select names from staff_02 where staff_id >13;#2
select count(names) from staff_02 where address = 'virar';#3
select names,address from staff_02 
order by staff_id;#4
select * from staff_02 where address in('virar','mankoli');#5
alter table staff_02 add column age int not null;#6
alter table staff_02 change column age staff_age int;#7
alter table staff_02 modify address char(80) not null;#8
alter table staff_02 modify contact bigint not null;#9
alter table staff_02 rename to staff_companies;#10
alter table staff_company drop column staff_age ;#11
update staff_companies
set address = 'kalyan'
where address='mankoli';#12

update  staff_companies
set staff_age = 21
where staff_id =11;#13

update  staff_companies
set staff_age = staff_age + 21
where staff_id > 18;#14


select * from staff_companies;
update staff_companies
set staff_salary= staff_salary * 2
where staff_id =13;#15

delete from staff_companies where id =11;#16
delete from staff_companies where staff_salary < 12000;#17
delete from staff_companies where staff_salary in(14000);#18
drop table  staff;#19
truncate table  staff_companies;#20





-- ===========================================TABLE-03============================================================================
create table department_03(
id int primary key,
emp_id int null,
dep_name varchar(30) not null,
staff_id  int,
contact bigint,
constraint fk_emp
foreign key(emp_id) references employee_01(id)
on delete cascade
on update cascade,
constraint fk_staff
foreign key(staff_id) references staff_02(staff_id)
on delete cascade
on update cascade);
select * from department_03;

#insert the values
insert into department_03 values(21,1,'hr',12,988282992),(22,2,'developer',11,9882998992),(23,3,'python developer',13,788282992),
(24,5,'project_lead',14,788282992),(25,4,'hr',15,678282992);


select * from department_03;#1
select dep_name from department_03 where id > 23;#2
select count(dep_name) from department_03 where contact = 988282992;#3
select dep_name,contact from department_03
order by id;#4
select * from department_03 where contact in(988282992);#5
alter table department_03 add column age int not null;#6
alter table department_03 change column age dep_age int;#7
alter table department_03 add column address char(80) not null;#8
alter table department_03 modify contact int not null;#9
alter table department_03 rename to department_company;#10
alter table department_company add column address char(80) not null;#8
alter table department_company drop column dep_age ;#11
update department_company
set contact = '98828828289'
where contact='988282992';#12

update department_company
set dep_age =21
where id in(11,12,13,14,15);#13

update department_company
set dep_age =dep_age + 21
where id = 22;#14

update department_comapny
set contact= 28282221
where id =23;#15

delete from department_company where id =21;#16
delete from department_company where id >2 ;#17
delete from department_company where contact in(9828889822);#18
drop table  department_company;#19
truncate table  department_company;#20



-- =============================================TABLE -04=====================================================
create table projects(
id int primary key,
emp_name varchar(49),
dep_name varchar(50),
status varchar(70),
emp_id int ,
foreign key(emp_id) references employee_01(id)
on delete set null
on update cascade);

insert into projects values(31,'raju','developer','completed',2),(32,'sai','python developer','completed',1),
(33,'mahi','java developer','In-completed',3),(34,'arjun','hr','completed',4),(35,'rahul','developer','completed',5);


#queriess------------------------------------------------
select * from projects;#1
select emp_name,dep_name from projects where id >23;#2
select count(*) from projects where status = 'completed' ;#3
select emp_name ,dep_name from projects
order by id;#4
select * from projects where status in('In-completed');#5
alter table projects add column age int not null;#6
alter table projects change column age emp_age int;#7
alter table projects modify dep_name char(80) not null;#8
alter table projects modify status varchar(80) not null;#9
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

update projects_company
set status = 'In-completed'
where id =33;#15

delete from projects_company where id =31;#16
delete from projects_company where id >32 ;#17
delete from projects_company where emp_id = 32;#18
drop table  projects_company;#19
truncate table  projects_company;#20
-- ==============================================TABLE -05==========================================================
create table salary_04(
id int primary key,
emp_id int,
staff_id int,
emp_salary bigint,
staff_salary bigint,
foreign key(emp_id) references employee_01(id),
foreign key(staff_id) references staff_02(staff_id)
);

#insert the values 
insert into salary_04 values(41,1,11,23000,67000),(42,2,12,93000,27000),(43,3,13,73000,17000),(44,4,14,43000,77000),
(45,5,15,63000,67000);

select * from salary_04;#1
select staff_salary from salary_04 where id >43;#2
select count(*) from salary_04;#3
select * from salary_04
order by id desc limit 2;#4
select * from salary_04 where staff_salary > 12000 ;#5
alter table salary_04  add column age int not null;#6
alter table salary_04  change column age p_age int;#7
alter table salary_04  modify staff_salary int not null;#8
alter table salary_04  modify staff_salary int default 25000;#9
alter table salary_04  rename to salary_company;#10
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

update salary_company
set emp_salary =28000
where id =43;#15

delete from salary_company where id =41;#16
delete from salary_company where id >42 ;#17
delete from salary_company where emp_id = 42;#18
drop table  salary_company;#19
truncate table  salary_company;#20
-- ===========================================TABLE -06===========================================================

create table client(
id int primary key,
client_name varchar(70),
scheduling date,
amount_project bigint,
address varchar(80));

-
#insert the values 
insert into client values(51,'gill','2026-06-11',12900,'bhiwandi'),(52,'kiran','2026-06-12',17900,'bhiwandi'),
(53,'sai_sudrashan','2026-06-13',19900,'kalyan'),(54,'jaiswal','2026-06-14',16900,'besi'),(55,'karun','2026-06-15',2900,'bhiwandi');

#queriess------

SELECT * FROM client;# 2
SELECT client_name FROM client WHERE id > 52;#3
SELECT COUNT(*) FROM client;#4
SELECT id AS client_id, amount_project FROM client ORDER BY scheduling;#5
SELECT * FROM client WHERE amount_project > 15000;#5
ALTER TABLE client ADD COLUMN contact_no BIGINT;#6
ALTER TABLE client CHANGE COLUMN contact_no phone_number BIGINT;#7
ALTER TABLE client MODIFY phone_number BIGINT NOT NULL;#8
ALTER TABLE client MODIFY phone_number BIGINT DEFAULT 9876543210;#9
ALTER TABLE client RENAME TO client_info;#!0
ALTER TABLE client_info DROP COLUMN phone_number;#11


UPDATE client_info
 SET amount_project = 30000 
 WHERE id = 51;#!2


UPDATE client_info 
SET address = 'thane'
 WHERE id IN (51, 52);#13

UPDATE client_info 
SET amount_project = amount_project + 5000
 WHERE id = 53;#14
 
UPDATE client_info
 SET scheduling = '2026-06-20'
 WHERE id = 55;#15

DELETE FROM client_info WHERE id = 54;#16
DELETE FROM client_info WHERE amount_project < 5000;#17
DELETE FROM client_info WHERE client_name = 'kiran';#18
DROP TABLE client_info;#19
TRUNCATE TABLE client_info;#20



-- =======================================TABLE-07=============================================================================
create table extra_charges_07(
extra_id int primary key ,
extra_charges_name varchar(70),
extra_charges_amount bigint,
date_of_payment date,
total_amount bigint);

#insert the values 
insert into extra_charges_07 values(611,'ac',2600,'2026-06-01',25000),(662,'fans',1600,'2026-06-02',15000),(663,'chairs',1500,'2026-06-01',28000),
(664,'computers',4000,'2026-06-01',60000),(665,'food_items',26000,'2026-06-06',150000);


#queries ------------
SELECT * FROM extra_charges_07;#1
SELECT extra_charges_name FROM extra_charges_07 WHERE total_amount > 25000;#2
SELECT COUNT(*) FROM extra_charges_07;#3
SELECT extra_id, extra_charges_amount FROM extra_charges_07 ORDER BY date_of_payment;#4
SELECT * FROM extra_charges_07 WHERE extra_charges_amount >= 2600;#5
ALTER TABLE extra_charges_07 ADD COLUMN bill_no INT;#6
ALTER TABLE extra_charges_07 CHANGE COLUMN bill_no invoice_id INT;#7
ALTER TABLE extra_charges_07 MODIFY invoice_id INT NOT NULL;#8
ALTER TABLE extra_charges_07 MODIFY invoice_id INT DEFAULT 1001;#9
ALTER TABLE extra_charges_07 RENAME TO extra_charges_company;#10
ALTER TABLE extra_charges_company DROP COLUMN invoice_id;#11

UPDATE extra_charges_company 
SET extra_charges_amount = 2800
 WHERE extra_id = 61;#12


UPDATE extra_charges_company 
SET total_amount = total_amount + 5000 
WHERE extra_id IN (62, 63);#13


UPDATE extra_charges_company 
SET total_amount = total_amount * 2 
WHERE extra_id = 65;#14


UPDATE extra_charges_company
 SET date_of_payment = '2026-06-10' 
 WHERE extra_id = 64;#15

DELETE FROM extra_charges_company WHERE extra_id = 65;#16
DELETE FROM extra_charges_company WHERE extra_charges_amount < 2000;#17
DELETE FROM extra_charges_company WHERE extra_charges_name = 'fans';#18
DROP TABLE extra_charges_company;#19
TRUNCATE TABLE extra_charges_company;#20

-- =============================================TABLE-08===========================================================================
#table 8 --> create table adverstiments
create table advertsiment_08(
id int primary key,
adv_name varchar(70),
amount_charges bigint,
area_of_adv varchar(70),
adv_method varchar(80));
drop table advertsiment_08;
#insert the values
insert into advertsiment_08 values(7771,'hotel',12000,'mankoli','instragram'),(7772,'house',19000,'besi','instragram'),(7773,'swiggy',12000,'mankoli','instagram'),
(7774,'hospital',22000,'mankoli','instragram'),(7775,'abhi_bus',15000,'korlam','instragram');

#queries---------------------------------------------------------
SELECT * FROM advertsiment_08;#1
SELECT adv_name FROM advertsiment_08 WHERE amount_charges > 15000;#2
SELECT COUNT(*) FROM advertsiment_08;#3
SELECT id, adv_method FROM advertsiment_08 ORDER BY area_of_adv;#4
SELECT * FROM advertsiment_08 WHERE area_of_adv = 'mankoli';#5
ALTER TABLE advertsiment_08 ADD COLUMN ad_date DATE;#6
ALTER TABLE advertsiment_08 CHANGE COLUMN ad_date start_date date ;#7
ALTER TABLE advertsiment_08 MODIFY start_date DATE ;#8
ALTER TABLE advertsiment_08 MODIFY start_date DATE DEFAULT '2026-07-01';#9
ALTER TABLE advertsiment_08 RENAME TO adv_campaigns;#10
ALTER TABLE adv_campaigns DROP COLUMN start_date;#11

UPDATE adv_campaigns
 SET amount_charges = 18000 
 WHERE id = 7771;#12


UPDATE adv_campaigns
 SET area_of_adv = 'bhiwandi' 
 WHERE id IN (7771, 7772);#13

UPDATE adv_campaigns 
SET amount_charges = amount_charges + 2000
 WHERE id = 7775;#14


UPDATE adv_campaigns
 SET adv_method = 'YouTube' 
 WHERE id = 7773;#15


DELETE FROM adv_campaigns WHERE id = 7772;#16
DELETE FROM adv_campaigns WHERE amount_charges < 15000;#17
DELETE FROM adv_campaigns WHERE adv_name = 'hospital';#18
DROP TABLE adv_campaigns;#19
TRUNCATE TABLE adv_campaigns;#20


-- =============================================TABLE-09==============================================================
#table 9 -->create table targets of comapany
create table targetss_009(
id int primary key,
dep_id int,
emp_id int,
dep_name varchar(30),
emp_status varchar(80),
foreign key(emp_id) references employee_01(id),
foreign key(dep_id) references department_03(id)
on delete cascade
on update cascade
);

DROP TABLE targetss_009;
#insert the values 
insert into targetss_009 values(8881,21,1,'hr','completed'),(8882,22,2,'java developer','completed'),(8883,23,3,'python developer','IN-completed'),
(8884,24,4,'lead_manager','completed'),(8885,25,5,'manager','completed');



#queriess--------------------------------------------
SELECT * FROM targetss_009;#1
SELECT dep_name FROM targetss_009 WHERE emp_status = 'completed';#3
SELECT COUNT(*) FROM targetss_009;#4
SELECT emp_id, dep_id FROM targetss_009 ORDER BY id;#4
SELECT * FROM targetss_009 WHERE emp_status = 'IN-completed';#5
ALTER TABLE targetss_009 ADD COLUMN deadline DATE;#6
ALTER TABLE targetss_009 CHANGE COLUMN deadline target_deadline DATE;#7
ALTER TABLE targetss_009 MODIFY target_deadline DATE ;#8
ALTER TABLE targetss_009 MODIFY target_deadline DATE DEFAULT '2026-07-30';#9
ALTER TABLE targetss_009 RENAME TO company_targets;#10
ALTER TABLE company_targets DROP COLUMN target_deadline;#11

UPDATE company_targets 
SET emp_status = 'in-progress'
 WHERE id = 8883;#12
 
UPDATE company_targets
 SET dep_name = 'HR Team'
 WHERE id = 8881;#13
 
UPDATE company_targets
 SET emp_status = 'completed' 
WHERE id IN (8883, 8884);#14

UPDATE company_targets
 SET emp_id = 1
 WHERE id = 8885;#15
 
DELETE FROM company_targets WHERE id = 8882;#16
DELETE FROM company_targets WHERE emp_status = 'in-progress';#17
DELETE FROM company_targets WHERE dep_name = 'manager';#18
DROP TABLE company_targets;#19
TRUNCATE TABLE company_targets;#20


-- ==========================================TABLE -10===============================================================
#table 10 --> create table torrent_bill_of company
create table bills_of_company(
bill_id int primary key,
extra_amount bigint,
torrent_bill bigint,
date_of_payment date,
total_amount_bill bigint not null,
extra_id int,
constraint fk_extra
foreign key(extra_id) references extra_charges_07(extra_id)
on delete cascade
on update cascade);

drop table bills_of_company;
#insert the values 
insert into bills_of_company values(1001,12000,13000,'2026-05-11',25000,611),(1002,13000,14000,'2026-05-12',26000,662),
(1003,14000,14000,'2026-05-13',28000,665),(1004,18000,11000,'2026-05-11',35000,664),(1005,22000,33000,'2026-05-15',55000,663);

#queries=-----------------------------------------------
SELECT * FROM bills_of_company;#1
SELECT bill_id FROM bills_of_company WHERE total_amount_bill > 30000;#2
SELECT COUNT(*) FROM bills_of_company;#3
SELECT  extra_id, total_amount_bill FROM bills_of_company ORDER BY date_of_payment;#4
SELECT * FROM bills_of_company WHERE torrent_bill > 13000;#5
ALTER TABLE bills_of_company ADD COLUMN gst_amount BIGINT;#6
ALTER TABLE bills_of_company CHANGE COLUMN gst_amount tax BIGINT;#7
ALTER TABLE bills_of_company MODIFY tax BIGINT NOT NULL;#8
ALTER TABLE bills_of_company MODIFY tax BIGINT DEFAULT 2000;#9
ALTER TABLE bills_of_company RENAME TO billing_details;#10
ALTER TABLE billing_details DROP COLUMN tax;#11

UPDATE billing_details
 SET total_amount_bill = 60000 
 WHERE bill_id = 1005;#12
 
UPDATE billing_details 
SET torrent_bill = 15000 
WHERE bill_id IN (1001, 1002);#13

UPDATE billing_details 
SET total_amount_bill = total_amount_bill - 5000
 WHERE bill_id = 1003;#14
 
UPDATE billing_details 
SET extra_amount = 16000 
WHERE bill_id = 1004;#15

DELETE FROM billing_details WHERE bill_id = 1001;#16
DELETE FROM billing_details WHERE torrent_bill < 14000;#17
DELETE FROM billing_details WHERE extra_id = 663;#18
DROP TABLE billing_details;#19
TRUNCATE TABLE billing_details;#20


#===========================================================================================================================
SELECT * FROM employee_01;
SELECT * FROM staff_02;
SELECT * FROM department_03;
SELECT * FROM projects;
SELECT * FROM salary_04;
SELECT * FROM client;
SELECT * FROM extra_charges_07;
SELECT * FROM advertsiment_08;
SELECT * FROM targetss_009;
SELECT * FROM bills_of_company;

#show adta base
show databases;
describe  company_of_tcs;

