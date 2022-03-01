CREATE TABLE STUDENT(
     USN int PRIMARY KEY,
     SName varchar(255),
     Address varchar(255),
     Phone varchar(20),
     Gender varchar(10) CHECK (Gender IN ('Male', 'Female', 'Others')));


CREATE TABLE IAMARKS(
     USN int,
     Subcode int,
     `Subject name` varchar(255),
     Test1 int CHECK (Test1 BETWEEN 0 AND 10),
     Test2 int CHECK (Test2 BETWEEN 0 AND 10),
     Test3 int CHECK (Test3 BETWEEN 0 AND 10),
     FinalIA int CHECK (FinalIA BETWEEN 0 AND 30),
     FOREIGN KEY (USN) REFERENCES STUDENT (USN));

CREATE TRIGGER calc_finalIA BEFORE INSERT ON IAMARKS FOR EACH ROW SET NEW.FinalIA = NEW.Test1 + NEW.Test2 + NEW.Test3;

CREATE TRIGGER update_finalIA BEFORE UPDATE ON IAMARKS FOR EACH ROW SET NEW.FinalIA = NEW.Test1 + NEW.Test2 + NEW.Test3;

SELECT *,
     CASE
     WHEN FinalIA BETWEEN 20 AND 30 THEN 'Outstanding'
     WHEN FinalIA BETWEEN 10 AND 20 THEN 'Average'
     ELSE 'Weak'
     END
     AS CAT FROM IAMARKS;


