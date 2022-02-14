/*Q1.*/
CREATE TABLE cust(
custid int NOT NULL,
Name varchar(255));

/*a.)*/
ALTER TABLE cust MODIFY Name varchar(255) NOT NULL;
/*b.)*/
ALTER TABLE cust MODIFY custid int NOT NULL UNIQUE;


CREATE TABLE student (
regno int,
mark int CHECK (mark >= 0 AND mark <= 100),
PRIMARY KEY (regno));

/*c.)*/
ALTER TABLE student ADD CHECK (LENGTH(regno)=4);
INSERT INTO student VALUES
(12345,11);
SELECT * FROM student;


CREATE TABLE EMP (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(10),
DEPTNO INT,
SAL DECIMAL(7,2));

/*d.)*/
ALTER TABLE EMP
MODIFY ENAME VARCHAR(20) NOT NULL,
MODIFY JOB VARCHAR(10) NOT NULL;

/*e.)*/
ALTER TABLE EMP ADD COLUMN EXPERIENCE INT;

/*f.)*/
ALTER TABLE EMP MODIFY JOB VARCHAR(20) NOT NULL;

INSERT INTO EMP VALUES
(1,'Mr.abc','Cleaner',12,667.12,12);

SELECT * FROM EMP;























