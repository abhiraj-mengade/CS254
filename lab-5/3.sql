CREATE TABLE book (
book_id INT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
publisher_name VARCHAR(255),
pub_date DATE
);
CREATE TABLE book_authors (
book_id INT NOT NULL,
author_name VARCHAR(255),
FOREIGN KEY (book_id) REFERENCES book(book_id)
);
CREATE TABLE book_copies (
book_id INT NOT NULL,
programme_id INT PRIMARY KEY,
num_copies INT NOT NULL,
FOREIGN KEY (book_id) REFERENCES book(book_id)
);
CREATE TABLE publisher (
f_name VARCHAR(80),
l_name VARCHAR(80),
address VARCHAR(255),
phone VARCHAR(25)
);
CREATE TABLE book_lending (
book_id INT NOT NULL,
programme_id INT NOT NULL,
card_no INT,
date_out DATE NOT NULL,
due_date DATE,
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (programme_id) REFERENCES book_copies(programme_id)
);

INSERT INTO book VALUES
(1, 'Don Quixote of La Mancha', 'Henry Munchan', '2021-6-6'),
(2, 'Crime and Punishment', 'Nicoli Ducker', '2021-5-7'),
(3, 'Dracula', 'Verena Lesper', '2022-1-23'),
(4, 'Great Expectations', 'Verena Lesper', '2021-6-20'),
(5, 'David Copperfield', 'Nicoli Ducker', '2021-10-27'),
(6, 'Divine Comedy', 'Danella Stallan', '2021-10-21'),
(7, 'Canterbury Tales', 'Danella Stallan', '2021-8-22'),
(8, 'In Search of Lost Time', 'Danella Stallan', '2021-7-18'),
(9, 'Treasure Island', 'Danella Stallan', '2021-11-24'),
(10, 'Lolita', 'Jaclin Baynam', '1998-3-20');


INSERT INTO book_authors VALUES
(1, "Leo Tolstoy" ),
(2, "Fyodor Doestevisky"),
(3, "Charles Dickens"),
(4, "Charles Dickens"),
(5, "Charles Dickens"),
(6, "Dante"),
(7, "Alexandre Dumas"),
(8, "Marcel Proust"),
(9, "Robert Louis Stevenson"),
(10, "Robert Louis Stevenson");

INSERT INTO book_copies VALUES
(2, 2, 44),
(1, 1, 87),
(3, 3, 25),
(4, 4, 57),
(5, 5, 100),
(6, 6, 24),
(7, 7, 100),
(8, 8, 66),
(9, 9, 12),
(10, 10, 55);

INSERT INTO publisher VALUES
('Verena', 'Lesper', '788 Johnson Center', '+86-766-117-9865'),
('Nicoli', 'Ducker', '77 Meadow Vale Hill', '+62-829-382-1965'),
('Danella', 'Stallan', '45206 Loomis Place', '+387-102-305-5492'),
('Luigi', 'Bareham', '605 Steensland Plaza', '+86-357-334-8465'),
('Jaclin', 'Baynam', '50 Rigney Place', '+62-808-723-7265');


INSERT INTO book_lending VALUES
(1, 1, 32, '2017-02-1', '2017-03-1'),
(3, 3, 31, '2017-02-5', '2017-03-5'),
(2, 2, 1, '2018-07-6', '2018-08-6'),
(3, 3, 5, '2021-09-20', '2021-10-20'),
(4, 4, 5, '2020-09-20', '2020-10-20');


SELECT book_id, title, publisher_name FROM book;


SELECT b.book_id, b.title, bl.date_out
FROM book b, book_lending bl
WHERE
b.book_id = bl.book_id AND
bl.date_out BETWEEN '2017-01-01' AND '2017-03-31';

DELETE FROM book_authors WHERE book_id = 1;
DELETE FROM book_lending WHERE book_id = 1;
DELETE FROM book_copies WHERE book_id = 1;
DELETE FROM book WHERE book_id = 1;

SELECT book_id, title, publisher_name, YEAR(pub_date) AS pub_year
FROM book
WHERE pub_date = '1998-03-20';

SELECT b.title FROM
book b, book_authors ba
WHERE b.book_id = ba.book_id AND ba.author_name = 'Charles Dickens';

ALTER TABLE publisher
ADD COLUMN name VARCHAR(255);
UPDATE publisher
SET name = CONCAT(f_name, ' ', l_name);

SELECT DATE_FORMAT(DATE_ADD(pub_date, INTERVAL -2 MONTH), '%Y-%m-01')
FROM book
WHERE title = 'Dracula';

SELECT YEAR(pub_date) AS year, COUNT(*) AS num_books
FROM book
GROUP BY year
HAVING num_books > 3;

SELECT book_id, SUM(num_copies) AS total_copies
FROM book_copies
GROUP BY book_id
HAVING book_id = 3;