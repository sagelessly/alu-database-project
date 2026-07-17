CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    classroom_id INT,
    enrollment_date DATE,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);
INSERT INTO Students (name, email, classroom_id, enrollment_date)
VALUES
('NDEGEYA Nina', 'u.ndegeya@alustudent.com', 1, '2026-01-15'),
('alex doi', 'alex@alustudent.com', 1, '2026-01-15'),
('Grace Mukamana', 'grace@alustudent.com', 2, '2026-01-15'),
('Eric Niyonzima', 'eric@alustudent.com', 2, '2026-01-15'),
('Alice Uwimana', 'alice@alustudent.com', 3, '2026-01-15');
UPDATE Students
SET email = 'nina@alu.edu'
WHERE student_id = 1;
DELETE FROM Students
WHERE student_id = 5;
SELECT *
FROM Students
WHERE classroom_id = 1;