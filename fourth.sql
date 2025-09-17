#single commnets
/*
multiple lines comments
*/
#create a databases 
create database samskara;
use samskara; # how to use databses
drop database samskara; #how to delete the databases
#-------------------------------------data analysis-------------------------------------
/*
t1---students(id,name,std,fees_amount,gender,age)
t2---teacher(id,teach_name,salary,gender,address)
t3---classes(id,class_id,class_name,class_room_teacher)
*/
#------------------------------tables queries------------------------------
#create a tables students

create table school_student(id int,
name varchar(15),
subjects varchar(30),
gender varchar(10)
 );

#---------------------selcet all the queries---------------------------
select * from school_student;

create database school_detiails;
use school_detiails;
create table school_students(
id int,
name varchar(15),
subjects varchar(30),
gender varchar(10)
 );
 select * from school_students;
 #--------------------------insert values in tables----------------------------------
 insert into school_students (id,name,subjects,gender)
 values(1,'sai','maths','male'),(2,'rahul','science','male'),
 (3,'kajal','hindi','female'),(4,'arjun','maths','male'),
 (5,'reddy','social','male');
 
 #--------------------------class_homework---------------------------------
 create table teacher(id int,name varchar(40),salary int,class_teacher varchar(20),
 subjects varchar(50));
 select * from teacher;
 drop table teacher;
 insert into teacher (id,name,salary,class_teacher,subjects) values 
 (101,'mane_mam',25000,'fifth_class','maths'),
 (102,'pooja_,mam',25000,'sixth_class','science'),
 (103,'rahul_sir',30000,'second_class','commerce'),
 (104,'sai_sir',38000,'fourth_class','physical_science'),
 (105,'arjun_sir',45000,'tenth_class','english');
 
create table staff(id int,name varchar(40),salary int,position varchar(50),address varchar(60)); 
select * from staff;
insert into staff(id,name,salary,position,address) values 
(1,'rohit',12000,'cleaner','panvel'),
(2,'rahul_sharma',13000,'cleaner','mumbai'),
(3,'raju_kumar',12500,'cleaner','bhiwandi'),
(4,'kishan_kumar',11500,'bill_counter','thane'),
(5,'dhone',14500,'cleaner','bhiwandi');

 create table employee_bank(id int,name varchar(20),salary int,position varchar(40),address varchar(20));
 insert into employee_bank(id,name,salary,position,address) values
 (1,'rohit',22000,'cash_counter','panvel'),
(2,'rahul_sharma',23000,'loan_processer','mumbai'),
(3,'raju_kumar',12900,'cleaner','bhiwandi'),
(4,'isahan_kumar',28500,'Atm_bank_openinga/c','thane'),
(5,'dhone',11500,'cleaner','bhiwandi'); 
#-----------------------------------------------class_work------------------------------------------------
select * from employee_bank;
select * from staff;
select * from teacher;


