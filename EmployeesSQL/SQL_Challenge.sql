-- create a table schema for each 6 csv files with the data types, PK, FK, etc.
--  PKs verify column is unique otherwise create composite key

--create table for department
CREATE TABLE department (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

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
	
	
	
	