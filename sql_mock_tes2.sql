create database mock_test2;
use mock_test2;

create table customer(
id int primary key,
name varchar(30),
city varchar(40),
email varchar(70));

INSERT INTO customer(id, name, city, email) VALUES
(1, 'Alice', 'Mumbai', 'alice@example.com'),
(2, 'Bob', 'Delhi', 'bob@example.com'),
(3, 'Charlie', 'Bangalore', 'charlie@example.com'),
(4, 'Diana', 'Chennai', 'diana@example.com'),
(5, 'Ethan', 'Kolkata', 'ethan@example.com');

create table products(
product_id int primary key,
product_name varchar(50),
category varchar(50),
price bigint );

INSERT INTO products(product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Smartphone', 'Electronics', 25000),
(103, 'Desk Chair', 'Furniture', 7000),
(104, 'Notebook', 'Stationery', 100),
(105, 'Headphones', 'Electronics', 2000);

create table Orders(
order_id int primary key,
customer_id int,
product_id int,
order_date date,
quantity varchar(70),
foreign key(customer_id) references customer(id),
foreign key(product_id) references products(product_id)
);


INSERT INTO Orders(order_id, customer_id, product_id, order_date, quantity) VALUES
(1001, 1, 101, '2025-08-01', '1'),
(1002, 2, 102, '2025-08-02', '2'),
(1003, 3, 103, '2025-08-03', '1'),
(1004, 4, 104, '2025-08-04', '5'),
(1005, 5, 105, '2025-08-05', '3');

#queries:
#Retrieve the names and emails of customers who placed at least one order in the month of August 2025.
select name,email,order_date from customer ;
#2:   the top 3 most expensive products.
select product_name  from products  where price>=2000 limit 3;
#3:   Display the total number of orders placed by each customer, sorted in descending order of order count.
select sum(quantity),count(quantity) from Orders order by quantity desc;
#8: Find the average order quantity per customer.
select avg(quantity) from Orders;


