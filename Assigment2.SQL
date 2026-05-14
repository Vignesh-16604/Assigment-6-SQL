CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    exp INT CHECK (exp >= 2),
    salary INT CHECK (salary BETWEEN 12000 AND 30000),
    department_name VARCHAR(20) CHECK (department_name IN ('HR','Sales','Accts','IT')),
    manager_name VARCHAR(50)
);

INSERT INTO Employee (name, exp, salary, department_name, manager_name) VALUES
('Amit', 3, 15000, 'HR', 'Ramesh'),
('Vignesh', 5, 22000, 'IT', 'Suresh'),
('Arun', 4, 18000, 'Sales', 'Karthik'),
('Divya', 6, 25000, 'Accts', 'Meena'),
('Anita', 2, 12000, 'HR', 'Ramesh'),
('Rahul', 7, 30000, 'IT', 'Suresh'),
('Sneha', 3, 17000, 'Sales', 'Karthik'),
('Kiran', 8, 26000, 'Accts', 'Meena'),
('Ajay', 2, 14000, 'HR', 'Ramesh'),
('Satish', 5, 21000, 'IT', 'Suresh');

-Q1-
SELECT employee_id, name, salary FROM Employee;

-Q2-
SELECT 
    employee_id AS "Employee ID",
    name AS "Name of Employee",
    salary AS "Salary of Employee"
FROM Employee;

-Q3-
SELECT 
    name,
    salary,
    salary + 1000 AS incremented_salary
FROM Employee;

-Q4-
SELECT SUM(salary) AS total_salary FROM Employee;

-Q5-
SELECT 
    SUM(salary) AS total_salary,
    MAX(salary) AS max_salary,
    AVG(salary) AS avg_salary
FROM Employee;
-Q6-
SELECT * FROM Employee ORDER BY salary ASC;
-Q7-
SELECT 
    employee_id,
    name,
    ROW_NUMBER() OVER (ORDER BY employee_id) AS sequence_no
FROM Employee;

-Q8-
SELECT 
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rank_no
FROM Employee;

-Q9-
ALTER TABLE Employee ADD age INT;

-Q10-
ALTER TABLE Employee 
MODIFY age INT DEFAULT 26;

-Q11-
Set 26 for all records
UPDATE Employee SET age = 26;
Add constraint (26–60)
ALTER TABLE Employee 
ADD CHECK (age BETWEEN 26 AND 60);

-Q12-
SELECT COUNT(DISTINCT department_name) FROM Employee;

-Q13-
SELECT UPPER(name) FROM Employee;
-Q14-
SELECT SUBSTRING(name, 1, 4) FROM Employee;

-Q15- 
SELECT name, INSTR(name, 'a') FROM Employee;

-Q16- 
SELECT department_name, COUNT(*) 
FROM Employee 
GROUP BY department_name;

-Q17-
SELECT manager_name, COUNT(*) 
FROM Employee 
GROUP BY manager_name;

-Q18-
SELECT * FROM Employee 
WHERE employee_id IN (101,102,110);

-Q19-
SELECT * FROM Employee 
WHERE employee_id BETWEEN 101 AND 110;

-Q20-
SELECT * FROM Employee 
WHERE department_name = 'HR';

-Q21-
SELECT * FROM Employee 
WHERE department_name IN ('HR','Accts');

-Q22-
SELECT * FROM Employee 
WHERE name LIKE 'A%';

-Q23-
SELECT * FROM Employee 
WHERE name LIKE '%a%';

-Q24-
SELECT department_name, AVG(salary) 
FROM Employee 
GROUP BY department_name
HAVING AVG(salary) < 12000;

-Q25-
SELECT * FROM Employee 
WHERE department_name <> 'Accts'
AND salary NOT BETWEEN 10000 AND 20000;
