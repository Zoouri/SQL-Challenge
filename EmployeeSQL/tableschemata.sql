-- Creating a Departments Table
CREATE TABLE departments(
		dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
		dept_name VARCHAR(255) NOT NULL
);

-- Creating Titles Table
CREATE TABLE titles(
		title_id VARCHAR(255) PRIMARY KEY NOT NULL,
		title VARCHAR(255) NOT NULL
);

-- Creating Department Employees Table
CREATE TABLE department_employees(
		emp_no INT NOT NULL,
		dept_no VARCHAR(255) NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Creating Employees Table
CREATE TABLE employees(
		emp_no INT PRIMARY KEY NOT NULL,
		emp_title_id VARCHAR(255) NOT NULL,
		birth_date DATE NOT NULL,
		first_name VARCHAR(255) NOT NULL,
		last_name VARCHAR(255) NOT NULL,
		sex VARCHAR(255) NOT NULL,
		hire_date DATE NOT NULL, 
		FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Creating Department Managers Table
CREATE TABLE department_managers(
		dept_no VARCHAR(255) NOT NULL,
		emp_no INT PRIMARY KEY,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Creating Salaries Table
CREATE TABLE salaries(
		emp_no INT PRIMARY KEY NOT NULL,
		salary INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
