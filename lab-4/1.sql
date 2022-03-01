CREATE TABLE Lectures(
     First_name varchar(255),
     Last_name varchar(255),
     Age int,
     City varchar(255),
     State varchar(255),
     Pin_code varchar(20),
     Subject varchar(255),
     Salary int,
     Years_of_experience int);

INSERT INTO Lectures VALUES
     ("Hello", "Boy", 19, "Bangalore", "Karnataka", "560010", "C", 25000, 1),
     ("Boo", "Girl", 26, "Mumbai", "Maharashtra", "410010", "OS", 20000, 3),
     ("Ram", "Di", 23, "Mangalore", "Karnataka", "575025", "C", 22000, 0),
     ("Trans", "Long", 27, "Delhi", NULL, "101010", "DBMS", 25000, 4),
     ("John", "Cena", 25, "Bangalore", "Karnataka", "560020", "C", 24000, 3),
     ("Robert", "Ford", 24, "Pune", "Maharashtra", "410020", "OS", 20000, 3),     
     ("Augustus", "Roman", 22, "Jaipur", "Rajasthan", "301010", "DBMS", 21000, 2),
     ("Archie", "Andrews", 20, "Jaisalmer", "Rajasthan", "301020", "OS", 19000, 0),
     ("Flaber", "Fisk", 27, "Mumbai", "Maharashtra", "410030", "DBMS", 22000, 1),
     ("Tony", "Stark", 22, "Bangalore", "Karnataka", "560030", "C", 30000, 3);

-- a.)
SELECT First_name, Last_name, Age, Salary FROM Lectures WHERE Age >= 25 AND Salary >=20000;

--b.) 
SELECT * FROM Lectures WHERE Age BETWEEN 25 AND 35;

-- c.) 
UPDATE Lectures SET Salary = Salary * 1.2 WHERE Years_of_experience > 2;
SELECT * FROM Lectures;

-- d.)
SELECT First_name, Last_name, State FROM Lectures WHERE State != "Karnataka";

-- e.)
ALTER TABLE Lectures ADD Address varchar(255);
UPDATE Lectures SET Address = CONCAT(City, ", ", State, ", ", "Pin code: ", Pin_code);
SELECT First_name, Last_name, City, State, Pin_code, Address FROM Lectures;

-- f.)
SELECT SUM(Salary), MIN(Salary), MAX(Salary), AVG(Salary) FROM Lectures;

--h.) 
UPDATE Lectures SET Subject = "python" WHERE Subject = "C";
SELECT First_name, Last_name, Subject FROM Lectures;

--i.)
SELECT * FROM Lectures WHERE Salary > 20000 AND First_name like "a%";

--j.)
SELECT * FROM Lectures WHERE Years_of_experience > 2 AND First_name like "%s%";