CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);


CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);


CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);



CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

Select * From departments;
Select * From dept_emp;
Select * From dept_manager;
Select * From employees;
Select * From salaries;
Select * From titles;


-- List the employee number, last name, first name, sex, and salary of each employee
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
Select first_name, last_name, hire_date FROM employees WHERE hire_date LIKE '%1986';


--List the manager of each department along with their department number,
--department name, employee number, last name, and first name 
Select d.dept_no, d.emp_no, dept.dept_name, e.last_name, e.first_name
FROM dept_manager AS d
JOIN departments AS dept ON d.dept_no = dept.dept_no
JOIN employees AS e ON d.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name
Select d.dept_no, d.emp_no, e.last_name, e.first_name, dept.dept_name
FROM dept_emp AS d
JOIN employees AS e ON d.emp_no = e.emp_no
JOIN departments AS dept ON d.dept_no = dept.dept_no;

--List first name, last name, and sex of each employee whose first name is
--Hercules and whose last name begins with the letter B
Select first_name, last_name, sex from employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name
Select e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM employees AS E
JOIN dept_emp AS dept ON e.emp_no = dept.emp_no
JOIN departments as d ON d.dept_no  = dept.dept_no
WHERE d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their
--employee number, last name, first name, and department name 
Select e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM employees AS E
JOIN dept_emp AS dept ON e.emp_no = dept.emp_no
JOIN departments as d ON d.dept_no  = dept.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


--List the frequency counts, in descending order, of all the employee
--last names (that is, how many employees share each last name)
Select COUNT(last_name) AS "Frequency", last_name
FROM employees 
GROUP BY last_name
ORDER BY "Frequency" DESC;
