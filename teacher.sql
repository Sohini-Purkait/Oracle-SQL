-- Create the Teacher table
CREATE TABLE Teacher (
    TeacherID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Subject VARCHAR2(50),
    Email VARCHAR2(100),
    HireDate DATE,
    Salary NUMBER(10, 2)
);

-- Insert sample data
INSERT INTO Teacher (TeacherID, FirstName, LastName, Subject, Email, HireDate, Salary) VALUES
(1, 'Anita', 'Sharma', 'Mathematics', 'anita.sharma@example.com', TO_DATE('2015-06-10', 'YYYY-MM-DD'), 55000);

INSERT INTO Teacher (TeacherID, FirstName, LastName, Subject, Email, HireDate, Salary) VALUES
(2, 'Raj', 'Verma', 'Physics', 'raj.verma@example.com', TO_DATE('2017-08-21', 'YYYY-MM-DD'), 60000);

INSERT INTO Teacher (TeacherID, FirstName, LastName, Subject, Email, HireDate, Salary) VALUES
(3, 'Sonal', 'Mehta', 'Chemistry', 'sonal.mehta@example.com', TO_DATE('2016-03-15', 'YYYY-MM-DD'), 58000);

INSERT INTO Teacher (TeacherID, FirstName, LastName, Subject, Email, HireDate, Salary) VALUES
(4, 'Amit', 'Kumar', 'English', 'amit.kumar@example.com', TO_DATE('2019-11-01', 'YYYY-MM-DD'), 53000);

INSERT INTO Teacher (TeacherID, FirstName, LastName, Subject, Email, HireDate, Salary) VALUES
(5, 'Preeti', 'Gupta', 'Biology', 'preeti.gupta@example.com', TO_DATE('2020-01-09', 'YYYY-MM-DD'), 50000);

-- Commit changes
COMMIT;

-- Select all teachers
SELECT * FROM Teacher;

-- Select teachers hired after 1st Jan 2016
SELECT FirstName, LastName, HireDate
FROM Teacher
WHERE HireDate > TO_DATE('2016-01-01', 'YYYY-MM-DD');

-- Find highest paid teacher
SELECT *
FROM (
    SELECT FirstName, LastName, Salary
    FROM Teacher
    ORDER BY Salary DESC
)
WHERE ROWNUM = 1;

-- Update salary of a teacher
UPDATE Teacher
SET Salary = Salary + 2000
WHERE TeacherID = 3;

-- Delete a teacher by ID
DELETE FROM Teacher
WHERE TeacherID = 5;

-- Commit after DML operations
COMMIT;