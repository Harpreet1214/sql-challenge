-- Drop Tables if Existing
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- 1. Create a Departments table
CREATE TABLE departments(
	"dept_no" varchar NOT NULL,
	"dept_name" varchar NOT NULL,
	PRIMARY KEY(dept_no)
	);

-- 2. Create an Employees table
CREATE TABLE employees (
	"emp_no" int NOT NULL,
	"birth_date" date NOT NULL,
	"first_name" varchar NOT NULL,
	"last_name" varchar NOT NULL,
	"gender" varchar NOT NULL,
	"hire_date" date NOT NULL,
	PRIMARY KEY(emp_no)
	);

-- 3. Create a salaries table
CREATE TABLE salaries (
	"emp_no" int NOT NULL,
	"salary" int NOT NULL,
	"from_date" date NOT NULL,
	"to_date" date NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
	);

-- 4. Create a titles table
CREATE TABLE titles (
	"emp_no" int NOT NULL,
	"title" varchar NOT NULL,
	"to_date" date NOT NULL,
	"from_date" date NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
	);
	
-- 5. Create a dept_emp table
CREATE TABLE dept_emp (
	"emp_no" int NOT NULL,
	"dept_no" varchar NOT NULL,
	"from_date" date NOT NULL,
	"to_date" date NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
	);

-- 6. Create a dept_manager table
CREATE TABLE dept_manager (
	"dept_no" varchar NOT NULL,
	"emp_no" int NOT NULL,
	"from_date" date NOT NULL,
	"to_date" date NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
	);
	