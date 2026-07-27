-- ==========================================
-- alu_db_full.sql - Complete ALU Database Script
-- ==========================================
-- Consolidated from memberA_students.sql, memberB_classroom.sql,
-- memberC_faculty.sql, memberD_courses.sql, memberE_activities_and_junctions.sql,
-- and group_tasks.sql.
--
-- All CREATE TABLE, INSERT, UPDATE, DELETE, SELECT, join, aggregate,
-- orphan-check, and normalization-check queries in correct dependency order.
-- ==========================================

-- ==========================================
-- 1. Create and use the database
-- ==========================================
CREATE DATABASE IF NOT EXISTS alu_db;
USE alu_db;

-- ==========================================
-- 2. CREATE TABLE statements (dependency order)
-- ==========================================

-- ----- Member C: Faculty (no FK dependencies) -----
CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    department VARCHAR(50)
);

-- ----- Member A: Students (no FK dependencies) -----
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    email VARCHAR(100) NOT NULL UNIQUE,
    enrollment_date DATE,
    major VARCHAR(50)
);

-- ----- Member B: Classroom (no FK dependencies) -----
CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50),
    capacity INT
);

-- ----- Member D: Courses (depends on Faculty + Classroom) -----
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT,
    classroom_id INT,
    credits INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- ----- Member E: Extra_Curricular_Activities (depends on Faculty) -----
CREATE TABLE Extra_Curricular_Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    activity_name VARCHAR(100) NOT NULL,
    advisor_faculty_id INT,
    meeting_day VARCHAR(20),
    FOREIGN KEY (advisor_faculty_id) REFERENCES Faculty(faculty_id)
);

-- ----- Member E: Student_Courses junction (depends on Students + Courses) -----
CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- ----- Member E: Student_Activities junction (depends on Students + Activities) -----
CREATE TABLE Student_Activities (
    student_id INT,
    activity_id INT,
    role VARCHAR(50),
    join_date DATE,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

-- ==========================================
-- 3. INSERT statements (dependency order)
-- ==========================================

-- ----- Member C: Faculty -----
INSERT INTO Faculty (name, email, department) VALUES
('Alice Uwimana', 'alice.uwimana@alu.edu', 'Mathematics'),
('Brian Mugisha', 'brian.mugisha@alu.edu', 'Computer Science'),
('Claire Ingabire', 'claire.ingabire@alu.edu', 'English'),
('David Niyonzima', 'david.niyonzima@alu.edu', 'Physics'),
('Eric Habimana', 'eric.habimana@alu.edu', 'Computer Science');

-- ----- Member A: Students -----
INSERT INTO Students (name, dob, email, enrollment_date, major) VALUES
('Jean Pierre', '2003-05-12', 'jean.pierre@alu.edu', '2021-09-01', 'Computer Science'),
('Marie Uwase', '2002-11-23', 'marie.uwase@alu.edu', '2021-09-01', 'Mathematics'),
('Patrick Nshimiyimana', '2004-02-15', 'patrick.nshimi@alu.edu', '2022-09-01', 'Physics'),
('Aline Murekatete', '2003-07-30', 'aline.murekatete@alu.edu', '2022-09-01', 'English'),
('Yusuf Mukiibi', '2001-12-05', 'yusuf.mukiibi@alu.edu', '2020-09-01', 'Data Science');

-- ----- Member B: Classroom -----
INSERT INTO Classroom (room_number, building, capacity) VALUES
('A101', 'Main Hall', 40),
('A102', 'Main Hall', 35),
('B201', 'Science Block', 30),
('B202', 'Science Block', 25),
('C301', 'Library Wing', 20);

-- ----- Member D: Courses (references Faculty 1-4, Classroom 1-4) -----
INSERT INTO Courses (course_name, faculty_id, classroom_id, credits) VALUES
('Intro to Programming', 2, 1, 3),
('Calculus I', 1, 2, 4),
('English Literature', 3, 3, 3),
('Quantum Physics', 4, 4, 4),
('Data Structures', 2, 1, 3);

-- ----- Member E: Extra_Curricular_Activities (references Faculty 1-4) -----
INSERT INTO Extra_Curricular_Activities (activity_name, advisor_faculty_id, meeting_day) VALUES
('Debate Club', 3, 'Monday'),
('Robotics Club', 2, 'Wednesday'),
('Choir', 1, 'Friday'),
('Basketball Team', 4, 'Tuesday');

-- ----- Member E: Student_Courses (references Students 1-4, Courses 1-5) -----
INSERT INTO Student_Courses (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-09-01', 'A'),
(1, 5, '2023-09-01', 'B'),
(2, 2, '2023-09-01', 'A'),
(3, 3, '2023-09-01', 'B'),
(4, 1, '2023-09-01', 'C');

-- ----- Member E: Student_Activities (references Students 1-4, Activities 1-4) -----
INSERT INTO Student_Activities (student_id, activity_id, role, join_date) VALUES
(1, 2, 'Member', '2023-09-10'),
(2, 1, 'President', '2023-09-10'),
(3, 4, 'Player', '2023-09-12'),
(4, 3, 'Singer', '2023-09-15'),
(1, 1, 'Member', '2023-09-10');

-- ==========================================
-- 4. Individual UPDATE / DELETE / SELECT (labeled by member)
--    Ordered so no DELETE breaks a FK that a later query depends on.
--    All statements use primary keys (not data values) for WHERE clauses.
-- ==========================================

-- ----- Member C: Faculty UPDATE / DELETE / SELECT -----
UPDATE Faculty SET department = 'Data Science' WHERE faculty_id = 2;
DELETE FROM Faculty WHERE faculty_id = 5;   -- id 5 not referenced by any other table
SELECT * FROM Faculty WHERE department = 'Computer Science';

-- ----- Member A: Students UPDATE / DELETE / SELECT -----
UPDATE Students SET major = 'Software Engineering' WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 5;  -- id 5 not referenced by any junction table
SELECT * FROM Students WHERE major = 'Computer Science';

-- ----- Member B: Classroom UPDATE / DELETE / SELECT -----
UPDATE Classroom SET capacity = 45 WHERE classroom_id = 1;
DELETE FROM Classroom WHERE classroom_id = 5;  -- id 5 not referenced by Courses
SELECT * FROM Classroom WHERE building = 'Science Block';

-- ----- Member D: Courses UPDATE / DELETE / SELECT -----
UPDATE Courses SET credits = 4 WHERE course_id = 5;
DELETE FROM Courses WHERE course_id = 4;    -- id 4 not referenced by Student_Courses
SELECT * FROM Courses WHERE faculty_id = 2;

-- ----- Member E: Activities UPDATE / DELETE / SELECT -----
UPDATE Extra_Curricular_Activities SET meeting_day = 'Thursday' WHERE activity_id = 2;
DELETE FROM Student_Activities WHERE student_id = 4 AND activity_id = 3;
SELECT * FROM Extra_Curricular_Activities WHERE advisor_faculty_id = 2;

-- ==========================================
-- 5. Group join queries (Task 3) + Aggregate query (Task 4)
--    All column references use actual column names (s.name, f.name, etc.)
--    with aliases for readability.
-- ==========================================

-- Join 1: Student enrolled in Course, taught by Faculty, in Classroom
SELECT
    CONCAT(s.name, ' enrolled in ', c.course_name,
           ', taught by ', f.name,
           ' in room ', cl.room_number, ' (', cl.building, ')') AS result
FROM Students s
JOIN Student_Courses sc ON s.student_id = sc.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- Join 2: Student participates in Activity, advised by Faculty
SELECT
    CONCAT(s.name, ' participates in ', a.activity_name,
           ', advised by ', f.name) AS result
FROM Students s
JOIN Student_Activities sa ON s.student_id = sa.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.advisor_faculty_id = f.faculty_id;

-- Join 3: Faculty teaching load (courses + classrooms they use)
SELECT
    CONCAT(f.name, ' teaches ', c.course_name,
           ' for ', COUNT(sc.student_id), ' student(s) in ', cl.room_number) AS result
FROM Faculty f
JOIN Courses c ON f.faculty_id = c.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY f.name, c.course_name, cl.room_number;

-- Aggregate: number of students per course
SELECT
    c.course_name,
    COUNT(sc.student_id) AS number_of_students
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name
ORDER BY number_of_students DESC;

-- ==========================================
-- 6. FK Validation / Orphan checks (Task 1 verification)
-- ==========================================
-- These queries verify that every foreign key value in junction and child
-- tables points to an existing primary key in the parent table. If any
-- query returns rows, those are orphaned references that need fixing.

-- Check for Student_Courses rows with no matching Student
SELECT 'Orphaned student_id in Student_Courses' AS check_name,
       sc.student_id
FROM Student_Courses sc
LEFT JOIN Students s ON sc.student_id = s.student_id
WHERE s.student_id IS NULL;

-- Check for Student_Courses rows with no matching Course
SELECT 'Orphaned course_id in Student_Courses' AS check_name,
       sc.course_id
FROM Student_Courses sc
LEFT JOIN Courses c ON sc.course_id = c.course_id
WHERE c.course_id IS NULL;

-- Check for Student_Activities rows with no matching Student
SELECT 'Orphaned student_id in Student_Activities' AS check_name,
       sa.student_id
FROM Student_Activities sa
LEFT JOIN Students s ON sa.student_id = s.student_id
WHERE s.student_id IS NULL;

-- Check for Student_Activities rows with no matching Activity
SELECT 'Orphaned activity_id in Student_Activities' AS check_name,
       sa.activity_id
FROM Student_Activities sa
LEFT JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
WHERE a.activity_id IS NULL;

-- Check for Courses rows with no matching Faculty
SELECT 'Orphaned faculty_id in Courses' AS check_name,
       c.course_id, c.faculty_id
FROM Courses c
LEFT JOIN Faculty f ON c.faculty_id = f.faculty_id
WHERE f.faculty_id IS NULL;

-- Check for Courses rows with no matching Classroom
SELECT 'Orphaned classroom_id in Courses' AS check_name,
       c.course_id, c.classroom_id
FROM Courses c
LEFT JOIN Classroom cl ON c.classroom_id = cl.classroom_id
WHERE cl.classroom_id IS NULL;

-- Check for Activities rows with no matching Faculty advisor
SELECT 'Orphaned advisor_faculty_id in Activities' AS check_name,
       a.activity_id, a.advisor_faculty_id
FROM Extra_Curricular_Activities a
LEFT JOIN Faculty f ON a.advisor_faculty_id = f.faculty_id
WHERE f.faculty_id IS NULL;

-- ==========================================
-- 7. Normalization verification (Task 2)
-- ==========================================
-- Written paragraph:
-- The schema is in at least 3NF. Each table stores only attributes that
-- depend on its own primary key: Students holds student details, Classroom
-- holds room details, Faculty holds faculty details, Courses holds course
-- details plus two FKs, and Activities holds activity details plus an
-- advisor FK. No table repeats descriptive data that belongs elsewhere
-- (e.g. a student's name is stored once in Students, not duplicated in
-- the junction tables). The two junction tables (Student_Courses,
-- Student_Activities) are pure linking tables: they contain only the two
-- parent PKs plus at most a small contextual attribute (enrollment_date/
-- grade, role/join_date). They correctly resolve the many-to-many
-- relationships without duplicating the Students, Courses, or Activities
-- data, avoiding the redundancy and update anomalies that a combined
-- table would introduce.
--
-- The queries below provide concrete evidence for these claims.

-- Prove Faculty data is stored once and referenced by ID everywhere else.
-- This query shows that each faculty member's name appears exactly once
-- in the Faculty table, while Courses and Activities reference them by ID.
SELECT
    f.name AS faculty_name,
    f.department,
    COUNT(DISTINCT c.course_id)   AS courses_taught,
    COUNT(DISTINCT a.activity_id) AS activities_advised
FROM Faculty f
LEFT JOIN Courses c ON f.faculty_id = c.faculty_id
LEFT JOIN Extra_Curricular_Activities a ON f.faculty_id = a.advisor_faculty_id
GROUP BY f.faculty_id, f.name, f.department
ORDER BY f.name;

-- Prove no duplicate student names exist (each student stored once)
SELECT 'Duplicate student names' AS check_name,
       name, COUNT(*) AS occurrences
FROM Students
GROUP BY name
HAVING COUNT(*) > 1;

-- Prove no duplicate course names exist (each course stored once)
SELECT 'Duplicate course names' AS check_name,
       course_name, COUNT(*) AS occurrences
FROM Courses
GROUP BY course_name
HAVING COUNT(*) > 1;

-- Prove junction tables store only FK references, not duplicated descriptive data
-- (no student name or course name columns in Student_Courses)
SELECT 'Student_Courses columns' AS info,
       COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alu_db'
  AND TABLE_NAME = 'Student_Courses'
ORDER BY ORDINAL_POSITION;

-- Show that Student_Activities similarly stores only FKs + minimal context
SELECT 'Student_Activities columns' AS info,
       COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alu_db'
  AND TABLE_NAME = 'Student_Activities'
ORDER BY ORDINAL_POSITION;