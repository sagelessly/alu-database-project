-- ===============================================
-- Member D - Courses Table
-- ===============================================

USE alu_db;

-- ===============================================
-- Create Courses Table
-- ===============================================

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    faculty_id INT,
    classroom_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- ===============================================
-- Insert Sample Data
-- ===============================================

INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
('Database Systems', 3, 1, 1),
('Web Development', 4, 2, 2),
('Data Structures', 3, 3, 3),
('Calculus I', 4, 4, 1),
('Introduction to Physics', 3, 5, 2);

-- ===============================================
-- UPDATE / DELETE / SELECT
-- ===============================================

UPDATE Courses
SET credits = 5
WHERE course_id = 2;

DELETE FROM Courses
WHERE course_id = 5;

SELECT *
FROM Courses
WHERE credits >= 4;
