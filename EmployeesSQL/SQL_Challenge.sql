-- create a table schema for each 6 csv files with the data types, PK, FK, etc.
--  PKs verify column is unique otherwise create composite key

--create table for department
CREATE TABLE department (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

select * from salaries

-- create table for title
CREATE TABLE title (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);

	
	
-- MAKING FOREIGN KEYS	

	
-- table for employees
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES title (title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);
select * from employees;

-- table for dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department (dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


--table for salaries
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	salary INTEGER NOT NULL
);


--table for dept_emp
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department (dept_no)
);
	
-- --- 1. List emp_no, last_name, first_name, sex, salary for each employee

	
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s
on e.emp_no = s.emp_no;

-- 2. list first_name last_name, hire_date for employees hired in 1986
SELECT first_name, last_name, hire_date
from employees
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31';

-- 3. list manager of each department along with dept_no, dept_name, emp_no, last_name, first_name
SELECT m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager m
left join employees e
on m.emp_no = e.emp_no
left join department d 
on m.dept_no = d.dept_no;

-- 4. list dept_no for each employee with emp_no, last_name, first_name, dept_name
select i.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp i
left join employees e
on i.emp_no = e.emp_no
left join department d
on d.dept_no = i.dept_no;

-- 5. list first_name, last_name, sex for each employee with 
--     first name hercules and last name begins with B

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- 6. list each employee in the sales dept with emp_no, last_name, first_name
select d.emp_no, e.last_name, e.first_name
from employees e
left join dept_emp d
on d.emp_no = e.emp_no
where dept_no = 'd007';


