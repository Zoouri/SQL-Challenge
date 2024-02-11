-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT department_managers.dept_no, departments.dept_name, department_managers.emp_no, employees.first_name, employees.last_name
FROM department_managers
JOIN departments ON department_managers.dept_no = departments.dept_no
JOIN employees ON department_managers.emp_no = employees.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no;

--5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT * FROM departments
WHERE dept_name = 'Sales';
-- The department number we are lookign for is d007
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON department_employees.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = department_employees.dept_no
WHERE departments.dept_no = 'd007';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM departments
WHERE dept_name = 'Sales' OR dept_name = 'Development';
-- The department number we are lookign for is d007 and d005
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON department_employees.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = department_employees.dept_no
WHERE departments.dept_no = 'd007' or departments.dept_no = 'd005';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;