-- hamza al-tal

-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    major VARCHAR(100),
    enrollment_year YEAR
);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    course_code VARCHAR(10) UNIQUE,
    credits INT,
    department VARCHAR(100)
);

-- Create Instructors Table
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(100)
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create Course Assignments Table
CREATE TABLE Course_Assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    instructor_id INT,
    course_id INT,
    semester ENUM('Spring', 'Summer', 'Fall', 'Winter'),
    year YEAR,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Data

-- Insert Students
INSERT INTO Students (first_name, last_name, email, date_of_birth, gender, major, enrollment_year) VALUES
('John', 'Doe', 'john.doe@example.com', '2000-01-01', 'Male', 'Computer Science', 2020),
('Jane', 'Smith', 'jane.smith@example.com', '1999-04-15', 'Female', 'Mathematics', 2019),
('Michael', 'Johnson', 'michael.johnson@example.com', '2001-07-20', 'Male', 'Physics', 2021),
('Emily', 'Davis', 'emily.davis@example.com', '2000-12-05', 'Female', 'Electrical Engineering', 2020),
('Chris', 'Brown', 'chris.brown@example.com', '2000-02-25', 'Male', 'Mechanical Engineering', 2020),
('Amanda', 'Wilson', 'amanda.wilson@example.com', '2001-11-10', 'Female', 'Computer Engineering', 2021),
('Brian', 'Moore', 'brian.moore@example.com', '1999-03-30', 'Male', 'Chemistry', 2019),
('Jessica', 'Taylor', 'jessica.taylor@example.com', '2002-05-18', 'Female', 'Biology', 2022),
('Joshua', 'Anderson', 'joshua.anderson@example.com', '2000-09-15', 'Male', 'Civil Engineering', 2020),
('Laura', 'Thomas', 'laura.thomas@example.com', '1998-08-12', 'Female', 'Business Administration', 2018);

-- Insert Instructors
INSERT INTO Instructors (first_name, last_name, email, hire_date, department) VALUES
('Adam', 'Lee', 'adam.lee@example.com', '2015-06-20', 'Computer Science'),
('Lisa', 'Kim', 'lisa.kim@example.com', '2010-03-15', 'Mathematics'),
('Sarah', 'Williams', 'sarah.williams@example.com', '2012-11-10', 'Physics'),
('Mark', 'Taylor', 'mark.taylor@example.com', '2008-09-01', 'Electrical Engineering'),
('John', 'White', 'john.white@example.com', '2007-01-22', 'Mechanical Engineering');

-- Insert Courses
INSERT INTO Courses (course_name, course_code, credits, department) VALUES
('Introduction to Programming', 'CS101', 3, 'Computer Science'),
('Data Structures', 'CS102', 3, 'Computer Science'),
('Calculus I', 'MATH101', 4, 'Mathematics'),
('Physics I', 'PHY101', 4, 'Physics'),
('Circuit Analysis', 'EE101', 3, 'Electrical Engineering');

-- Insert Course Assignments (Assign courses to instructors)
INSERT INTO Course_Assignments (instructor_id, course_id, semester, year) VALUES
(1, 1, 'Fall', 2024), 
(1, 2, 'Fall', 2024), 
(2, 3, 'Fall', 2024), 
(3, 4, 'Fall', 2024), 
(4, 5, 'Fall', 2024); 

-- Insert Enrollments (Each student enrolled in at least 2 courses)
INSERT INTO Enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'), (1, 2, 'B'), 
(2, 3, 'A'), (2, 4, 'B'), 
(3, 1, 'C'), (3, 5, 'B'),  
(4, 2, 'B'), (4, 4, 'A'), 
(5, 3, 'B'), (5, 5, 'A'),
(6, 1, 'A'), (6, 2, 'B'),  
(7, 3, 'C'), (7, 4, 'B'),  
(8, 2, 'A'), (8, 5, 'A'),  
(9, 1, 'B'), (9, 3, 'B'), 
(10, 4, 'A'), (10, 5, 'C');
