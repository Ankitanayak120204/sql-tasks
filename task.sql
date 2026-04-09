-- PART 1: DDL -- 

create database GizmoMart_DB;
use GizmoMart_DB;

CREATE TABLE products (
productID int primary key,
productName varchar(100),
category varchar(50),
price decimal(10,2),
stockQuantity int,
rating decimal(3,1));

-- PART 2: DML -- 

insert into products values
(1,"Wireless Mouse","Electronics",25.50,150,4.5),
(2,"Mechanical Keyboard","Electronics",85.00,40,4.8),
(3,"Desk Lamp","Home Office",30.00,80,4.2),
(4,"Ergonomic Chair","Home Office",250.00,15,4.7),
(5,"Gaming Headset","Electronics",60.00,90,3.9),
(6,"Water Bottle","Accessories",15.00,300,4.1),
(7,"Laptop Stand","Home Office",45.00,60,4.6),
(8,"USB-C Hub","Electronics",40.00,120,4.0);

update products set price=50.00 where productName="Gaming Headset";

delete from products where productName="Water Bottle";

-- PART 3: DQL -- 

select * from products;

select productName, price from products;

select productName from products where price>50;

-- PART 4: CLAUSES -- 

select productName from products where category="Electronics" and price<70;

select * from products where price between 30 and 100;

select * from products where productName like "L%";

select * from products where productName like "Laptop%";

select * from products where category != "Electronics";

select * from products order by price;

select * from products order by rating desc;

select * from products order by category,price;

select * from products order by price desc limit 3;

select * from products order by price limit 2;

select * from products where rating in (4.5,4.7,4.8);

select * from products where stockQuantity between 50 and 200;

select * from products where stockQuantity not between 50 and 200;

-- PART 5: AGGREGATES --  

select count(*) from products;

select avg(price) from products;

select min(price) from products;

select max(price) from products;

select sum(stockQuantity) from products;

-- PART 6: GROUP BY & HAVING -- 

select category, count(*) from products group by category;

select category,sum(stockQuantity) from products group by category;

select category,avg(rating) from products group by category;

select avg(price) from products where price>50;

select category,count(productName) from products group by category having count(productName)>2;
