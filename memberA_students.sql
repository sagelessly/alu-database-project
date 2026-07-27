-- ==========================================
-- Member A - Students Table
-- ==========================================

-- Use the shared database
USE alu_db;

-- ==========================================
-- Create Students Table
-- ==========================================

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    email VARCHAR(100) NOT NULL UNIQUE,
    enrollment_date DATE,
    major VARCHAR(50)
);

-- ==========================================
-- Insert Sample Data
-- ==========================================

INSERT INTO Students (name, dob, email, enrollment_date, major) VALUES
('Jean Pierre', '2003-05-12', 'jean.pierre@alu.edu', '2021-09-01', 'Computer Science'),
('Marie Uwase', '2002-11-23', 'marie.uwase@alu.edu', '2021-09-01', 'Mathematics'),
('Patrick Nshimiyimana', '2004-02-15', 'patrick.nshimi@alu.edu', '2022-09-01', 'Physics'),
('Aline Murekatete', '2003-07-30', 'aline.murekatete@alu.edu', '2022-09-01', 'English'),
('Yusuf Mukiibi', '2001-12-05', 'yusuf.mukiibi@alu.edu', '2020-09-01', 'Data Science');

-- ==========================================
-- Update a Student Record
-- ==========================================

UPDATE Students
SET major = 'Software Engineering'
WHERE student_id = 1;

-- ==========================================
-- Delete a Student Record
-- ==========================================

DELETE FROM Students
WHERE student_id = 5;

-- ==========================================
-- Select Students by Major
-- ==========================================

SELECT *
FROM Students
WHERE major = 'Computer Science';
