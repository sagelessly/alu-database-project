-- ==========================================
-- Member B - Classroom Table
-- ==========================================

-- Use the shared database
USE alu_db;

-- ==========================================
-- Create Classroom Table
-- ==========================================

CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50),
    capacity INT
);

-- ==========================================
-- Insert Sample Data
-- ==========================================

INSERT INTO Classroom (room_number, building, capacity) VALUES
('A101', 'Main Hall', 40),
('A102', 'Main Hall', 35),
('B201', 'Science Block', 30),
('B202', 'Science Block', 25),
('C301', 'Library Wing', 20);

-- ==========================================
-- Update a Classroom Record
-- ==========================================

UPDATE Classroom
SET capacity = 45
WHERE classroom_id = 1;

-- ==========================================
-- Delete a Classroom Record
-- ==========================================

DELETE FROM Classroom
WHERE classroom_id = 5;

-- ==========================================
-- Select Classrooms by Building
-- ==========================================

SELECT *
FROM Classroom
WHERE building = 'Science Block';
