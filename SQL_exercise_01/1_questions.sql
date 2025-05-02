-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store
-- 1.1 Select the names of all the products in the store.
	SELECT Name FROM Products;

-- 1.2 Select the names and the prices of all the products in the store.
	SELECT Name,Price From Products;
    
-- 1.3 Select the name of the products with a price less than or equal to $200.
	SELECT Name FROM Products WHERE Price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
	SELECT * FROM Products WHERE PRICE BETWEEN 60 AND 120;
    
-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
	SELECT Name, Price * 100 AS Price FROM Products;

-- 1.6 Compute the average price of all the products.
	SELECT AVG(Price) AS avg_price FROM Products;
    
-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
	SELECT AVG(Price) AS avg_price FROM Products WHERE Manufacturer=2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
	SELECT COUNT(*) FROM Products WHERE Price >=180;
    
-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
	SELECT Name,Price FROM Products WHERE Price >=180 ORDER BY Price DESC, Name ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
	SELECT * FROM Products INNER JOIN Manufacturers ON Products.Manufacturer=Manufacturers.Code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
	SELECT Products.Name, Products.Price,Manufacturers.Name FROM Products INNER JOIN Manufacturers ON Products.Manufacturer=Manufacturers.Code;
    
-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
	SELECT Manufacturer,AVG(price) AS avg_each_manufacturers_product FROM Products GROUP BY Manufacturer; 

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
	SELECT Manufacturers.Name, AVG(price) AS avg_each_manufacturers_product FROM Manufacturers INNER JOIN Products ON Manufacturers.Code=Products.Manufacturer GROUP BY Manufacturers.Name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
	SELECT Manufacturers.Name, AVG(price) AS avg_each_manufacturers_product FROM Manufacturers INNER JOIN Products ON Manufacturers.Code=Products.Manufacturer GROUP BY Manufacturers.Name HAVING AVG(Price) >= 150;

-- 1.15 Select the name and price of the cheapest product.
	SELECT Name,Price FROM Products WHERE Price=(SELECT MIN(Price) FROM Products);  

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
   SELECT A.Name, A.Price, F.Name
   FROM Products A INNER JOIN Manufacturers F
   ON A.Manufacturer = F.Code
     AND A.Price =
     (
       SELECT MAX(A.Price)
         FROM Products A
         WHERE A.Manufacturer = F.Code
     );

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
	INSERT INTO Products (Code,Name,Price,Manufacturer) VALUES (11,'Loudspeakers',7,2);
    
-- 1.18 Update the name of product 8 to "Laser Printer".
	UPDATE Products SET Name='Laser Printer' WHERE Code=8;

-- 1.19 Apply a 10% discount to all products.
	UPDATE Products SET Price=Price * 0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
	UPDATE Products SET Price=Price * 0.9 WHERE Price >=120;
