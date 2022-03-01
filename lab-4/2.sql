CREATE TABLE movies
     (Movie_id int PRIMARY KEY,
     Movie_title varchar(255),
     Actor varchar(255),
     Actress varchar(255),
     Year int,
     Rating decimal(2,1) CHECK(Rating>=0 AND Rating<=5),
     Budget int,
     location varchar(255),
     Director varchar(255));

INSERT INTO movies VALUES
     (1, "The Shawshank Redemption", "Tim Robbins", NULL, 1994, 4.6, 200000, "London", "Frank Darabont"),
     (2, "Its a Wonderful Life", "James Stewart", "Donna Reed", 1946, 4.3, 150000, "London", "Frank Capra"),
     (3, "The Pianist", "Adrien Brody", "Emilia Fox", 2002, 4.2, 200000, "New York", "Roman Polanski"),
     (4, "Casino", "Robert De Niro", "Sharon Stone", 1995, 4.1, 90000, "London", "Martin Scorsese"),
     (5, "Hera Pheri", "Akshay Kumar", "Tabu", 2000, 4, 120000, "India", "Priyadarshan");
     (6, "Sample", "John", "Donna Reed", 1990, 4.2, 100000, "London", "Kim");


SELECT * FROM movies WHERE Actress = "Donna Reed";

SELECT * FROM movies WHERE Budget > 100000 AND Actor like "A%";

SELECT * FROM movies WHERE location="London" AND Rating > 4;

SELECT AVG(Rating) FROM movies WHERE Year>1990;
SELECT * FROM movies WHERE Rating = (SELECT MAX(Rating) FROM movies) OR Rating = (SELECT MIN(Rating) FROM movies);

UPDATE movies SET Rating = 5 WHERE Director = "Priyadarshan";
