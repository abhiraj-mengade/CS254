   
    create table department
    (Dno int primary key,
    Dname varchar(50));

    create table branch
    (Bcode int primary key,
    BName varchar(50),
    Dno int references department(Dno));

    create table course(Ccode varchar(8) primary key,
    Cname varchar(50),
    credits int,
    Dno int references department(Dno));

    create table Branch_course
    (Bcode int references branch(Bcode),
    Ccode varchar(8) references course(Ccode),
    semester int,
    primary key(Bcode,Ccode));

    create table student
    (rollno int primary key auto_increment,
    name varchar(30) not null,
    dob date,
    gender char(1),
    doa date,
    Bcode int references branch(Bcode),
    check (gender in ('M','F','T')));

    create table Enrolls (rollno int references student(rollno),
    Ccode varchar(8) references course(Ccode),
    Sess varchar(10),
    grade char(1),
    primary key(rollno,Ccode,Sess),
    check(grade in('A','B','C','D','E','U','S'))
    );

    insert INTO department values
    (1,'Physics'),
    (2,'Mathematics'),
    (3,'Humanities'),
    (4,'Computer Science'),
    (5,'Electronics'),
    (6,'Mechanical Engineering'),
    (7,'Civil Engineering');

    insert into branch values
    (1,'Modern Physics',1),
    (2,'Algebra',2),
    (3,'Applied Mathematics',2),
    (4,'Mathematical Analysis',2),
    (5,'Social Science',3),
    (6,'Linguistics',3),
    (7,'Data structures & Algorithms',4),
    (8,'Computer Science',4),
    (9,'Digital Electronics',5),
    (10,'Power Electronics',5),
    (11,'Circuit Design',5),
    (12,'Integrated Circuits',5),
    (13,'Mechanical Engineering',6),
    (14,'Information Technology',4),
    (15,'Civil Engineering',7);

    insert into course values
    ('PHY101','Waves and Electromagnetics',4,1),
    ('PHY201','Quantum Physics',3,1),
    ('MA101','Linear Algebra',4,2),
    ('MA201','Discrete Mathematics',4,2),
    ('MA301','Probability and Statistics',4,2),
    ('MA401','Numerical Techniques',4,2),
    ('HS101','Spoken and written',2,3),
    ('HS201','Science,Technology and society',2,3),
    ('HS301','Technical Writing',2,3),
    ('CS101','Introduction to Programming',4,4),
    ('CS201','Data structures',4,4),
    ('CS301','Design and analysis of Algorithms',4,4),
    ('CS302','Introduction to Object Oriented Programming',4,4),
    ('CS401','Database Management Systems',4,4),
    ('CS402','Design and analysis of Algorithms',4,4),
    ('CS403','Operating Systems',4,4),
    ('EC401','Computer Organization and Architecture',4,4),
    ('EC101','Basic Electronics Circuits',4,5),
    ('EC201','Basic Electrical Engineering',4,5),
    ('EC301','Digital Logic Design',4,5),
    ('EC601','Digital IC Design',4,5);

    insert INTO Branch_course VALUES
    (1,'PHY101',1),
    (1,'PHY 201',2),
    (2,'MA101',1),
    (3,'MA201',2),
    (3,'MA301',3),
    (4,'MA401',4),
    (6,'HS101',1),
    (5,'HS201',2),
    (6,'HS301',3),
    (8,'CS101',1),
    (7,'CS201',2),
    (7,'CS301',3),
    (8,'CS302',3),
    (8,'CS401',4),
    (8,'CS402',4),
    (8,'CS403',4),
    (11,'EC401',4),
    (9,'EC101',1),
    (10,'EC201',2),
    (11,'EC301',3),
    (12,'EC601',6),
    (13,'CS101',1),
    (14,'CS101',1),
    (15,'CS101',1);


    INSERT INTO student VALUES
    ( 1, 'Darshan Patel' , '2001-02-27', 'M', '2018-06-24', 1),
    ( 2, 'Yash Patel' , '2000-11-13', 'M', '2018-06-25', 2),

    ( 3, 'Neel Patel' , '2000-06-19', 'M', '2018-06-24', 3),

    ( 4, 'Ramesh Kaushik' , '2001-10-13', 'M', '2018-06-25', 4),

    ( 5, 'Keavy Tomlinson', '2000-05-19', 'F', '2018-06-24', 5),

    ( 6, 'Catrin Dotson' , '2000-06-17', 'F', '2018-06-25', 6),

    ( 7, 'Ravina Churill' , '2001-07-14', 'F', '2018-06-24', 7),

    ( 8, 'Jackson Nairn' , '2000-08-02', 'M', '2018-06-25', 8),

    ( 9,'Branden Mohammed', '1999-09-19', 'M', '2018-06-24', 9),

    ( 10, 'Zhane Bailey' , '1998-10-14', 'F', '2018-06-25', 10),

    ( 11, 'Myron Tanner' , '1999-11-24', 'M', '2018-06-24', 11),

    ( 12, 'Aine Moreno' , '1997-12-24', 'F', '2018-06-25', 12);


    insert into Enrolls values
    (1,'PHY101','AU2018','A'),
    (2,'MA101','AU2018','A'),
    (3,'MA201','WIN2018','A'),
    (3,'MA301','AU2019','A'),
    (7,'CS301','AU2019','U'),
    (8,'CS302','AU2019','S'),
    (8,'CS401','WIN2019','S'),
    (8,'CS402','WIN2019','S'),
    (8,'CS403','WIN2019','S'),
    (10,'EC201','WIN2018','B');


    /*a).*/
    SELECT S.Rollno, S.Name, S.Dob, S.Gender, S.Doa, S.Bcode, B.Bname, B.Dno, D.Dname
    FROM student S
    INNER JOIN branch B ON S.Bcode = B.Bcode
    INNER JOIN department D on B.Dno = D.Dno
    WHERE B.Dno = 1;


    /*b.)*/
    SELECT * FROM branch WHERE Dno = 2;

    /*c.)*/
    SELECT C.Ccode, C.Cname, C.Credits, C.Dno, BC.Semester
    FROM course C
    INNER JOIN Branch_course BC on C.Ccode = BC.Ccode
    WHERE C.Dno = 1 AND BC.Semester = 1;

    /*d.)*/
    SELECT E.Rollno, S.Name, E.Ccode, E.Grade
    FROM Enrolls E
    INNER JOIN student S ON E.Rollno = S.Rollno;






















