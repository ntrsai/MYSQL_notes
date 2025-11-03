#1
create database GroceryShopDB;
use GroceryShopDB;
/*


Topic: Grocery Shopping Management System
Duration: 2 Hours
Total Questions: 50 (Basic → Intermediate → Advanced)
Mode: SQL Query Writing & Explanation


🧩 Section A – DDL (Data Definition Language) [Q1–Q5]
*/
#2
create table customers_1(
cust_id int,
name varchar(70),
email varchar(70),
phone bigint,
city varchar(70),
created_at timestamp);

create table product(
pro_id int,
name varchar(80),
category varchar(80),
price bigint,
quantity int);

create table orders (
order_id int,
cust_id int,
order_date date,
total_amount int,
status varchar(80));

create table order_items (
orderItemID int,
 OrderID int,
 ProductID int,
 Quantity int,
 SubTotal bigint );
 
create table supplier(
SupplierID int,
 SupplierName varchar(80),
 ContactName varchar(80),
 Phone bigint,
 City varchar(80));

#=======================================================================
#

#Q3. Add Primary Key, Foreign Key, and Unique constraints appropriately.
alter table product modify pro_id int primary key;
alter table product modify name varchar(80) unique;
alter table orders  add constraint  fk_oredr_cut foreign key(cust_id) references customers_1(cust_id);
#Q4. Modify Products table to add a new column Discount DECIMAL(5,2).
alter table product add column total_price decimal(5,2);
#Q5. Drop the column Discount from Products table.
alter table product drop column discount;

#🧮 Section B – DML (Data Manipulation Language) [Q6–Q10]

#Q6. Insert 5 records each into Customers, Products, Suppliers.
select * from supplier;
insert into customers_1(cust_id,name,email,phone,city) values(1,"sai","sai@gmail",92828299,"besi"),
(2,"rahul","rahuli@gmail",92098299,"sompeta"),(3,"raju","raj@gmail",92688299,"ramachandra"),
(4,"shaai","shaai@gmail",98828299,"kurla"),(5,"ramu","ramu@gmail",922728299,"korlam");

insert into product values(101,'sairam','watch',3600,2),(102,'rajram','sell',36020,1),
(103,'rahram','watch',3670,2),(104,'rohitram','laptop',3690,2),(105,'shaliniram','watch',8600,1);

insert into supplier values(201,'harman','abc',9288282,'burgam'),(202,'pratika','bbc',92882832,'sompeta'),
(203,'jemi','lbc',928833282,'burgam'),(204,'deepti','fbc',928828212,'kutllla'),(205,'smriti','ebc',92882822,'burgam');


#Q7. Insert 3 sample orders into the Orders table.
select * from order_items;
insert into orders(order_id,cust_id,total_amount,status) values(301,101,2499,"pending"),(302,102,2782,"succesful"),
(303,104,6372,"pending");
select * from orders;
#Q8. Insert corresponding order items into OrderItems.
insert into order_items values (401,301,201,2,1780);
#Q9. Update the stock quantity in Products after each order.
update product 
set quantity=6
where id >101;
#Q10. Delete one customer record whose city is ‘Lucknow’.
delete from customer_1 where city ="lucknow";

#🔍 Section C – DQL (Data Query Language) [Q11–Q18]

#Q11. Display all customers who live in ‘Delhi’.
select * from cutomer_1 where city="delhi";
#Q12. Display products whose price is greater than ₹500.
select * from product where price > 500;
#Q14. Show the top 3 most expensive products.
select * from product order by id limit 3;
#Q15. Display all orders placed in the last 7 days.
select * from orders where order_date>=currentdate() - interval 7 day ;
#Q16. Show all customers who haven’t placed any order yet.
select * from orders where status ="pending";
#Q17. Display each product and its supplier’s name using JOIN.
select * from product as p join supplier as s on p.pro_id=s.supplier_id;
select * from supplier;
#Q18. Display total sales amount per customer.
select cust_id,sum(total_amount) from orders ;

#⚙️ Section D – Operators & Clauses [Q19–Q23]

#Q19. Use BETWEEN operator to find products priced between ₹100 and ₹1000.
select * from product where price between 100 and 1000;
#Q20. Use LIKE operator to find all customers whose names start with ‘S’
select * from customer_1 where names like's';
#Q21. Use IN operator to display all customers from (‘Delhi’, ‘Mumbai’, ‘Lucknow’).
select * from customer_1 where city in(‘Delhi’, ‘Mumbai’, ‘Lucknow’);
#Q22. Use GROUP BY and HAVING to find cities having more than 2 customers.
select name,id,city from customer group by city having id>2;
#Q23. Use ORDER BY to sort products by price descending.
select * from product order by price desc;
#🔑 Section E – Joins [Q24–Q27]

#Q24. Perform INNER JOIN to display OrderID, CustomerName, OrderDate.
SELECT o.order_id, c.name AS customer_name, o.order_date
FROM orders o
INNER JOIN customers_1 c ON o.cust_id = c.cust_id;

#Q25. Perform LEFT JOIN to show all customers and their orders.
SELECT c.name, o.order_id, o.order_date
FROM customers_1 c
LEFT JOIN orders o ON c.cust_id = o.cust_id;

#Q26. Perform RIGHT JOIN to show all products and related order items.
SELECT p.name AS product_name, oi.OrderID, oi.Quantity
FROM product p
RIGHT JOIN order_items oi ON p.pro_id = oi.ProductID;

#Q27. Perform FULL OUTER JOIN to show all customers and orders (if supported).
SELECT c.name, o.order_id, o.order_date
FROM customers_1 c
LEFT JOIN orders o ON c.cust_id = o.cust_id
UNION
SELECT c.name, o.order_id, o.order_date
FROM customers_1 c
RIGHT JOIN orders o ON c.cust_id = o.cust_id;

#🧠 Section F – Subqueries & Views [Q28–Q31]

#Q28. Write a subquery to find customers who ordered a product priced above ₹1000.
SELECT DISTINCT c.name
FROM customers_1 c
WHERE c.cust_id IN (
    SELECT o.cust_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.OrderID
    JOIN product p ON oi.ProductID = p.pro_id
    WHERE p.price > 1000
);

#Q29. Create a view CustomerOrdersView showing CustomerName, OrderID, TotalAmount.
CREATE VIEW CustomerOrdersView AS
SELECT c.name AS customer_name, o.order_id, o.total_amount
FROM customers_1 c
JOIN orders o ON c.cust_id = o.cust_id;

#Q30. Write a query using the view to show customers with order amount > ₹5000.
SELECT * 
FROM CustomerOrdersView
WHERE total_amount > 5000;

#Q31. Write a correlated subquery to list products with price greater than average price.
SELECT name, price
FROM product
WHERE price > (SELECT AVG(price) FROM product);


#🧾 Section G – CTE (Common Table Expressions) [Q32–Q33]

#Q32. Create a CTE to calculate total sales amount per customer and filter those with total > ₹10,000.
WITH CustomerSales AS (
  SELECT c.name AS customer_name, SUM(o.total_amount) AS total_sales
  FROM customers_1 c
  JOIN orders o ON c.cust_id = o.cust_id
  GROUP BY c.name
)
SELECT * 
FROM CustomerSales
WHERE total_sales > 10000;

#Q33. Use a recursive CTE to generate a sequence of order numbers from 1 to 10.
WITH RECURSIVE order_numbers AS (
  SELECT 1 AS num
  UNION ALL
  SELECT num + 1 FROM order_numbers WHERE num < 10
)
SELECT * FROM order_numbers;


#⚡ Section H – Functions [Q34–Q37]

#Q34. Use built-in functions:Display current date (CURDATE()),Uppercase all customer names,Round product prices to nearest integer.
SELECT 
    CURDATE() AS Today_Date,
    UPPER(c.name) AS Uppercase_Customer,
    ROUND(p.price) AS Rounded_Price
FROM customers_1 c, product p
LIMIT 5;

#Q35. Create a user-defined function GetDiscountedPrice(price DECIMAL) that returns price after 10% discount.
delimiter //
create function GetDiscountedPrice(price DECIMAL(10,2)
returns bigint
deterministic
begin
return price=price*10
end ;
delimiter //
select GetDiscountedPrice(2800);

#Q36. Use the above function in a SELECT query on Products.
select GetDiscountedPrice(2800);
#Q37. Write a function to return total number of orders placed by a given customer.
select * from orders;

delimiter //
create procedure order_placed(in order_id int)
begin
select sum(total_amount) from orders;
end ;
delimiter //
call order_placed(302);
#🧩 Section I – Triggers [Q38–Q40]

#Q38. Create a trigger UpdateStock_AfterOrder that reduces StockQty after an order item is inserted.
delimiter //
create trigger updatestock
after update on orders
for each row
begin
insert into order_item(quantity)values(new.quantity);
end ;
delimiter //
update orders set quantity=12 where id =302;

#Q39. Create a trigger CheckStock_BeforeInsert that prevents orders if stock is insufficient.
delimiter //
create trigger checkstock
after update on orders
for each row
begin
if new.quantity<0 then
set message_text="insuffiecient"
end if;
end ;
delimiter //
update orders set quantity=-2 where id =302;
#Q40. Create a trigger LogDeletedCustomer that stores deleted customer data in a DeletedCustomers table.

select * from customers_1;

delimiter //
create trigger logdeletecustomer
after delete on customer_1
for each row
begin
insert into customer_1(cust_id,name,email,created_at)values(new.cust_id,new.name,new.email,now());
end ;
delimiter //
insert into customers_1(cust_id,name,email) values(8,'mahi','mahi@gmail');
#🔁 Section J – Stored Procedures [Q41–Q44]

#Q41. Write a stored procedure GetCustomerOrders(customer_id) to fetch all orders for a customer.
delimiter //
create procedure GetCustomerOrders(in customer_id int)
begin
select * from customers_1 where cust_id =customer_id;
end ;
delimiter ;
call GetCustomerOrders(3);
select * from product;

#Q42. Write a stored procedure AddNewProduct that inserts a new product record.
delimiter //
create procedure addnewproduct
(in pro_id int,in name varchar(70),in category varchar(70),in price int,in quantity int)
begin
insert into product(pro_id,name,category,price,quantity) values(pro_id,name,category,price,quantity);
end ;
delimiter ;
call addnewproduct(106,"ramesh","bike",5600,3);

select * from orders;

#Q43. Write a stored procedure UpdateOrderStatus(order_id, new_status) to update order status.
delimiter //
create procedure UpdateOrderStatus(in order_id int , in new_status varchar(90))
begin
update orders 
set status=new.status wherestatus=new.status order_id=order_id ;
end ;
delimiter ;
call UpdateOrderStatus(301,"successful");
#44. Write a stored procedure using a cursor to loop through all products and print product names.=================================

#🧮 Section K – Window Functions [Q45–Q47]

#Q45. Use RANK() to display customers ranked by total purchase amount.
select name,rank() over(order by city) from customers_1;
#Q46. Use ROW_NUMBER() to list all products with serial numbers.
select name,row_number() over(order by pro_id) from product;
#Q47. Use SUM() with OVER(PARTITION BY CustomerID) to show cumulative spending.
select * from product;
select name,sum(price) over(partition by pro_id) from product;
#🔒 Section L – DCL & TCL [Q48–Q49]

#Q48. Create a new user grocery_admin and grant SELECT, INSERT privileges.
create user 'grocery_admin'@'localhost' identified by 'password123';

grant select,insert on product to 'grocery_admin'@'localhost';

select * from information_schemea.user_privileges
where grantee ="'grocery_admin'@'localhost'";

revoke insert on product from 'grocery_admin'@'localhost';
#Q49. Demonstrate a transaction where multiple order items are inserted and then rolled back using ROLLBACK.
select * from order_items;
insert into order_items values(402,302,202,3,3838),(403,303,203,3,4838),(404,304,204,3,9838);

commit;
rollback;
select * from order_items;
#🧱 Section M – Normalization & Keys [Q50]

#Q50. Explain how you would normalize this Grocery Database up to 3NF,
#mentioning which columns form the Primary, Foreign, and Candidate Keys.
create table customers_2(
customer_id int,-- primary key
cust2_id int,-- candidate key
name varchar(70),
email varchar(70) unique,-- candidate key
phone bigint,
city varchar(70),
foreign key (cust2_id) references customers_1(cust_1));-- foreign key
