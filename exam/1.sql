CREATE TABLE EmployeeInfo (
  EmpID INT PRIMARY KEY,
  EmpFname VARCHAR(100), 
  EmpLname VARCHAR(100), 
  Department VARCHAR(100), 
  Project VARCHAR(100), 
  Address VARCHAR(255), 
  DOB DATE, 
  Gender ENUM('M', 'F', 'O')
);

CREATE TABLE EmployeePositionInfo(
  EmpID INT, 
  EmpPosition VARCHAR(100), 
  DateOfJoining DATE, 
  Salary NUMERIC(15, 2),
  FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
);

INSERT INTO EmployeeInfo VALUES 
('1', 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '1976-12-01', 'M'),('2', 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '1968-05-02', 'F'),
('3', 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1980-01-01', 'M'),
('4', 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '1992-05-02', 'F'),('5', 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '1974-07-03', 'M');

INSERT INTO EmployeePositionInfo VALUES
('1', 'Manager', '2022-05-01', 500000 ),
('2', 'Executive', '2022-05-02', 75000 ),
('3', 'Manager', '2022-05-01', 90000 ),
('4', 'Lead', '2022-05-02', 85000 ),
('5', 'Executive', '2022-05-01', 300000 );

SELECT UPPER(EmpFname) AS EmpName FROM EmployeeInfo;


SELECT COUNT(*) FROM EmployeeInfo WHERE Department = 'HR';
SELECT CURRENT_DATE();

SELECT SUBSTRING(EmpLname, 1, 4) FROM EmployeeInfo;
SELECT MID(Address, 0, LOCATE('(',Address)) FROM EmployeeInfo;

SELECT * FROM EmployeePosition WHERE Salary BETWEEN '50000' AND '100000';
SELECT * FROM EmployeeInfo WHERE EmpFname LIKE 'S%';

SELECT CONCAT(EmpFname, ' ', EmpLname) AS 'FullName' FROM EmployeeInfo;
SELECT *
FROM EmployeeInfo
WHERE DATEDIFF(CURRENT_DATE(),DOB)/365 > 25 AND GENDER='M';

ALTER TABLE EmployeeInfo
  ADD Name_Length INT;

  UPDATE EmployeeInfo 
  SET Name_Length = LENGTH(CONCAT(EmpFname, EmpLName));
