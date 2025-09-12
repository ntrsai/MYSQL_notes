#.............................................................AIRLINES........................................................................................
create database airline;
use airline;

create table airline(
id int primary key,
airline_name varchar(50) not null,
flight_no int not null,
cust_name varchar(30) not null,
origin varchar(40),
cust_tarvel_date date not null,
ticket_price int not null,
destination varchar(50),
aircraft_type varchar(70),
status_flight varchar(60));

drop table customer;
select * from airline;
insert into airline(id,airline_name,flight_no,cust_name,origin,
cust_tarvel_date,ticket_price,destination,aircraft_type,status_flight)
values(1,'air_india',1202,'rahul_kumar','delhi','2025-07-05',1290,'mumbai','airline_A1202','Delayed'),
(2,'air_india',1102,'sai_kumar','delhi','2025-07-07',1290,'jaipur','airline_A1102','Delayed'),
(3,'air_india',1102,'rahul_raj','mumbai','2025-07-05',1290,'delhi','airline_A1203','ON_TIME'),
(4,'indigo',1202,'sai','delhi','2025-07-09',1990,'mumbai','airline_A1202','ON_TIME'),
(5,'air_india',1202,'rahul_kumar','delhi','2025-07-05',1290,'mumbai','airline_A1202','Delayed'),
(6,'INDIGO',1202,'arjun','delhi','2025-07-05',1290,'mumbai','airline_A1272','Delayed'),
(7,'go_first',1202,'akshay','delhi','2025-07-05',1290,'kolkata','airline_A9202','on_time'),
(8,'go_first',1202,'virat','kolkata','2025-07-05',1290,'hyderabad','airline_A8202','Delayed'),
(9,'air_india',1202,'nehra','mumbai','2025-07-05',1290,'kolkata','airline_A9202','on_time'),
(10,'indigo',1202,'siraj','delhi','2025-07-05',1290,'kerala','airline_A9202','Delayed');

#queries:
SELECT * FROM airline WHERE status_flight = 'Delayed';

UPDATE airline SET status_flight = 'ON_TIME' WHERE flight_no = 1202;

ALTER TABLE airline ADD COLUMN seats_available INT DEFAULT 100;

DELETE FROM airline WHERE cust_name = 'akshay';

TRUNCATE TABLE airline;


#..........................................................university............................................................................

create table university(
id int primary key,
uni_name varchar(50),
location varchar(40),
campus_area varchar(40),
founded int,
typeof_university varchar(30),
ranking int,
students int,
faculity int,
sports varchar(60));
select * from university;
drop table university;
insert into university(id,uni_name,location,campus_area,founded,typeof_university,ranking,students,faculity,sports)
values(1,'harvad_university','usa',5000,1990,'private',210,16000,2300,'cricket,carrom,football'),
(2,'stanford_university','usa',4000,1980,'private',200,19000,2300,'cricket,carrom,football'),
(3,'university_of_ordix','uk',5000,1990,'public',20,10000,300,'cricket,carrom,football,kabbadi,chess'),
(4,'stanford_university','usa',5000,1990,'private',210,16000,2300,'cricket,carrom,football'),
(5,'mit_university','uk',9000,2990,'private',2810,16000,2300,'cricket,football'),
(6,'tokyo_university','japan',5000,1990,'public',210,86000,2300,'cricket,carrom,football'),
(7,'national_sgn_university','singapore',7000,1990,'private',210,16000,2300,'carrom,football'),
(8,'harvad_university','japan',5900,9990,'private',210,16000,2300,'cricket,carrom,football'),
(9,'mit_university','america',5000,3490,'private',210,16000,2300,'cricket,carrom,football'),
(10,'ordix_university','kenya',5000,1090,'private',210,16000,2300,'cricket,volleyball,football');

#queries:
SELECT * FROM university ORDER BY ranking ASC LIMIT 3;

UPDATE university SET location = 'usa' WHERE uni_name = 'harvad_university' AND location = 'japan';

ALTER TABLE university ADD COLUMN university_email VARCHAR(100);

DELETE FROM university WHERE ranking > 2000;

TRUNCATE TABLE university;


#..........................................................ARMY...........................................................................
create table army(
id int primary key,
name varchar(30),
contact_no varchar(70),
age int,
Rank_army int,
gender varchar(29),
unit varchar(60),
enlistment_date date,
specialization varchar(40),
status_ varchar(30));

select * from army;
drop table army;
insert into army
(id,name,contact_no,age,Rank_army,gender,unit,enlistment_date,specialization,status_)values
(101,'arjun mehra','89898988821',21,22,'male','alpha squad','2010-01-11','sniper','active'),
(102,'ashish mehra','89898988821',21,223,'male','alpha squad','2010-11-19','sniper','active'),
(103,'virat_kumar','2344988821',24,262,'male','bravo squad','2010-08-09','sniper','active'),
(104,'arjun mehra','7702562778',31,252,'male','bravo squad','2010-05-01','communications','active'),
(105,'arjun mehra','98895488821',41,252,'male','alpha squad','2010-07-08','sniper','active'),
(106,'bosh mehra','76898988821',42,242,'male','delta squad','2010-09-01','sniper','active'),
(107,'naree mehra','768898988821',32,232,'male','equo unit','2010-08-09','communications','active'),
(108,'ashu mehra','99898988821',26,229,'male','bavo squad','2010-09-09','sniper','active'),
(109,'mahesh mehra','89898988821',29,122,'male','alpha squad','2010-09-09','sniper','active'),
(110,'arjuna mehra','770288821',35,212,'male','delta force','2010-09-09','intelligence','active');

#queries:
SELECT * FROM army WHERE unit = 'alpha squad';

UPDATE army SET specialization = 'intel' WHERE Rank_army = 229;

ALTER TABLE army ADD COLUMN years_of_service INT;

DELETE FROM army WHERE id = 110;

TRUNCATE TABLE army;


#............................................................COMPANY....................................................................................
create table company(
id int primary key,
emp_name varchar(50),
campany_name varchar(20),
founder varchar(40),
industry varchar(50),
number_of_emply int,
founded_year int,
company_location varchar(60),
head_quarters varchar(70),
annual_revenue  int);
select * from company;
drop table company;
insert into company (id,emp_name,campany_name,founder,industry,number_of_emply,founded_year,company_location,head_quarters,annual_revenue)
values
(1,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(2,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(3,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(4,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(5,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(6,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(7,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(8,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(9,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500),
(10,'ranjith','develearn','alice_jhonson','technology',2500,2010,'mumbai','pune_india',3500);

#queries:
SELECT * FROM company WHERE founded_year = 2010;

UPDATE company SET annual_revenue = 4500 WHERE id = 1;

ALTER TABLE company ADD COLUMN company_website VARCHAR(100);

DELETE FROM company WHERE id = 2;

TRUNCATE TABLE company;

#..............................................................DRDO.......................................................................

create table drdo(
product_id int primary key,
product_name varchar(70),
domain varchar(40),
lead_scientist varchar(70),
start_year int,
end_year int,
budget_cr int,
status varchar(40),
location varchar(40),
collaboration varchar(50));

drop table drdo;
select * from drdo;
insert into drdo (product_id,product_name,domain,lead_scientist,start_year,end_year,budget_cr,status,location , collaboration)
value(01,'agni-v','missile','dr.a.kumar',2010,2015,800,'completed','hyderabad','indian_army'),
(02,'survillance','missile','dr.s.iyer',2011,2017,700,'completed','hyderabad','isro'),
(03,'netra','drone','dr.a.neha',2010,2015,300,'completed','chennai','haL'),
(04,'abhas','drone','dr.a.sharma',2013,2019,400,'completed','benguluru','bel,bad'),
(05,'rustom-2','missile','dr.a.rahul',2010,2015,800,'completed','hyderabad','indian_army'),
(06,'kali','direct enegry','dr.a.sarika',2017,2021,900,'completed','mumbaI','BARC'),
(07,'netra','drone','dr.a.neha',2010,2015,300,'completed','chennai','haL'),
(08,'rustom-2','missile','dr.a.rahul',2010,2015,800,'completed','hyderabad','indian_army'),
(09,'astra','missile','dr.a.kaul',2018,2024,800,'ongoing','chandigarh','iit_kanpur'),
(10,'rustom-2','missile','dr.a.rahul',2010,2015,800,'completed','hyderabad','indian_army');

#queries:
SELECT * FROM drdo WHERE status = 'completed';

UPDATE drdo SET budget_cr = 900 WHERE product_name = 'astra';

ALTER TABLE drdo ADD COLUMN success_rate DECIMAL(4,2);

DELETE FROM drdo WHERE product_name = 'netra' AND location = 'chennai';

TRUNCATE TABLE drdo;


#.............................................................ISRO....................................................................
create table isro(
mission_id int,
mission_name varchar(950) not null,
launch_date date,
payload varchar(50),
launch_site varchar(70),
mission_outcome  varchar(70),
success varchar(60),
orbit_type  varchar(60),
country varchar(60),
duration int);

drop table isro;
select * from isro;
insert into isro(mission_id,mission_name,launch_date,payload,launch_site,mission_outcome,success,orbit_type,country,duration)
values(1,'Chandrayaan-1','2008-10-22','moon_impact_probe','satish_dhawan','psro','success','lunar','india',312),
(2,'mangalyam','2013-1-22','mars_orbit','satish_dhawan','psro','success','mars','india',800),
(3,'Chandrayaan-2','2019-07-22','vikram_lander','satish_dhawan','psro','partial_success','lunar','india',110),
(4,'gsta-1','2018-03-29','gstr_satellite','satish_dhawan','psro','partial_success','lunar','india',212),
(5,'risat-2b','2018-03-12','moon_impact_probe','satish_dhawan','psro','success','lunar','india',312),
(6,'insat','2016-10-22','multi_satellite','satish_dhawan','104_iinsat','partial_success','lunar','india',012),
(7,'insat-3D','2018-10-07','moon_impact_probe','satish_dhawan','psro','success','gso','india',382),
(8,'astrosat','2011-01-22','risat-1','satish_dhawan','psro','partial_success','leo','india',912),
(9,'cartosat','2017-08-22','israt_satellite','satish_dhawan','psro','success','sso','india',612),
(10,'adtiya_11','2007-11-12','104_satellite','satish_dhawan','psro','partial_success','sso','india',712);

#queries:
SELECT * FROM isro WHERE success = 'success';

UPDATE isro SET launch_date = '2014-01-22' WHERE mission_name = 'mangalyam';

ALTER TABLE isro ADD COLUMN mission_type VARCHAR(100);

DELETE FROM isro WHERE mission_name = 'adtiya_11';

TRUNCATE TABLE isro;


#..................................................cryptocurrency............................................................
create table crypto(
id int primary key,
Name varchar(70),
Symbol varchar(70),
Price int,
Market_Cap int,
24h_Volume varchar(60),
Circulating_Supply  int,
Max_Supply int,
24h_Change varchar(60),
Launch_Year int,
Consensus_Mechanism varchar(70));

select * from crypto;
drop table crypto;

insert into crypto(id,name,symbol,price,market_cap,24h_Volume,Circulating_Supply,Max_Supply,24h_Change,Launch_Year,Consensus_Mechanism)
values(1,'biotin','BTC',61500,121,'35B',195,8700,'+1.22',2008,'pow'),
(2,'etherem','eth',11500,131,'15B',175,1700,'+1.82',2018,'pos'),
(3,'biotin','bnb',61500,121,'35B',195,8700,'+1.22',2008,'pow'),
(4,'binanace_coin','Ada',61500,121,'35B',195,8700,'+1.22',2008,'pow'),
(5,'cardono','sol',61500,121,'35B',195,8700,'+1.22',2008,'pow'),
(6,'silona','xrp',61500,121,'35B',195,8700,'+1.22',2008,'pow'),
(7,'xrp','doge',61500,121,'35B',195,8700,'+1.22',2008,'pow'),
(8,'palkodat','dot',61500,121,'35B',195,8700,'+1.22',2008,'pow'),
(9,'avalanche','avax',61500,121,'35B',195,8700,'+1.22',2008,'pow'),
(10,'litecoin','ltc',61500,121,'35B',195,8700,'+1.22',2008,'pow');

#queries:
SELECT * FROM crypto WHERE price > 10000;

UPDATE crypto SET name = 'bitcoin' WHERE name = 'biotin';

ALTER TABLE crypto ADD COLUMN founder VARCHAR(50);

DELETE FROM crypto WHERE id = 3;

TRUNCATE TABLE crypto;

#....................................................stock market.....................................................................

create table stock_market(
Stock_id int primary key,
Company_Name varchar(80),
Sector varchar(80),
Market_Cap varchar(80),
Open_Price varchar(80),
Close_Price varchar(80) ,
Week_High varchar(80),
Week_Low varchar(80),
PE_Ratio varchar(80),
Dividend_Yield varchar(80));
drop table stock_market;

select * from stock_market;
insert into  stock_market(Stock_id,Company_Name,Sector,Market_Cap,Open_Price,Close_Price,Week_High,Week_Low,PE_Ratio,Dividend_Yield)
values
(1,'apple','technology','180.50','182.00','183.00','179.80','52000000','2900','28.5'),
(2,'microsoft','technology','170.00','167.00','156.00','134.00','3400000','2800','27.5'),
(3,'automotive','communication','190.00','197.00','136.00','114.00','5400000','2500','24.5'),
(4,'retail','Financials','190.00','147.00','186.00','164.00','6100000','2900','29.5'),
(5,'microsoft','technology','170.00','167.00','156.00','134.00','3400000','2800','27.5'),
(6,'retail','telecom','720.00','715.30','730.00','710.50','400000','900','72.8'),
(7,'meta','Communication','310.30','312.80','314.00','308.20','22000,000','800','21.7'),
(8,'wmt','Consumer_Goods','158.20','159.40','160.00','157.30','19200,000','430','22.5'),
(9,'microsoft','Telecom','17.50','17.80','18.00','17.40','25300000','130','7.9'),
(10,'automotivbe','financial','170.00','167.00','156.00','134.00','3400000','2800','27.5');

#queries:
SELECT * FROM stock_market WHERE sector = 'technology';

UPDATE stock_market SET Dividend_Yield = '30.0' WHERE Company_Name = 'apple';

ALTER TABLE stock_market ADD COLUMN stock_rating DECIMAL(3,1);

DELETE FROM stock_market WHERE Stock_id = 10;

TRUNCATE TABLE stock_market;



#............................................................taj hotel...................................................

create table taj_hotel(
Room_ID int auto_increment primary key,
Guest_Name varchar(70),
Check_In_Date date,
Check_Out_Date date,
Room_Type varchar(60),
Room_Rate_Per_Night bigint,
Total_Nights int,
Total_Amount bigint,
Payment_Status varchar(70),
Booking_Source varchar(70));

select * from taj_hotel;
drop table taj_hotel;
insert into taj_hotel
(Guest_Name,Check_In_Date,Check_Out_Date,Room_Type,Room_Rate_Per_Night,Total_Nights,Total_Amount,Payment_Status,Booking_Source)
values 
('rahul_kumar','2025-04-03','2025-04-04','delux',1500,1,'3500','paid','website'),
('mahesh','2025-07-03','2025-07-04','delux',1800,6,'4500','pending','website'),
('rohit sharma','2025-07-03','2025-07-04','delux',1900,4,'6500','paid','website'),
('vikram','2025-08-03','2025-08-04','delux',1500,1,'3500','pending','website'),
('sandhya','2025-09-03','2025-09-04','delux',1500,2,'9500','pending','website'),
('narayan','2025-02-03','2025-02-04','delux',1500,5,'11500','paid','website'),
('neelaveni','2025-01-03','2025-01-04','delux',1500,5,'8500','pending','website'),
('srigowripriya','2025-04-03','2025-04-04','delux',1500,2,'1500','paid','website'),
('samantha','2025-10-03','2025-10-04','delux',1500,5,'6500','paid','website'),
('kajal','2025-11-03','2025-11-04','delux',1500,1,'3500','pending','website');

-- queries
SELECT * FROM taj_hotel WHERE Payment_Status = 'pending';

UPDATE taj_hotel SET Total_Amount = Room_Rate_Per_Night * Total_Nights;

ALTER TABLE taj_hotel ADD COLUMN guest_email VARCHAR(100);

DELETE FROM taj_hotel WHERE Guest_Name = 'vikram';

TRUNCATE TABLE taj_hotel;

#..........................................................filpcart.....................................................
create table flipcart(
Product_ID int primary key auto_increment,
Product_Name varchar(70),
Brand varchar(80) unique,
Category varchar(50),
Price bigint,
Rating decimal(2,1),
Reviews_Count bigint,
Availability varchar(80),
Seller varchar(70),
Delivery_Time varchar(50)); #doubt (2 days)nee ela tesikovali "varchar" kakaunda amyina undaa ? and okavella add column chesamu tarvatha and danilo values add cheyali ante elaa ?

select * from flipcart;
drop table flipcart;
insert into flipcart
(Product_Name,Brand,Category,Price,Rating,Reviews_Count,
Availability,Seller,Delivery_Time)
values
('Redmi Note',11,'Xiaomi Smartphones',12999,4.4,1582,'In_Stock','Flashtech Retail','2 Days'),
('HP',10,'Laptop_HP_Laptops',42999,4.2,899,'In_Stock','RetailNet','3 Days'),
('Wildcraft Backpack',9,'Wildcraft_Bags',1499,4.5,320,'In_Stock','OmniTech Retail','4 Days'),
('Samsung',26,'Washing',13990,4.3,245,'In Stock','Tech Connect','5 Days'),
('Noise ColorFit',36,'Pulse	Noise_Wearables',1299,4.1,1120,'In_Stock','ApparioRetail','2 Days'),
('Adidas Men',140,'Running Shoes	Adidas	Footwear',3499,4.0,514,'In_Stock','Adidas Official','3 Days'),
('Realme Buds Wireless', 22,'Neo	Realme	Audio',1199,4.2,860,'In Stock','SuperComNet','2 Days'),
('Boat Airdopes', 162,'Boat	Audio',	999,4.3,1780,'In Stock','RetailNet','2 Days'),
('Canon EOS', 150 ,'Camera	Canon_Electronics',35990,4.6,610,'In_Stock','CameraWale','4 Days'),
('Prestige Induction',34,'Cooktop_Prestige_Kitchen',2199,4.0,378,'In_Stock','Big Bazaar _Online','3 Days');

#queries:
SELECT * FROM flipcart WHERE Price < 5000;

UPDATE flipcart SET Rating = 4.8 WHERE Product_Name = 'Boat Airdopes';

ALTER TABLE flipcart ADD COLUMN delivery_charges INT DEFAULT 0;

DELETE FROM flipcart WHERE Brand = 150;

TRUNCATE TABLE flipcart;


	
	

