CREATE TABLE Extra_Curricular_Activities (
    activity_id INT AUTO_INCREMENT,
    activity_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    faculty_advisor_id INT,
    PRIMARY KEY (activity_id),
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id) VALUES
('Football Club', 'Sports', 1),
('Debate Society', 'Academic', 2),
('Coding Club', 'Technology', 1);

CREATE TABLE Student_Activities (
    student_id INT,
    activity_id INT,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

INSERT INTO Student_Activities (student_id, activity_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);
INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id) VALUES
('Drama Club', 'Arts', 2),
('Chess Team', 'Academic', 1);

CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Student_Courses (student_id, course_id) VALUES
(1, 6),
(2, 6),
(3, 7),
(4, 7);

UPDATE Extra_Curricular_Activities 
SET category = 'STEM' 
WHERE activity_name = 'Coding Club';

DELETE FROM Extra_Curricular_Activities 
WHERE activity_name = 'Chess Team';

SELECT * FROM Extra_Curricular_Activities 
WHERE category = 'Academic';
