-- PART 1: DDL -- 

-- 1. Create database GizmoMart_DB  
create database GizmoMart_DB;

-- 2. Use the database
use GizmoMart_DB;

-- 3. Create Products table 
-- 4. Add Rating column
CREATE TABLE products (
productID int primary key,
productName varchar(100),
category varchar(50),
price decimal(10,2),
stockQuantity int,
rating decimal(3,1));

-- PART 2: DML -- 

-- 5. Insert all records
insert into products values
(1,"Wireless Mouse","Electronics",25.50,150,4.5),
(2,"Mechanical Keyboard","Electronics",85.00,40,4.8),
(3,"Desk Lamp","Home Office",30.00,80,4.2),
(4,"Ergonomic Chair","Home Office",250.00,15,4.7),
(5,"Gaming Headset","Electronics",60.00,90,3.9),
(6,"Water Bottle","Accessories",15.00,300,4.1),
(7,"Laptop Stand","Home Office",45.00,60,4.6),
(8,"USB-C Hub","Electronics",40.00,120,4.0);

-- 6. Update Gaming Headset price to 50
update products set price=50.00 where productName="Gaming Headset";

-- 7. Delete Water Bottle
delete from products where productName="Water Bottle";

-- PART 3: DQL -- 

-- 8. Display all records   
select * from products;

-- 9. Display ProductName and Price
select productName, price from products;

-- 10. Display Electronics products
select productName from products where category="Electronics";

-- 11. Products with price > 50
select productName from products where price>50;

-- PART 4: CLAUSES -- 

-- 12. Electronics products with price < 70     
select productName from products where category="Electronics" and price<70;

-- 13. Price between 30 and 100
select * from products where price between 30 and 100;

-- 14. Name starts with L
select * from products where productName like "L%";

-- 15. Name contains Laptop
select * from products where productName like "Laptop%";

-- 16. Not Electronics
select * from products where category != "Electronics";

-- 17. Sort by price asc       
select * from products order by price;

-- 18. Sort by rating desc
select * from products order by rating desc;

-- 19. Sort by category then price
select * from products order by category,price;

-- 20. Top 3 expensive
select * from products order by price desc limit 3;

-- 21. 2 least expensive
select * from products order by price limit 2;

-- 22. Rating IN (4.5,4.7,4.8)
select * from products where rating in (4.5,4.7,4.8);

-- 23. Stock between 50 and 200
select * from products where stockQuantity between 50 and 200;

-- 24. Stock NOT between 50 and 200
select * from products where stockQuantity not between 50 and 200;

-- PART 5: AGGREGATES --  

-- 25. Count products    
select count(*) from products;

-- 26. Avg price
select avg(price) from products;

-- 27. Min price
select min(price) from products;

-- 28. Max price
select max(price) from products;

-- 29. Total stock
select sum(stockQuantity) from products;

-- PART 6: GROUP BY & HAVING -- 

-- 30. Category with count   
select category, count(*) from products group by category;

-- 31. Category with total stock
select category,sum(stockQuantity) from products group by category;

-- 32. Category avg rating
select category,avg(rating) from products group by category;

-- 33. Avg price > 50
select avg(price) from products where price>50;

-- 34. Categories with more than 2 products
select category,count(productName) from products group by category having count(productName)>2;
