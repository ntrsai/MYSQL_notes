create database classes;
use classes;


create table classe (
id int primary key,
name varchar(10) not null,
address varchar(50),
pincode int not null
);
select * from classe;
insert into classe (id,name,address,pincode) values (1,'sai','besi',421302);
insert into classe (id,name,address,pincode) values (2,'rahul','korlam',421302);
insert into classe (id,name,address,pincode) values (3,'rahul','korlam',421302);

create table classess (
id int primary key,
name varchar(10) not null,
address varchar(50),
pincode int not null
);