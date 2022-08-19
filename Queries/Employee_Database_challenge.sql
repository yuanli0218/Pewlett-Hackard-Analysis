SELECT emp_no, first_name, last_name
FROM employees;

SELECT titles, from_date, to_date
FROM titles;

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

SELECT * FROM retirement_titles;
