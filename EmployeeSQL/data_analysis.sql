-- 1.Employee details; employee number, first & last name, sex and salary
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
INNER JOIN salaries 
ON employees.emp_no= salaries.emp_no;

-- 2.List of emploees who were hired in 1986
SELECT first_name, last_name, hire_date FROM employees 
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';

-- 3.List of managers of each department including  
--department number, department name, the manager's employee number, last name, first name
SELECT departments.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
FROM dept_manager
INNER JOIN employees
ON dept_manager.emp_no= employees.emp_no
INNER JOIN departments
ON dept_manager.dept_no= departments.dept_no;

-- 4.List of department of each employee including 
--employee number, last name, first name, and department name
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no= departments.dept_no;

-- 5.List first name, lastname, sex for employees whose 
--first name is Hercules and last names begin with B 

SELECT first_name, last_name, sex FROM employees
WHERE first_name= 'Hercules'
AND last_name LIKE 'B%';

-- 6.List of all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no= departments.dept_no
WHERE dept_name = 'Sales';

-- 7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no= departments.dept_no
WHERE dept_name = 'Sales'
OR dept_name= 'Development';

--8. List the frequency count of employee last names in descending order 
--(i.e., how many employees share each last name)
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name)DESC;

