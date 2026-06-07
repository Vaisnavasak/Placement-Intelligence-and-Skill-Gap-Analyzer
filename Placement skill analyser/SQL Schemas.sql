-- DATABASE CREATION
CREATE DATABASE pisga;
USE pisga;

-- TABLE 1: Student
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT 
                PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    cgpa DECIMAL(3,2) NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- TABLE 2: Job
CREATE TABLE Job (
    job_id INT AUTO_INCREMENT 
            PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    description TEXT
);

-- TABLE 3: Skill
CREATE TABLE Skill (
    skill_id INT AUTO_INCREMENT 
              PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL,
    job_id INT,
    FOREIGN KEY (job_id) 
    REFERENCES Job(job_id)
);

-- TABLE 4: Student Skill
CREATE TABLE Student_Skill (
    id INT AUTO_INCREMENT 
        PRIMARY KEY,
    student_id INT,
    job_id INT,
    skill_name VARCHAR(100) NOT NULL,
    proficiency VARCHAR(50),
    domain_internship BOOLEAN 
                      DEFAULT FALSE,
    FOREIGN KEY (student_id) 
    REFERENCES Student(student_id),
    FOREIGN KEY (job_id) 
    REFERENCES Job(job_id)
);

-- TABLE 5: Placement Prediction
CREATE TABLE Placement_Prediction (
    prediction_id INT AUTO_INCREMENT 
                   PRIMARY KEY,
    student_id INT,
    job_id INT,
    match_percentage DECIMAL(5,2),
    placement_probability DECIMAL(5,2),
    prediction_date DATE,
    FOREIGN KEY (student_id) 
    REFERENCES Student(student_id),
    FOREIGN KEY (job_id) 
    REFERENCES Job(job_id)
);
