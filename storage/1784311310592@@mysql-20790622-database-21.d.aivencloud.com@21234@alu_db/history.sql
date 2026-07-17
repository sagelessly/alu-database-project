/* 2026-07-17 20:05:57 [330 ms] */ 
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
/* 2026-07-17 20:14:42 [1415 ms] */ 
DESCRIBE Students;
/* 2026-07-17 20:15:06 [401 ms] */ 
INSERT INTO Students (first_name, last_name, email)
VALUES ('NDEGEYA Nina', 'UWASE', 'u.ndegeya@alustudent.com');
/* 2026-07-17 20:15:29 [208 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:23:00 [1561 ms] */ 
DROP TABLE Students;
/* 2026-07-17 20:24:04 [223 ms] */ 
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    classroom_id INT,
    enrollment_date DATE
);
/* 2026-07-17 20:24:31 [209 ms] */ 
INSERT INTO Students (name, email, classroom_id, enrollment_date)
VALUES
('NDEGEYA Nina UWASE', 'u.ndegeya@alustudent.com', 1, '2026-01-15'),
('John Doe', 'john@alustudent.com', 1, '2026-01-15'),
('Grace Mukamana', 'grace@alustudent.com', 2, '2026-01-15'),
('Eric Niyonzima', 'eric@alustudent.com', 2, '2026-01-15'),
('Alice Uwimana', 'alice@alustudent.com', 3, '2026-01-15');
/* 2026-07-17 20:24:57 [259 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:26:20 [199 ms] */ 
INSERT INTO Students (name, email, classroom_id, enrollment_date)
VALUES
('NDEGEYA Nina UWASE', 'u.ndegeya@alustudent.com', 1, '2026-01-15'),
('alex doi', 'alex@alustudent.com', 8, '2026-01-1'),
('Grace Mukamana', 'grace@alustudent.com', 2, '2026-01-15'),
('Eric Niyonzima', 'eric@alustudent.com', 2, '2026-01-15'),
('Alice Uwimana', 'alice@alustudent.com', 3, '2026-01-15');
/* 2026-07-17 20:26:25 [258 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:26:49 [247 ms] */ 
TRUNCATE table Students;
/* 2026-07-17 20:26:56 [279 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:27:05 [193 ms] */ 
INSERT INTO Students (name, email, classroom_id, enrollment_date)
VALUES
('NDEGEYA Nina UWASE', 'u.ndegeya@alustudent.com', 1, '2026-01-15'),
('alex doi', 'alex@alustudent.com', 8, '2026-01-1'),
('Grace Mukamana', 'grace@alustudent.com', 2, '2026-01-15'),
('Eric Niyonzima', 'eric@alustudent.com', 2, '2026-01-15'),
('Alice Uwimana', 'alice@alustudent.com', 3, '2026-01-15');
/* 2026-07-17 20:27:10 [200 ms] */ 
TRUNCATE table Students;
/* 2026-07-17 20:27:13 [286 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:27:59 [191 ms] */ 
INSERT INTO Students (name, email, classroom_id, enrollment_date)
VALUES
('NDEGEYA Nina', 'u.ndegeya@alustudent.com', 1, '2026-01-15'),
('alex doi', 'alex@alustudent.com', 8, '2026-01-1'),
('Grace Mukamana', 'grace@alustudent.com', 2, '2026-01-15'),
('Eric Niyonzima', 'eric@alustudent.com', 4, '2026-01-15'),
('Alice Uwimana', 'alice@alustudent.com', 3, '2026-01-15');
/* 2026-07-17 20:28:02 [287 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:28:27 [287 ms] */ 
UPDATE Students
SET email = 'nina@alu.edu'
WHERE student_id = 1;
/* 2026-07-17 20:28:36 [183 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:28:51 [256 ms] */ 
DELETE FROM Students
WHERE student_id = 5;
/* 2026-07-17 20:28:58 [273 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:29:14 [182 ms] */ 
SELECT *
FROM Students
WHERE classroom_id = 1 LIMIT 100;
/* 2026-07-17 20:29:22 [203 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 20:29:29 [181 ms] */ 
SELECT *
FROM Students
WHERE classroom_id = 1 LIMIT 100;
/* 2026-07-17 21:21:30 [1307 ms] */ 
SELECT * FROM Students LIMIT 100;
/* 2026-07-17 22:17:15 [1295 ms] */ 
CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);
/* 2026-07-17 22:17:53 [459 ms] */ 
INSERT INTO Classroom (room_number, building, capacity)
VALUES
('A101', 'Master Building', 40),
('A102', 'Main Building', 35),
('B201', 'Science Block', 50),
('C301', 'Engineering Block', 45),
('D401', 'Business Block', 30);
/* 2026-07-17 22:18:27 [177 ms] */ 
SELECT * FROM Classroom LIMIT 100;
/* 2026-07-17 22:21:21 [199 ms] */ 
DROP TABLE Students;
/* 2026-07-17 22:21:39 [226 ms] */ 
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    classroom_id INT,
    enrollment_date DATE,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);
/* 2026-07-17 22:22:42 [183 ms] */ 
INSERT INTO Students (name, email, classroom_id, enrollment_date)
VALUES
('NDEGEYA Nina', 'u.ndegeya@alustudent.com', 1, '2026-01-15'),
('alex doi', 'alex@alustudent.com', 1, '2026-01-15'),
('Grace Mukamana', 'grace@alustudent.com', 2, '2026-01-15'),
('Eric Niyonzima', 'eric@alustudent.com', 2, '2026-01-15'),
('Alice Uwimana', 'alice@alustudent.com', 3, '2026-01-15');
/* 2026-07-17 22:23:06 [183 ms] */ 
UPDATE Students
SET email = 'nina@alu.edu'
WHERE student_id = 1;
/* 2026-07-17 22:23:14 [183 ms] */ 
DELETE FROM Students
WHERE student_id = 5;
/* 2026-07-17 22:23:22 [170 ms] */ 
SELECT *
FROM Students
WHERE classroom_id = 1 LIMIT 100;
/* 2026-07-17 22:23:43 [285 ms] */ 
SELECT * FROM Classroom LIMIT 100;
/* 2026-07-17 22:25:53 [299 ms] */ 
UPDATE Classroom
SET building = 'Administration building'
WHERE capacity = 40;
/* 2026-07-17 22:27:09 [177 ms] */ 
DELETE FROM Classroom
WHERE capacity = 50;
/* 2026-07-17 22:27:15 [170 ms] */ 
SELECT * FROM Classroom LIMIT 100;
