CREATE TABLE students (
id INT PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255),
email VARCHAR(255),
gender ENUM('M', 'F'),
city VARCHAR(255) NOT NULL,
country VARCHAR(255) NOT NULL
);
INSERT INTO students VALUES
(1, 'Alvy', 'Pietruszka', 'apietruszka0@toplist.cz', 'M', 'Paris 15', 'France'),
(2, 'Maryl', 'Collacombe', 'mcollacombe1@ycombinator.com', 'F', 'Tarbes', 'France'),
(3, 'Amos', 'Skiplorne', 'askiplorne2@unicef.org', 'M', 'Tarbes', 'France'),
(4, 'Verla', 'Brabham', 'vbrabham3@forbes.com', 'F', 'Poitiers', 'France'),
(5, 'Devi', 'Staynes', 'dstaynes4@google.es', 'F', 'Angers', 'France'),
(6, 'Rikki', 'Egleton', 'regleton5@opera.com', 'F', 'Soissons', 'France'),
(7, 'Rosy', 'Dragonette', 'rdragonette6@netlog.com', 'F', 'Saskatoon', 'Canada'),
(8, 'Jethro', 'Creek', 'jcreek7@google.fr', 'M', 'Nanterre', 'France'),
(9, 'Wye', 'Alliott', 'walliott8@youtu.be', 'M', 'Orlando', 'United States'),
(10, 'Tait', 'Asplin', 'tasplin9@hao123.com', 'M', 'Hénin-Beaumont', 'France');


SELECT id, first_name, CHAR_LENGTH(first_name) AS first_name_length
FROM students;

SELECT CONCAT(first_name, ' ', last_name) AS name
FROM students;

SELECT INSERT(first_name, 1, 2, '##') AS masked_name
FROM students;

SELECT LOWER(first_name) AS first_name_in_lower_case
FROM students;

SELECT first_name, LENGTH(first_name) AS `LENGTH(first_name)`
FROM students;

-- Querying to find students with the character 'A' in their names
SELECT id, first_name, last_name
FROM students
WHERE LOWER(first_name) LIKE '%a%';

SELECT CONCAT('', first_name, '') 
AS padded_name, TRIM(CONCAT('', first_name,' ' ))
AS trimmed_name
FROM students;

SELECT first_name, STRCMP(first_name, 'Alvy') AS is_Alvy
FROM students;

SELECT first_name, SUBSTR(email, 1, 10) AS `SUBSTR(email, 1, 10)`
FROM students;