# Pewlett-Hackard-Analysis

## Overview of the analysis
The purpose of this analysis is to find the information of two groups: 1) title of those employees who are about to retire, 2) current employees with mentorship eligibility.

## Results
### Deliverable 1
- Based on the ERD, first JOIN employees and titles tables using the primary key [emp_no].
- Then filter out those employees born in 1952 to 1955
- Use DISTINCT ON () statement to solve the problem that one employee may have more than one title
- At last, use GROUP BY to get the number of retiring employees by title

### Deliverable 2
- This time need to JOIN three tables based on ERD
- Two WHERE statements are used to filter out current employees that are born in 1965

## Summary
- The company is about to have a shortage of Senior Engineer and Senior Staff (both around 25000 to be retired)
- To answer the second question, I compared two things
1. the number of retiring staff group by department and titles
2. the number of mentorship eligible staff group by department and titles
3. JOIN the above two to see if there's any situation where the first number is less than the second number for any department and title combination
4. The answer turns out to be no, which means there are enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees.