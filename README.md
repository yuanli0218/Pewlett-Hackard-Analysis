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
- Hope they can provide mentorship to those employees with mentorship eligibility