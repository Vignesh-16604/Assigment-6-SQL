TABBLE TRAINER:

CREATE TABLE Trainer (
    Trainer_ID INT PRIMARY KEY,
    Trainer_Name VARCHAR(100),
    Address VARCHAR(255),
    Qualification VARCHAR(100),
    Experience INT,
    Domain VARCHAR(100));
INSERT INTO Trainer (Trainer_ID, Trainer_Name, Address, Qualification, Experience, Domain) VALUES
(101, 'Dr. Aris Thorne', '123 Academic Way, NY', 'Ph.D. in Computer Science', 12, 'Data Science'),
(102, 'Sarah Jenkins', '456 Tech Park, CA', 'M.Tech IT', 8, 'Web Development'),
(103, 'Robert Miller', '789 Logic Lane, TX', 'MCA', 5, 'Cybersecurity');

TABLE BATCH:
CREATE TABLE Batch (
    Batch_Code VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100),
    Duration VARCHAR(50),
    Description TEXT,
    Trainer_ID INT,
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID));
INSERT INTO Batch (Batch_Code, Name, Duration, Description, Trainer_ID) VALUES
('DS-2024', 'Data Science Bootcamp', '6 Months', 'Intensive Python and ML course', 101),
('WD-2024', 'Full Stack Web Dev', '4 Months', 'HTML, CSS, JS, and React', 102),
('CS-2024', 'Network Security', '3 Months', 'Ethical hacking and firewalls', 103);

TABLE STUDENT:
CREATE TABLE Student (
    Student_RN INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Marks INT,
    DOB DATE,
    Batch_Code VARCHAR(20),
    FOREIGN KEY (Batch_Code) REFERENCES Batch(Batch_Code));
INSERT INTO Student (Student_RN, Name, Address, Marks, DOB, Batch_Code) VALUES
(1, 'Alice Vance', '10 Maple St', 85, '2002-05-14', 'DS-2024'),
(2, 'Bob Marshall', '22 Oak Ave', 78, '2001-09-20', 'WD-2024'),
(3, 'Charlie Day', '55 Pine Rd', 92, '2003-01-12', 'DS-2024'),
(4, 'Diana Prince', '12 Glass Blvd', 88, '2002-11-30', 'CS-2024');

TABLE FEES:
CREATE TABLE Fees (
    Fee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_RN INT,
    Fees_Paid DECIMAL(10, 2),
    Date_Paid DATE,
    FOREIGN KEY (Student_RN) REFERENCES Student(Student_RN));
INSERT INTO Fees (Student_RN, Fees_Paid, Date_Paid) VALUES
(1, 5000.00, '2024-01-10'),
(2, 4000.00, '2024-01-12'),
(3, 5000.00, '2024-01-15'),
(4, 3500.00, '2024-01-20');

--Q1--.
SELECT 
    s.Name AS Student_Name, 
    s.Address, 
    b.Batch_Code, 
    b.Name AS Batch_Name, 
    t.Trainer_Name AS Faculty_Name, 
    b.Duration
FROM Student s
JOIN Batch b ON s.Batch_Code = b.Batch_Code
JOIN Trainer t ON b.Trainer_ID = t.Trainer_ID;

--Q2--
SELECT 
    s.Name AS Student_Name, 
    f.Fees_Paid, 
    f.Date_Paid
FROM Student s
JOIN Fees f ON s.Student_RN = f.Student_RN;

--Q3--
SELECT 
    b.Batch_Code, 
    b.Name AS Batch_Name, 
    t.*
FROM Batch b
JOIN Trainer t ON b.Trainer_ID = t.Trainer_ID;
