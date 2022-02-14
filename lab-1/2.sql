/*a.)Entering table values*/

CREATE TABLE BOOK(
Book_id int NOT NULL,
Title varchar(255),
Publisher_Name varchar(255),
Pub_Year int NOT NULL,
PRIMARY KEY (Book_id));
CREATE TABLE BOOK_AUTHORS( 
Book_id int NOT NULL, 
Author_Name varchar(255), 
FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id));
CREATE TABLE PUBLISHER( 
Book_id int NOT NULL, 
Name varchar(255), 
Address varchar(255), 
Phone varchar(50), 
FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id));
INSERT INTO BOOK VALUES
  (1, 'DBMS', 'MCGRAW-HILL', 2017),
  (2, 'ADBMS', 'MCGRAW-HILL', 2016), 
  (3, 'CN', 'PEARSON', 2016), 
  (4, 'CG', 'PLANETA', 2015), 
  (5, 'OS', 'PEARSON', 2016);
INSERT INTO BOOK_AUTHORS VALUES 
 (1, 'NAVATHE'), 
 (2, 'NAVATHE'), 
 (3, 'TANENBAUM'), 
 (4, 'EDWARD ANGEL'), 
 (5, 'GALVIN');
INSERT INTO PUBLISHER VALUES 
 (1, 'MCGRAW-HILL', 'BANGALORE', '9191919191'), 
 (2, 'MCGRAW-HILL', 'BANGALORE', '9191919191'), 
 (3, 'PEARSON', 'NEW DELHI', '8181818181'), 
 (4, 'PLANETA', 'BANGALORE', '5151515151'), 
 (5, 'PEARSON', 'NEW DELHI', '8181818181');
SELECT * FROM BOOK;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM PUBLISHER;

/*c.) Details of a author*/
SELECT 
B.Book_id, 
B.Title, 
A.Author_Name, 
B.Publisher_Name, 
B.Pub_Year 
FROM 
BOOK B, 
BOOK_AUTHORS A 
WHERE 
B.Book_id = A.Book_id 
AND
A.Author_Name = 'NAVATHE';

/*d.)Delete a book*/
DELETE FROM PUBLISHER WHERE Book_id = 5; 
DELETE FROM BOOK_AUTHORS WHERE Book_id = 5;
DELETE FROM BOOK WHERE Book_id = 5;
-- SELECT * FROM BOOK;

/*e.) update phone number */
UPDATE PUBLISHER 
SET Phone = '7171717171' 
WHERE Name = 'PLANETA';
-- SELECT * FROM PUBLISHER;

/*f.) retrieve the details of author name and publisher details*/
SELECT A.Book_id, 
A.Author_Name, 
P.Name, 
P.Address, 
P.Phone 
FROM BOOK_AUTHORS A, PUBLISHER P 
WHERE A.Book_id=P.Book_id;

/*g.)Drop Author_Name column from BOOK_AUTHORS.*/
ALTER TABLE BOOK_AUTHORS DROP COLUMN Author_Name;
SELECT * FROM BOOK_AUTHORS;

/*h.)Rename Name (from Publisher) to Publisher_name.*/
ALTER TABLE PUBLISHER RENAME COLUMN Name TO Publisher_Name;
SELECT * FROM PUBLISHER;














































