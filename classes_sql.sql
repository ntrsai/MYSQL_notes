create database travelagent45;
use travelagent45;
create table student_1(
id int primary key,
name char(10),
standard varchar(20),
age int
);
select * from student_1;
drop database travelagent45;
/*
references
1.daily sessions , google classroom
2.discuss your doubts ,ideas,daily work on batchemates...> ask your mentor
3.github,w3 school
4.chatgpt,blackbox.ai
5.canva,15 min revision in morning & 15 mins revision at  night before sleep.
*/
#.............................................................................................................
/*
datatypes of a columns in mysql database tells us what kind of values that columns can hold, such as:
...>integer(whole numbers),
...>varchar,char(strings),
....>date and time(date and time),
...>binary(raw data),
..>enum(a list of allowed values),
...>set(a list of allowed values),
...>time(time of day),
..>timestamp(date and time),
...>year(year),
...>float(decimal values),
...>double(decimal values),
...>decimal (decimal values)

every columns in a databases tabke must have a name and datatypes when creating a table , an sql developer needs to  choose the right data type 
for the each column this helps mysql knows the what kind of dat to except and how to work with it.
 datatyoes defines the types & sizes of datra to be stored in attribute ,as..id int(1,2,3..)
 in ,mysql there are three main categeries of datatypes:
 strings:for text values(ex: names,descrpritions).
 numeric:for numbers (ex:ages,prices).
 date and time :for date and time (ex: birthday,timestamp).
 
 note:choosing the correct data types is important for ensuring data accurancy and efficient strings.
 .........constraints..........
 mysql ,constraints are rules applied to cloumns in a database to enforce dsata integrity and ensure the accurancy
 and reability  of the data stored in database,
 constraints help manintains the quality of the dta by restricting the types of
 data that can be entered into a table and by defining relatiopnship between tables.
 
 ............................................... types of contraints.....................................................
 1...NOT NULL : ensure that acolumns cannot have a null values.
 example: create table student(
 id int not null,
 name char(20) not null);
 
 2...UNIQUE : ensure that all values in a columns are unique.
 example : create table students(
 email varchar(20) unique);
 
 3...PRIMARY KEY :  uniquely identifies  each records in a table combines not nul and unique constraints.
 example : create table student(
 id int primary key);
 
 4...FOREIGN KEY : ensures referential integrity  between two tables.
 a column in one table refers to the primary key of anthor table.
 example: create table company(
 emp_id int primary key,
 name varchar(40) not null,
 foreign key (customer_id) references customer(customer_id)
 );
 
 5...CHECK : ensures that all the values in a columns satisfy a specific conditions.
  example : create table employee(
  id int primary key,
  age int check=18);
  
  6..default
  assigfn a default  value to a column if no bvalue is specified.
  
  example:
  create table user(
  id int,
  name char(20),
  status varchar(30) default 'active');
  
  7...auto_increment:
  autometic generates a unique value  for a column whenever a new record is inserted.
  create table order
  id int auto_increment primary key,
  name varchar(80));
  
 ............................................................... INDEX................................................
 
 INDEX:
 improvev the performance of queries  by creating an index on specified column.
 ex: create unique index idx_email on employees(email);
 benefits of  using constraints:
  data integrity :ensures values and consistents data.
  error prevention: avoid accidental insertion of invaild or duplicate data.alterrelatrional consitency: maintains proper relationship between tables.
  constraints are essentials tools for maintaining a well structured and reliable database system.
  
  .....mysql , commands  are instructions that youb are use to interact with the database.alterthey allow you to perfirm various operations 
  such as creating databse and tables,insertin and updating data,querying data, and managing user permisiions.
  
  MYSQL commands can be categroized into several types based on their functionality:
  DDL(data definition language) : define databases structure (create,alter,drop,truncate)
  DML(data manipulation language) : manipultes data ( insert,update,delete)
  DQL(data query language) : queries data select
  DCL(data control language) :  control access data (grant ,revoke)
  TCL(transaction control language) : manages transactions (commit ,rollback, savepoint)
  
  ........clauses are componenets of  a sql statments that specify a acion  to be performed on  the data in a database.
  each clause  serves a specific purpose  and it helps to define the strcture  and bheviour of sql queries.
  clauses can be  combined to  create complex queries that retrieve , manipultes or manage data.
  The main clause in mysql include:
  SELECT: retrives data from a database table,
  FROM :specifies the tables (s) to retrieve data frpom.
  WHERE : filter data based on conditions.
  GROUP BY : groups data based on one or more columns.
  HAVING : filter groped data based on conditions.
  ORDER BY : sorts data in ascending or descending order.
  LIMIT : limits the number of rows returned.
  
  .....claues vs commands :
  commands : 
  these are main instructions you use to interact with the database. example :( select , insert , update,delete,create etc..)
  they performs specific actions on the database.
  
  clauses : these are parts of sql statements that provides additional details or conditional to the commands
  example:(where, order by , group by etc..)they help refine the commands operations.
  select * from students where name = "sai";
  
  In essenece ,commands are the actions you want to perform, while clauses are the conditions or modifications , that help define
   how those actions should be executed. understanding both is crucial for effective database managementand querying.
  
  TYPES OF CLAUSES :
  1. WHERE CLAUSES :
  THE where is used for  filter , records  in a table based on spevcific conditions.
   it is typical used with select , update and delete statements.
   ...syntax :
   select column1, column2 from user where condition;
   
   2.DISTINCT CLAUSES:
   distinct claues is used to return unique values  from a columns by a removing duplicates.
   ..syntax:
   select distinct column1 from stu;
   
   3.from clauses :
   the form clauses is specifies the table  or tables which the data is retrieved.
   it is the manditory part of select statments and also be used with joins for combing data  for multiple tables.
..SYNTAX: select column1,column2 from user;
    
    4.ORDER BY clauses :
    the order by clauses is used to sort teh result set in ascending(asc) or fdescending (desc) order based on one or more columns.
    ..syntax: select column1,column2 from table_name order by column(asc / desc);
    
    5.group by :
    the groups by clauses groups rows  with the same values  into summary rows,often  used with aggreate functions (eg: sums, count,avg)
    syntax:
    select column1, aggreate _functions(column2)
    from table_name group by column1;
    
    6.having clause :
    th having is used to filter  grouped data after the group  by clause.
    it works similiary to the where clause but it is applied to aggregated results.
   .. syntax:
    select column1, aggreate_function(column2)
    order by column1
    having condition;
     
     7.LIMIT( fetch or top) clause:
     the limit clauses  is used restrict the  number of rows returned by a query.
     different database may use variations like  fetch ot top.
     ..syntax: select column1,column2
     from table_name 
     limit number_of_rows;
     
     8.joins clauses:
     the joins claues is used to combine rows  from two or more tables  based on related column.
     syntax:
     select column from table1 join table2 on table1.common_column=table2.common_column;
     
     9.union clause :
     the union clause is used to combine the results of two or more select statements.
     duplicate rows  are removed by default.
     syntax :
     select column from table1  union select column from table2;
     
     10.into clause :
     the into clause is used  to insert query results  into a new table or export data.
     syntax:
     select columns into  new_table_name from table_name where conditions;
      
      11.case clause :
      the case clause  allows  conditional logic in sql queries,similiar  to an if_else statement.
       syntax :
select column1
	case
        when condition1 then result1
		when condition2 then result2
        else result3
	end as alias_name
from table_name;
    
    12.in clauses:
    the in-case is used  to filter  records based on alist of values.
    
    syntax:
    select column1,column2  from table_name
    where column_name  in( value1,value2); 
        
    13.between clauses :
    between clause filter data , within a specified range, inclusive of the boundaries.
    
    syntax:
    select colum1, column2
    from table_name
    where colun_name between  value1 and value2;
    
    14.like clause:
    the like clause is used to  for search for a specified patteren in a column.wildcards includes  %(any number of characters) and (single character).
     example:
     develearn
     1.(start with )dev %
     2.(end with) %earn
     3.(contain with) %le%
     
     syntax:
     select colum1,column2
     from table_name
     where column_name like pattern;
     
     15.exist clause:
     the exists clause check for the existence of rows in a subquery.
     
     syntax:
     select column1,column2
     from table_name
     where exists(subquery);
     
     16.as clause:
     the as clause is used to provide  and alias(temporary name) for column or tables, improving query readiability.
     
     syntax:
     select column_name as aslias_name
     from table_name;
      
17)select query:
the select statement is used to retrieve data for a database table.
it allows you to specify the column you want to fetch and apply  conditions to filter the results.alter
syntax:
select column1,column2,...
from table_name
where conditions;
    
 18)table queries :
 ---data defintions languages(ddl) : {create,alter,drop,truncate,rename}
 --data manipulation language(dml) :{insert,delete,update}
 ---data query language (dql):{select query }
 ---comment
 
   */
 use travelagent45;
 
 #----table-1
 #...create the country table
 create table countries(
 id int primary key auto_increment,
 name varchar(60) not null unique,
 description text,
 capital_city varchar(60),
 currency varchar(80) not null);
 select * from countries;
 #....insert records
 insert into countries(name,description,capital_city,currency) values
 ('united state','A country is north america known for its diverse culture and economy.','washington, d.c','USD'),
 ('canada','A country in north america known for its natural beauty and multiculutral society','ottawa','CAD'),
 ('united kingdom'," A country is  europe consisting of england, scotland wales, and northern ireland.",'london','GBP'),
 ('austraila','A country and continenet surrounded by the indian and pacific ocean.','canberra','AUD'),
 ('germany','A country in central europe known for its histroy,culture and engineering.','berglin','EUR'),
 ('france','A country in western europe  known for its art,fashion,culture.','paris','EUR'),
 ('japan','An island country in east asian known for its technology and traditional culture','tokyo','JPY'),
 ('INDIA','A country in south asia known for  its rich histroy and diverse culuture','new delhi','INR'),
 ('brazil','The largest country in south america known for its amazon rainforest and carnival festrival.','brasilia','BRL'),
 ('south africa','A country at the southeren tip of africa known for its varied topography and culture dievrsity.','pretoria','ZAR');
 
 SELECT * FROM COUNTRIES;
 select name,capital_city from countries;
 select * from countries where name = 'INDIA';
 select * from countries where currency = 'USD';
 select currency as country_currency from countries;
 select count(*) as total_country from countries;
 select * from countries where description like  "%culture%";
 select * from countries order by name;
 select * from countries where capital_city like 'b%';
 select * from countries where char_length(description) > 20;
 select * from countries where description not like '%country%' ;
 select * from countries limit 5;
 select * from countries  order by name desc;
 select * from countries  order by name asc;
 select * from countries order by char_length(name) desc limit 2;
 
 
 
