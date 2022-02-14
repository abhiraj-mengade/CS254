CREATE TABLE SALESMAN (
    Salesman_id int NOT NULL,
    Name varchar(255),
    City varchar(255),
    Salary int,
    PRIMARY KEY (Salesman_id)
);
CREATE TABLE CUSTOMER (
    Customer_id int NOT NULL,
    Cust_Name varchar(255),
    City varchar(255),
    Salesman_id int,
    PRIMARY KEY (Customer_id),
    FOREIGN KEY (Salesman_id) REFERENCES SALESMAN(Salesman_id) ON DELETE
    SET NULL ON UPDATE CASCADE
);
CREATE TABLE ORDERS (
    Ord_No int NOT NULL,
    Purchase_Amt int,
    Ord_Date DATE,
    Customer_id int,
    Salesman_id int,
    PRIMARY KEY (Ord_No),
    FOREIGN KEY (Salesman_id) REFERENCES SALESMAN(Salesman_id) ON DELETE
    SET NULL ON UPDATE CASCADE,
        FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id) ON DELETE
    SET NULL ON UPDATE CASCADE
);
/*a.)Insert Entries*/
INSERT INTO SALESMAN
VALUES (1, 'VICTOR', 'BANGALORE', 2000),
    (2, 'SAM', 'MANGALORE', 3000),
    (3, 'BEN', 'DELHI', 2500),
    (4, 'ROSS', 'MUMBAI', 3000),
    (5, 'JOHN', 'BANGALORE', 3500),
    (6, 'RACHEL', 'MUMBAI', 3500);
INSERT INTO CUSTOMER
VALUES (1, 'JACOB', 'BANGALORE', 5),
    (2, 'GWEN', 'MUMBAI', 4),
    (3, 'TIM', 'DELHI', 3),
    (4, 'HECTOR', 'BANGALORE', 5),
    (5, 'JIM', 'DELHI', 3),
    (6, 'LANCE', 'DELHI', 3),
    (7, 'VINNY', 'MUMBAI', 6),
    (8, 'DUSTIN', 'MUMBAI', 6);
INSERT INTO ORDERS
VALUES (1, 200, '2022-01-01', 1, 5),
    (2, 150, '2022-01-01', 2, 4),
    (3, 300, '2022-01-03', 2, 6),
    (4, 250, '2022-01-03', 3, 3),
    (5, 250, '2022-01-03', 4, 5),
    (6, 200, '2022-01-03', 5, 3),
    (7, 100, '2022-01-04', 6, 3),
    (8, 120, '2022-01-06', 7, 6),
    (9, 210, '2022-01-06', 8, 6),
    (10, 320, '2022-01-06', 2, 6);
-- SELECT * from ORDERS;
-- SELECT * from CUSTOMER;
-- SELECT * from SALESMAN;
/*b.)Retrieve the details of all the customers and orders.*/
SELECT O.Ord_No,
    O.Purchase_Amt,
    O.Ord_Date,
    O.Customer_id,
    C.Cust_Name,
    C.City,
    O.Salesman_id,
    S.Name,
    S.City,
    S.Salary
FROM ORDERS O
    LEFT JOIN CUSTOMER C ON O.Customer_id = C.Customer_id
    LEFT JOIN SALESMAN S ON O.Salesman_id = S.Salesman_id;
/*c.)Get the customers handled by a particular salesman.*/
SELECT C.Customer_id,
    C.Cust_Name,
    C.City,
    S.Salesman_id,
    S.Name,
    S.City,
    S.Salary
FROM CUSTOMER C
    LEFT JOIN SALESMAN S ON C.Salesman_id = S.Salesman_id
WHERE S.Salesman_id = 3;
/*d.) Get the details of orders purchased by customers.*/
SELECT O.Ord_No,
    O.Purchase_Amt,
    O.Ord_Date,
    O.Customer_id,
    C.Cust_name,
    C.City
FROM ORDERS O
    INNER JOIN CUSTOMER C ON O.Customer_id = C.Customer_id
WHERE O.Customer_id = 2;
/*e.)Through salesman_id retrieve the details of his sold orders.*/
SELECT O.Ord_No,
    O.Purchase_Amt,
    O.Ord_Date,
    O.Salesman_id,
    S.Name,
    S.City,
    S.Salary
FROM ORDERS O
    INNER JOIN SALESMAN S ON O.Salesman_id = S.Salesman_id
WHERE O.Salesman_id = 6;
/*f.)update SALESMAN*/
UPDATE SALESMAN
SET Salary = Salary + 2000,
    City = 'DELHI'
WHERE Salesman_id = 1;
-- SELECT * FROM SALESMAN WHERE Salesman_id = 1;
/*g.DELETE order*/
DELETE FROM ORDERS
WHERE Ord_No = 8;
-- SELECT * FROM ORDERS
/*h.) RENAME city to place*/
ALTER TABLE SALESMAN
    RENAME COLUMN City TO Place;
SELECT *
FROM SALESMAN;
/*i.)Drop Purchase_Amt*/
ALTER TABLE ORDERS DROP COLUMN Purchase_Amt;
SELECT *
FROM ORDERS;
/*j.)Drop the table salesman.*/
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE SALESMAN;
SET FOREIGN_KEY_CHECKS = 1;
SHOW TABLES;