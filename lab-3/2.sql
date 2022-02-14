/*Q2.*/
CREATE TABLE Products (
ProductID int,
ProductName varchar(255),
SupplierID int,
CategoryID int,
Unit int,
Price decimal(10, 2),
PRIMARY KEY (ProductID));

CREATE TABLE Customers (
CustomerID int,
CustomerName varchar(255),
ContactName varchar(255),
Address varchar(255),
City varchar(255),
PostalCode varchar(15),
Country varchar(255),
PRIMARY KEY (CustomerID));

INSERT INTO Products VALUES
(1, 'Shirt', 2, 4, 50, 55),
(2, 'Pant', 1, 3, 25, 60),
(3, 'Towel', 2, 5, 100, 18),
(4, 'Stapler', 4, 2, 30, 12),
(5, 'Belt', 1, 3, 50, 30),
(6, 'Wallet', 1, 3, 60, 35),
(7, 'Jacket', 2, 4, 40, 59),
(8, 'Hanger', 3, 6, 100, 10),
(9, 'Handbag', 4, 4, 40, 65),
(10, 'Handkerchief', 1, 3, 100, 10);

INSERT INTO Customers VALUES 
(1, 'Suresh', 'Ramesh', 'Rajajinagar', 'Bangalore', '560010',
'India'),
(2, 'John', 'Shaun', 'Oxford Street', 'London', 'W1D 2HS', 'UK'),
(3, 'Jim', 'Tim', 'Bond Street', 'London', 'W1S 1SP', 'UK'),
(4, 'Monica', 'Rachel', '19th Avenue', 'San Francisco', 'CA
94109', 'USA'),
(5, 'Ben', 'Clark', 'Rue de Rivoli', 'Paris', '75004', 'France'),
(6, 'Dan', 'Peter', 'Gibb Street', 'Birmingham', 'ON L1J 1Y4',
'UK'),
(7, 'Sam', 'Lombard', 'Surathkal', 'Mangalore', '575025',
'India'),
(8, 'Ram', 'Shyam', 'Goregaon', 'Mumbai', '400104', 'India'),
(9, 'Karan', 'Arjun', 'Bannerghata', 'Bangalore', '560070',
'India'),
(10, 'Om', 'Sid', 'Moonak', 'Punjab', '148033', 'India');


/*a.)*/
SELECT *,
CASE WHEN Price IS NOT NULL THEN Price+5
END AS `Price+10` FROM Products;

/*b.)*/
SELECT * FROM Products WHERE Price=18;

/*c.)*/
SELECT * FROM Products WHERE Price>30;

/*d.)*/
SELECT * FROM Products WHERE Price!=18;

/*e.)*/
SELECT * FROM Products WHERE Price BETWEEN 50 AND 60;

/*f.)*/
SELECT * FROM Customers WHERE City='London' AND Country='UK';

/*g.)*/
SELECT * FROM Customers WHERE City IN ('Paris', 'London', 'San
Francisco');





























