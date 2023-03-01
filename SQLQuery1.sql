CREATE TABLE Department(
dep_id INTEGER PRIMARY KEY,
dep_name VARCHAR(20),
dep_location VARCHAR(15),
);

CREATE TABLE salary_grade(
grade INTEGER,
min_salary INTEGER,
max_salary INTEGER,
);

CREATE TABLE Employees(

emp_id INTEGER,
emp_name VARCHAR(20),
job_name VARCHAR(15),
manager_id INTEGER,
hire_date DATE,
salary DECIMAL(10, 2),
commission DECIMAL(7,2),
dep_id INTEGER,
FOREIGN KEY (dep_id) REFERENCES Department(dep_id)
);


INSERT INTO Department(dep_id, dep_name, dep_location)
VALUES
(1001, 'FINANCE', 'SYDNEY'),
(2001, 'AUDIT', 'MELBORUNE'),
(3001, 'MARKETING', 'PERTH'),
(4001, 'PRODUCTION', 'BRISBANE');





INSERT INTO salary_grade(grade, min_salary, max_salary)
VALUES
(1,800,1300),
(2,1301,1500),
(3, 1501,2100),
(4,2101,3100),
(5,3101,9999);


INSERT INTO Employees(emp_id,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)
VALUES 
(68319, 'KAYLING', 'PRESIDENT', NULL, '1991-11-18', 6000.00, NULL, 1001),
(66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00, NULL, 3001),
(67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550.00, NULL, 1001),
(65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957.00, NULL, 2001),
(67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100.00, NULL, 2001),
(69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100.00, NULL, 2001),
(63679, 'SANDRINE', 'CLERK', 69062, '1990-12-18', 900.00, NULL, 2001),
(64989, 'ADELYN', 'SALESMAN', 66928, '1991-02-20', 1700.00, 400.00, 3001),
(65271, 'WADE', 'SALESMAN', 66928, '1991-02-22', 1350.00, 600.00, 3001),
(66564, 'MADDEN', 'SALESMAN', 66928, '1991-09-28', 1350.00, 1500.00, 3001),
(68454, 'TUCKER', 'SALESMAN', 66928, '1991-09-08', 1600.00, 0.00, 3001),
(68736, 'ADNRES', 'CLERK', 67858, '1997-05-23', 1200.00, NULL, 2001),
(69000, 'JULIUS', 'CLERK', 66928, '1991-12-03', 1050.00, NULL, 3001),
(69324, 'MARKER', 'CLERK', 67832, '1992-01-23', 1400.00, NULL, 1001);
  

-- Question 1
Select * From Employees
-- Question 2
Select salary From Employees
-- Question 3
Select DISTINCT job_name From Employees;
-- Question 4
SELECT emp_name, salary * 1.15 AS increased_salary FROM employees;
-- Question 5
SELECT CONCAT(emp_name, ' & ', job_name) AS "Employee & Job" FROM employees;
-- Question 6
SELECT emp_id, emp_name AS employee_name, salary, hire_date
FROM employees
WHERE FORMAT(hire_date, 'MMMM dd, yyyy') = 'February 22, 1991';
-- Question 7
SELECT COUNT(*)
FROM employees
WHERE salary + COALESCE(commission, 0) * salary  > 2200;
-- Question 8
SELECT DISTINCT job_name
dep_id FROM employees;
-- Question 9
SELECT * 
FROM employees 
WHERE dep_id != 2001;
-- Question 10
SELECT emp_id, emp_name, dep_id, hire_date, salary
FROM employees
WHERE hire_date < '1991-01-01';
-- Question 11
SELECT AVG(salary) as Average_Salary
FROM employees
WHERE job_name = 'ANALYST';
-- Question 12
SELECT * 
FROM employees 
WHERE emp_name LIKE 'B%' OR emp_name LIKE '%E';
-- Question 13
SELECT employees.*
FROM employees
INNER JOIN Department ON employees.dep_id = Department.dep_id
WHERE Department.Dep_name LIKE 'B%' OR Department.dep_name LIKE '%E';
-- Question 14
SELECT *
FROM Employees e
JOIN Department d ON e.dep_id = d.dep_id
WHERE d.dep_location LIKE ' F% ' OR d.dep_location LIKE ' %N ';
-- Question 15
SELECT employees.*, department.dep_location, department.dep_name
FROM employees
JOIN department
ON employees.dep_id = department.dep_id
WHERE employees.commission > employees.salary;
-- Question 16
SELECT *
FROM Employees
WHERE salary * 1.25 > 3000;
-- Question 17
SELECT *
FROM employees
WHERE MONTH(hire_date) = 1;
-- Question 18/**/
SELECT CONCAT( em.emp_name,'  WORKS FOR  ',mn.emp_name) AS "EMP & MAN" FROM employees em, employees mn
WHERE em.manager_id = mn.emp_id
-- Question 19
SELECT * 
FROM employees 
WHERE job_name = 'CLERK';
-- Question 20
SELECT *
FROM employees
WHERE DATEDIFF(YEAR, hire_date, GETDATE()) > 27;
-- Question 21
SELECT * 
FROM employees 
WHERE salary < 3500;
-- Question 22
SELECT emp_name, job_name, salary
FROM employees
WHERE job_name = 'ANALYST';
-- Question 23
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1991;
-- Question 24
SELECT *
FROM employees
WHERE hire_date > '1991-12-31';
-- Question 25
SELECT emp_id, emp_name, hire_date, salary
FROM employees
WHERE hire_date < '1991-04-01';
-- Question 26
SELECT emp_name AS Employee_Name, job_name AS Job_Name
FROM employees
WHERE manager_id IS NULL;
-- Question 27
SELECT *
FROM employees
WHERE hire_date = '1991-05-01';
-- Question 28
SELECT e1.emp_id, e1.emp_name, e1.salary, DATEDIFF(YEAR, e1.hire_date, GETDATE()) as experience
FROM Employees e1
JOIN Employees e2 ON e1.manager_id = e2.emp_id
WHERE e2.emp_id = 68319
-- Question 29
SELECT emp_id, salary
FROM employees
WHERE salary/30 > 100;
-- Question 30
SELECT *
FROM employees
WHERE date_of_retirement > '1999-12-31' AND years_of_service >= 8;
-- Question 31
SELECT *
FROM employees
WHERE salary % 2 <> 0;
-- Question 32
SELECT *
FROM employees
WHERE salary BETWEEN 100 AND 999
-- Question 33
SELECT * 
FROM employees 
WHERE MONTH(hire_date) = 4;
-- Question 34
SELECT *
FROM employees
WHERE DAY(hire_date) < 19;
-- Question 35

-- Question 36
SELECT * 
FROM employees 
WHERE dep_id IN (3001, 1001) AND 
      YEAR(hire_date) = 1991;
-- Question 37
SELECT * 
FROM employees 
WHERE dep_id IN (1001, 2001);
-- Question 38

-- Question 39
-- Question 40
