Department
-
dept_ID INTEGER PK
dept_no VARCHAR 
dept_name VARCHAR

Title
-
Title_ID INTEGER PK
title_code VARCHAR 
Title VARCHAR


Employees
-
emp_no INTEGER PK 
emp_title_id VARCHAR FK - title.title_code


Dept_Manager
-
Manager_ID INTERGER PK
dept_no VARCHAR FK - Department.dept_no
emp_no INTEGER FK - Dept_Emp.emp_no



Salaries
-
ID INTEGER PK
emp_no INTEGER FK - Employees.emp_no
salary INTEGER


Dept_Emp
-
dept_emp_ID INTEGER PK
emp_no INTEGER FK - Employees.emp_no
dept_no VARCHAR FK >-< Department.dept_no