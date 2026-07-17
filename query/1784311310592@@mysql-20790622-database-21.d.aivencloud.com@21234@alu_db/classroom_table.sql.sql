USE alu_db;

CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

INSERT INTO Classroom (room_number, building, capacity)
VALUES
('A101', 'Master Building', 40),
('A102', 'Main Building', 35),
('B201', 'Science Block', 50),
('C301', 'Engineering Block', 45),
('D401', 'Business Block', 30);

SELECT * FROM Classroom;
UPDATE Classroom
SET building = 'Administration building'
WHERE capacity = 40;
DELETE FROM Classroom
WHERE capacity = 50;

