create database mock;
use mock;

create table employee(
emp_id int primary key,
name varchar(50) not null,
age int,
email varchar(60) unique check(email like '%_@_%._%'),
contact bigint,
status varchar(30) check(status in('active','inactive') )default 'inactive',
status2 enum('pending','notpending'),
created_at timestamp default current_timestamp);

INSERT INTO employee (emp_id, name, age, email, contact, status, status2)
VALUES
(1, 'Alice', 28, 'alice@example.com', 9876543210, 'active', 'pending'),
(2, 'Bob', 35, 'bob@example.com', 9123456789, 'inactive', 'notpending'),
(3, 'Charlie', 30, 'charlie@gmail.com', 9988776655, 'active', 'pending'),
(4, 'David', 40, 'david@yahoo.com', 9000011122, 'inactive', 'notpending'),
(5, 'Eve', 25, 'eve@company.org', 9887766554, 'active', 'pending');

alter table employee add constraint uniq_cont unique (contact);
alter table employee drop constraint uniq_cont;
alter table employee modify emp_id int auto_increment;
alter table employee rename column email To emp_email ;
select emp_id ,name,age,
case
    when age>=20 then 'you can vote'
    when age<=20 then'you cannot vote'
    when age<=18 then 'you are cannot vote'
end as vote_of_age    
from employee;

create unique  index unq_contact on employee(contact);
truncate table employee;
select * from employee;

select * from employee where age>=28 order by name desc;
select name,count(contact) from employee group by name having max(emp_id) limit 2;
