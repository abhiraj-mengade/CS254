
/* Create a table called FLIGHT */
CREATE TABLE FLIGHT(flno integer PRIMARY KEY, fromplace varchar(255), toplace varchar(255), distance int, departs varchar(255), arrives varchar(255) );

/* a.)Create few records in this table */
INSERT INTO FLIGHT VALUES(1,'India','UAE',2000,'8:00','16:00');
INSERT INTO FLIGHT VALUES(2,'Sri-Lanka','India',600,'7:00','10:00');
INSERT INTO FLIGHT VALUES(3,'Frankfurt','Saudi',2000,'8:00','21:00');
INSERT INTO FLIGHT VALUES(4,'Sydney','Los-Angeles',3000,'10:00','22:00');
INSERT INTO FLIGHT VALUES(5,'India','Laos',2300,'11:00','13:00');
COMMIT;

/* Display all the records from the table */
-- SELECT * FROM FLIGHT;

/* b.) Altering table */
ALTER TABLE FLIGHT 
ADD price int;


/*c.) Dropping a row */
DELETE FROM FLIGHT WHERE flno = 4;
-- SELECT * FROM FLIGHT;

/*d.) Dropping a column */
ALTER TABLE FLIGHT 
DROP COLUMN distance;
SELECT * FROM FLIGHT;

/*e.) Updating a row */
UPDATE FLIGHT
SET price = 1000
WHERE flno = 1;
SELECT * FROM FLIGHT;

/*f.) Delete data from */
DELETE FROM FLIGHT;
SELECT * FROM FLIGHT;

/*g.) Rename column price to journey_price*/
ALTER TABLE FLIGHT
RENAME COLUMN price TO journey_price;
INSERT INTO FLIGHT VALUES(1,'India','UAE','8:00','16:00',2000);
SELECT * FROM FLIGHT;
















