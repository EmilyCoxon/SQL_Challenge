Department
-
dept_no VARCHAR PK
dept_name VARCHAR

Title
-
title_id VARCHAR PK
Title VARCHAR


Employees
-
emp_no INTEGER PK 
emp_title_id VARCHAR FK - title.title_id
birth_date DATE
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date DATE


Dept_Manager
-
dept_no VARCHAR FK - Department.dept_no
emp_no INTEGER FK - Dept_Emp.emp_no



Salaries
-
emp_no INTEGER FK - Employees.emp_no
salary INTEGER


Dept_Emp
-
emp_no INTEGER FK - Employees.emp_no
dept_no VARCHAR FK - Department.dept_no
