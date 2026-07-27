-- ==========================================
-- Member E - Extra-Curricular Activities + Junction Tables
-- ==========================================

-- Use the shared database
USE alu_db;

-- ==========================================
-- Create Extra_Curricular_Activities Table
-- (advisor_faculty_id references Faculty)
-- ==========================================

CREATE TABLE Extra_Curricular_Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    activity_name VARCHAR(100) NOT NULL,
    advisor_faculty_id INT,
    meeting_day VARCHAR(20),
    FOREIGN KEY (advisor_faculty_id) REFERENCES Faculty(faculty_id)
);

-- ==========================================
-- Create Student_Courses Junction Table
-- (many-to-many between Students and Courses)
-- ==========================================

CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- ==========================================
-- Create Student_Activities Junction Table
-- (many-to-many between Students and Activities)
-- ==========================================

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
-- Insert Sample Data - Activities
-- ==========================================

INSERT INTO Extra_Curricular_Activities (activity_name, advisor_faculty_id, meeting_day) VALUES
('Debate Club', 3, 'Monday'),
('Robotics Club', 2, 'Wednesday'),
('Choir', 1, 'Friday'),
('Basketball Team', 4, 'Tuesday');

-- ==========================================
-- Insert Sample Data - Student_Courses
-- (students 1-4 and courses 1,2,3,5 are valid after deletes)
-- ==========================================

INSERT INTO Student_Courses (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-09-01', 'A'),
(1, 5, '2023-09-01', 'B'),
(2, 2, '2023-09-01', 'A'),
(3, 3, '2023-09-01', 'B'),
(4, 1, '2023-09-01', 'C');

-- ==========================================
-- Insert Sample Data - Student_Activities
-- ==========================================

INSERT INTO Student_Activities (student_id, activity_id, role, join_date) VALUES
(1, 2, 'Member', '2023-09-10'),
(2, 1, 'President', '2023-09-10'),
(3, 4, 'Player', '2023-09-12'),
(4, 3, 'Singer', '2023-09-15'),
(1, 1, 'Member', '2023-09-10');

-- ==========================================
-- Update an Activity Record
-- ==========================================

UPDATE Extra_Curricular_Activities
SET meeting_day = 'Thursday'
WHERE activity_id = 2;

-- ==========================================
-- Delete a Junction Record (Student_Activities)
-- ==========================================

DELETE FROM Student_Activities
WHERE student_id = 4 AND activity_id = 3;

-- ==========================================
-- Select Activities by Advisor
-- ==========================================

SELECT *
FROM Extra_Curricular_Activities
WHERE advisor_faculty_id = 2;
