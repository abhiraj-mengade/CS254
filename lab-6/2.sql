CREATE TABLE employees (
empID INT PRIMARY KEY,
empNAME VARCHAR(255) NOT NULL,
empDEPT VARCHAR(255) NOT NULL,
empSALARY INT,
empCITY VARCHAR(255) NOT NULL
);

INSERT INTO employees VALUES
(1, 'Dannie Domelow', 'HR', 8500, 'Mumbai'),
(2, 'Marcellina Lacase', 'HR', 7600, 'Hyderabad'),
(3, 'Bette-ann Aldrin', 'Support', 4700, 'Hyderabad'),
(4, 'Cyrille Simek', 'Business Development', 7100, 'Hyderabad'),
(5, 'Daniela Demogeot', 'Support', 7000, 'Bangalore'),
(6, 'Joyann Shmyr', 'R&D', 8700, 'Delhi'),
(7, 'Averyl Castan', 'Product Management', 10000, 'Mumbai'),
(8, 'Marchelle Armstrong', 'Support', 2300, 'Mumbai'),
(9, 'Cayla McWhin', 'R&D', 10000, 'Hyderabad'),
(10, 'Brig Lampert', 'Legal', 1400, 'Delhi');

SELECT empCITY, SUM(empSALARY) AS total_salary
FROM employees
GROUP BY empCITY;

SELECT empCITY, SUM(empSALARY) AS total_salary
FROM employees
GROUP BY empCITY
HAVING total_salary >= 8000;

SELECT empDEPT, MIN(empSALARY)
FROM employees
GROUP BY empDEPT;

SELECT empDEPT, MAX(empSALARY)
FROM employees
GROUP BY empDEPT;

SELECT empDEPT, MAX(empSALARY) AS max_salary
FROM employees
GROUP BY empDEPT
HAVING max_salary <= 7000;

SELECT empDEPT, AVG(empSALARY)
FROM employees
GROUP BY empDEPT;