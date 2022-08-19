/* Deliverable 1 */
SELECT
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	tit.titles,
	tit.from_date,
	tit.to_date
INTO retirement_titles
FROM employees emp
JOIN titles tit ON emp.emp_no = tit.emp_no
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp.emp_no;

SELECT DISTINCT ON(emp_no) 
	emp_no, 
	first_name, 
	last_name, 
	titles 
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01';

SELECT * FROM unique_titles ORDER BY emp_no;

SELECT COUNT(emp_no), titles FROM unique_titles
GROUP BY titles
ORDER BY COUNT(emp_no) DESC

/* Deliverable 2 */
SELECT DISTINCT ON (emp_no)
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
	tit.titles
INTO mentorship_eligibility
FROM employees emp
LEFT JOIN dept_emp de ON emp.emp_no = de.emp_no
LEFT JOIN titles tit ON emp.emp_no = tit.emp_no
WHERE de.to_date = '9999-01-01' AND emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp.emp_no;

SELECT * FROM mentorship_eligibility;


/* Deliverable 3 bonus */
WITH 
retiring AS (
	SELECT de.dept_no, rt.titles, COUNT(rt.emp_no) AS retiring_count
	FROM retirement_titles rt
	JOIN dept_emp de ON rt.emp_no = de.emp_no
	WHERE rt.to_date = '9999-01-01'
	GROUP BY de.dept_no, rt.titles
		),
	
mentor AS (
	SELECT de.dept_no, me.titles, COUNT(me.emp_no) AS mentorship_count
	FROM mentorship_eligibility me
	JOIN dept_emp de ON me.emp_no = de.emp_no
	GROUP BY de.dept_no, me.titles
		)
	
SELECT *, retiring_count - mentorship_count AS retiring_more_than_mentorship
FROM retiring r 
LEFT JOIN mentor m ON r.dept_no = m.dept_no AND r.titles = m.titles
WHERE retiring_count - mentorship_count <= 0