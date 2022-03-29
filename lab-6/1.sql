CREATE TABLE employees (
empid INT PRIMARY KEY,
empname VARCHAR(255) NOT NULL,
empemail VARCHAR(255) NOT NULL,
phone_no VARCHAR(25),
salary INT,
city VARCHAR(255) NOT NULL
);

INSERT INTO employees VALUES
(1, 'Joline Hoffmann', 'jhoffmann0@gmail.edu', '+7-105-242-1707', 96900, 'Bangalore'),
(2, 'Harbert Hobbert', 'hhobbert1@flickr.com', '+52-783-503-0336', 53100, 'Pune'),
(3, 'Kalli Throssell', 'kthrossell2@yahoo.com', '+62-539-169-1432', 30000, 'Hyderabad'),
(4, 'Brunhilde Barry', 'bbarry3@gmail.com', '+351-322-243-9101', 96900, 'Bangalore'),
(5, 'Jerald Hanse', 'jhanse4@usda.gov', '+380-118-812-6734', 46700, 'Hyderabad'),
(6, 'Lanita Monroe', 'lmonroe5@gmail.gov', '+7-407-784-8060', 48200, 'Mumbai'),
(7, 'Kirby Demare', 'kdemare6@vistaprint.com', '+62-255-985-0019', 55700, 'Bangalore'),
(8, 'Wolfie O''Kerin', 'wokerin7@mysql.com', '+62-543-328-7641', 57600, 'Hyderabad'),
(9, 'Willdon Forrester', 'wforrester8@indiatimes.com', '+55-103-983-4422', 45400, 'Bangalore'),
(10, 'Carina Taplow', 'ctaplow9@yahoo.com', '+92-326-726-1153', 33800, 'Delhi');


SELECT city, COUNT(*) AS count
FROM employees
GROUP BY city;

SELECT city, COUNT(DISTINCT salary) AS count
FROM employees
GROUP BY city;

SELECT city, COUNT(*) AS count
FROM employees
GROUP BY city
ORDER BY count DESC;

SELECT empname, salary
FROM employees
ORDER BY salary;

SELECT city, COUNT(*) AS count
FROM employees
WHERE salary > 30000
GROUP BY city;

SELECT * FROM employees
WHERE
empemail LIKE '%@gmail.%' OR
empemail LIKE '%@yahoo.%'
;

SELECT COUNT(*) AS count FROM employees
WHERE salary > 15000;


