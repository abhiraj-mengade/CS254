CREATE TABLE room (
r_id INT PRIMARY KEY,
room_type ENUM('Single', 'Double', 'Deluxe')
);
CREATE TABLE doctors (
d_id INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
salary NUMERIC,
specification VARCHAR(255)
);
CREATE TABLE patient (
p_id INT PRIMARY KEY,
r_id INT NOT NULL,
d_id INT,
p_name VARCHAR(255) NOT NULL,
city VARCHAR(255),
contact VARCHAR(25),
p_date DATE NOT NULL,
FOREIGN KEY (d_id) REFERENCES doctors(d_id),
FOREIGN KEY (r_id) REFERENCES room(r_id)
);
CREATE TABLE test_diagnosis (
p_id INT NOT NULL,
diagno VARCHAR(255),
details VARCHAR(255),
FOREIGN KEY (p_id) REFERENCES patient(p_id)
);

INSERT INTO room VALUES
(101, 'Double'),
(102, 'Deluxe'),
(103, 'Deluxe'),
(104, 'Double'),
(105, 'Double'),
(106, 'Deluxe'),
(107, 'Deluxe'),
(108, 'Single'),
(109, 'Double'),
(110, 'Single');

INSERT INTO doctors VALUES
(1, 'Peria Hawe', 27180, 'ENT'),
(2, 'Cecelia Pietranek', 46110, 'Neurologist'),
(3, 'Dayle Halladay', 30770, 'Pediatrician'),
(4, 'Timothee Britnell', 86150, 'Cardiologist'),
(5, 'Delcina Poundsford', 58610, 'Neurologist'),
(6, 'Darsie Worling', 50180, 'Pediatrician'),
(7, 'Salmon Hunnicot', 70560, 'Pediatrician'),
(8, 'Don Deery', 55700, 'General Practitioner'),
(9, 'Bail Lascell', 63860, 'Cardiologist'),
(10, 'Isacco Eccleshare', 59860, 'Pediatrician');

INSERT INTO patient VALUES
(1, 101, 3, 'Ernest Earney', 'Arroyo Seco', '+54 (552) 637-9873', '2021-11-09'),
(2, 107, 9, 'Madalyn Braunstein', 'Huddinge', '+46 (360) 362-8676', '2021-10-13'),
(3, 103, 2, 'Miguel Juggings', 'Cilongkrangpusaka', '+62 (957) 331-6191', '2021-05-19'),
(4, 101, 7, 'Bride Sussams', 'Monkey Hill', '+1 (764) 512-5023', '2015-07-27'),
(5, 105, 2, 'Ettie Cubin', 'Maxixe', '+258 (870) 777-0419', '2016-12-22'),
(6, 109, 1, 'Francesca Gunn', 'Jednorożec', '+48 (645) 932-5694', '2021-09-11'),
(7, 102, 5, 'Onida Petto', 'Huangtan', '+86 (797) 140-7353', '2021-09-26'),
(8, 109, 10, 'Brinn Brabbins', 'Tshikapa', '+242 (263) 609-4294', '2021-10-30'),
(9, 106, 2, 'Dulcia Beauman', 'Maglaj', '+387 (988) 292-9263', '2015-12-21'),
(10, 105, 7, 'Smith Aleksich', 'Guocun', '+86 (525) 561-1589', '2016-02-25');

INSERT INTO test_diagnosis VALUES
(1, 'Biopsy', 'OK'),
(1, 'Clotting', 'OK'),
(1, 'Imaging', 'OK'),
(4, 'LP', 'OK'),
(5, 'Imaging', 'Fatty deposits'),
(5, 'Clotting', 'OK'),
(7, 'Ultrasound', 'OK'),
(8, 'LP', 'Bacterial Meningitis'),
(6, 'Clotting', 'OK'),
(10, 'Endoscopy', 'OK');

SELECT p.p_id, p.p_name, COUNT(*) AS NUM_tests
FROM patient p, test_diagnosis td
WHERE p.p_id=td.p_id
GROUP BY p.p_id
HAVING num_tests>1


SELECT *
FROM doctors
WHERE d_id NOT IN (
SELECT d_id FROM patient
);

SELECT * FROM doctors
ORDER BY salary;

FROM test_diagnosis td JOIN patient p
ON td.p_id = p.p_id;

-- Querying for >=3 patients to avoid empty set
SELECT d.d_id, d.name, COUNT(*) AS num_patients
FROM patient p, doctors d
WHERE p.d_id = d.d_id
GROUP BY d.d_id
HAVING num_patients >= 3;

SELECT d.d_id, d.name AS doctor, p.p_name, r.r_id
FROM doctors d, patient p, room r
WHERE
p.d_id = d.d_id AND
p.r_id = r.r_id AND
r.r_id BETWEEN 102 AND 105;

SELECT * FROM patient
ORDER BY p_date;

SELECT COUNT(*) AS deluxe_occupants
FROM patient p, room r
WHERE p.r_id = r.r_id AND r.room_type = 'Deluxe';

SELECT * FROM doctors
WHERE salary < 40000;

SELECT * FROM patient
WHERE p_date < '2017-10-10';