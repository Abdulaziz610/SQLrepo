CREATE TABLE departments (
  DEPARTMENT_ID INT PRIMARY KEY,
  DEPARTMENT_NAME VARCHAR(255),
  MANAGER_ID INT,
  LOCATION_ID INT
);
create table Employee (
	EMPLOYEE_ID int PRIMARY KEY,
	FIRST_NAME varchar(50),
	LAST_NAME varchar(50),
	EMAIL varchar(50),
	PHONE_NUMBER varchar(20),
	HIRE_DATE Date ,
	JOB_ID varchar(20) ,
	SALARY float,
	commission_pct DECIMAL(10,2),
	MANAGER_ID int,
	DEPARTMENT_ID nvarchar(50)
	
);


INSERT INTO departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES
  (10, 'Administration', 200, 1700),
  (20, 'Marketing', 201, 1800),
  (30, 'Purchasing', 114, 1700),
  (40, 'Human Resources', 203, 2400),
  (50, 'Shipping', 121, 1500),
  (60, 'IT', 103, 1400),
  (70, 'Public Relations', 204, 2700),
  (80, 'Sales', 145, 2500),
  (90, 'Executive', 100, 1700),
  (100, 'Finance', 108, 1700);

  
INSERT INTO Employee (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES
(100, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 17000.00, 0.00, 100, 90),
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', 17000.00, 0.00, 100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000.00, 0.00, 102, 60),
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000.00, 0.00, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', 4800.00, 0.00, 103, 60),
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', 4800.00, 0.00, 103, 60),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', 4200.00, 0.00, 103, 60),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', 12008.00, 0.00, 101, 100),
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', 9000.00, 0.00, 108, 100),
(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', 8200.00, 0.00, 108, 100);

CREATE VIEW department_10_employees AS
SELECT *
FROM Employee
WHERE DEPARTMENT_ID = 10;


CREATE VIEW department_10_employee
AS SELECT *
FROM Employee
WHERE DEPARTMENT_ID = 10
WITH CHECK OPTION;

CREATE VIEW dept_emp_view
AS SELECT *
FROM departments
INNER JOIN Employee
ON departments.DEPARTMENT_ID = Employee.DEPARTMENT_ID;

CREATE VIEW dbo.dept_emp_right_view

AS SELECT departments.MANAGER_ID 
FROM Employee
RIGHT JOIN departments
ON Employee.DEPARTMENT_ID = departments.DEPARTMENT_ID;

select * from Employee
