-- ==========================================
-- Member D - Courses Table
-- ==========================================

-- Use the shared database
USE alu_db;

-- ==========================================
-- Create Courses Table
-- (depends on Faculty and Classroom tables)
-- ==========================================

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT,
    classroom_id INT,
    credits INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- ==========================================
-- Insert Sample Data
-- ==========================================

INSERT INTO Courses (course_name, faculty_id, classroom_id, credits) VALUES
('Intro to Programming', 2, 1, 3),
('Calculus I', 1, 2, 4),
('English Literature', 3, 3, 3),
('Quantum Physics', 4, 4, 4),
('Data Structures', 2, 1, 3);

-- ==========================================
-- Update a Course Record
-- ==========================================

UPDATE Courses
SET credits = 4
WHERE course_id = 5;

-- ==========================================
-- Delete a Course Record
-- ==========================================

DELETE FROM Courses
WHERE course_id = 4;

-- ==========================================
-- Select Courses by Faculty
-- ==========================================

SELECT *
FROM Courses
WHERE faculty_id = 2;
