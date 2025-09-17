create database temp1;
use temp1;
create table temp3 (
id int primary key,
name varchar(30),
age int not null );

insert into temp3 values(1,"sai",21);
insert into temp3 values(2,"mai",22);
insert into temp3 values(3,"rai",24);
select * from temp3;


