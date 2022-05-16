--Deliverable 1
-- retirement titles table 
SELECT emp.emp_no,
    emp.first_name, 
    emp.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as t
ON (emp.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_retirement_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC;

-- count by title  
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_retirement_titles
GROUP BY title 
ORDER BY COUNT(title) DESC;

--Deliverable 2
--Mentorship Eligibility
SELECT DISTINCT ON(emp.emp_no) emp.emp_no,
    emp.first_name, 
    emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees as emp
	INNER JOIN dept_emp as de
	ON (emp.emp_no = de.emp_no )
	INNER JOIN titles as t 
	ON (emp.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no;
