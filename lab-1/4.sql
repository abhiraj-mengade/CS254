CREATE TABLE SUB ( 
name varchar(8), 
age int CHECK (age BETWEEN 0 AND 99999), 
mark1 int CHECK (mark1 BETWEEN 0 AND 9999), 
mark2 int CHECK (mark2 BETWEEN 0 AND 9999), 
mark3 int CHECK (mark3 BETWEEN 0 AND 9999));

/*a.)Enter at least five tuples for the given relation.*/

INSERT INTO SUB VALUES
('Ross', 21, 90, 95, 92), 
('John', 20, 89, 92, 91), 
('Jacob', 21, 83, 81, 90), 
('Ron', 21, 96, 98, 93), 
('Harry', 20, 99, 97, 92), 
('Ginny', 20, 98, 92, 95);
-- SELECT * FROM SUB;

/*b.)Add one more column with field name as total with data type as number(5).*/
ALTER TABLE SUB ADD total int CHECK (total BETWEEN 0 AND 99999);
-- SELECT * FROM SUB;

/*c.)Update the age of sub for a particular student.*/
UPDATE SUB SET age = 21 WHERE name = 'John';
-- SELECT * FROM SUB WHERE name = 'John'; 

/*d.) DELETE entry */
DELETE FROM SUB WHERE name = 'Ross';

/*e.) DROP COLUMN*/
ALTER TABLE SUB DROP COLUMN mark3;
SELECT * FROM SUB;


/*f.)Modify the table by changing the data type of ,mark3 to number(6)*/
ALTER TABLE SUB MODIFY COLUMN mark3 int CHECK (mark3 BETWEEN 0 AND 999999);
SELECT * FROM SUB;


/*g.) Delete all the data from the sub table.*/
DELETE FROM SUB;
SELECT * FROM SUB;


/*h.)Delete the table.*/
DROP TABLE SUB;
SHOW TABLES;


































