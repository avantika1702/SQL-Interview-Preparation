/*
========================================================
Topic      : SQL Fundamentals
Day        : 1
Database   : SQL Server (SSMS)
Author     : Avantika Sharad Kaloge
========================================================
*/

----------- Question 1. Display all columns from the employee table ---------------

SELECT *
FROM emp;


----------- Question 2. Display specific columns ---------------

SELECT Name, Salary
FROM emp;


----------- Question 3. Display unique departments ---------------

SELECT DISTINCT Department
FROM emp;


----------- Question 4. Find employees whose salary is greater than 60000 ---------------

SELECT *
FROM emp
WHERE Salary > 60000;


----------- Question 5. Find employees whose names start with A ---------------

SELECT *
FROM emp
WHERE Name LIKE 'A%';


----------- Question 6. Find employees whose names end with a ---------------

SELECT *
FROM emp
WHERE Name LIKE '%a';


----------- Question 7. Find employees whose names contain 'mit' ---------------

SELECT *
FROM emp
WHERE Name LIKE '%mit%';


----------- Question 8. Find employees whose email is NULL ---------------

SELECT *
FROM emp
WHERE Email IS NULL;


----------- Question 9. Find employees whose email is not NULL ---------------

SELECT *
FROM emp
WHERE Email IS NOT NULL;


----------- Question 10. Find employees in the IT department with a salary greater than 60000 ---------------

SELECT *
FROM emp
WHERE Department = 'IT'
AND Salary > 60000;


----------- Question 11. Sort employees by salary from highest to lowest ---------------

SELECT *
FROM emp
ORDER BY Salary DESC;


----------- Question 12. Find the top 5 highest-paid employees ---------------

SELECT TOP 5 *
FROM emp
ORDER BY Salary DESC;


----------- Question 13. Skip the first 3 rows and return the next 2 rows ---------------

SELECT *
FROM emp
ORDER BY Salary DESC
OFFSET 3 ROWS
FETCH NEXT 2 ROWS ONLY;


----------- Question 14. Find the second-highest row based on salary ---------------

SELECT *
FROM emp
ORDER BY Salary DESC
OFFSET 1 ROWS
FETCH NEXT 1 ROW ONLY;

----------- Question 15. Find employees who are in the IT department and either earn more than 60000 or are younger than 25 -----------

SELECT *
FROM emp
WHERE Department = 'IT'
AND
(
    Salary > 60000
    OR Age < 25
);
