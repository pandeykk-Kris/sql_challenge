--CREATE MULTIPLE TABLES
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_manager; 
DROP TABLE IF EXISTS dept_emp; 
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE titles (
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);
	
-- create departments table
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE, NOT NULL
	first_name VARCHAR(30), NOT NULL
	last_name VARCHAR(30), NOT NULL
	sex VARCHAR(1), NOT NULL
	hire_date DATE, NOT NULL
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

--creating following table later as they 
-- create department managers table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4), NOT NULL
    emp_no INT, NOT NULL
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- create department employees table
CREATE TABLE dep_emp (
    emp_no INT, NOT NULL
    dept_no VARCHAR(4), NOT NULL
    -- other columns
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- create salaries table
CREATE TABLE salaries (
	emp_no INT, NOT NULL
	salary INT, NOT NULL
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;