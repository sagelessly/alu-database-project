-- ==========================================
-- Member C - Faculty Table
-- ==========================================

-- Use the shared database
USE alu_db;

-- ==========================================
-- Create Faculty Table
-- ==========================================

CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    department VARCHAR(50)
);

-- ==========================================
-- Insert Sample Data
-- ==========================================

INSERT INTO Faculty (name, email, department) VALUES
('Alice Uwimana', 'alice.uwimana@alu.edu', 'Mathematics'),
('Brian Mugisha', 'brian.mugisha@alu.edu', 'Computer Science'),
('Claire Ingabire', 'claire.ingabire@alu.edu', 'English'),
('David Niyonzima', 'david.niyonzima@alu.edu', 'Physics'),
('Eric Habimana', 'eric.habimana@alu.edu', 'Computer Science');

-- ==========================================
-- Update a Faculty Record
-- ==========================================

UPDATE Faculty
SET department = 'Data Science'
WHERE faculty_id = 2;

-- ==========================================
-- Delete a Faculty Record
-- ==========================================

DELETE FROM Faculty
WHERE faculty_id = 5;

-- ==========================================
-- Select Faculty by Department
-- ==========================================

SELECT *
FROM Faculty
WHERE department = 'Computer Science';
