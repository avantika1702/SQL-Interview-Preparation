/*
========================================================
Topic      : Aggregate Functions
Day        : 2
Database   : SQL Server (SSMS)
Author     : Avantika Sharad Kaloge
========================================================
*/

----------- Question 1. Count the total number of employees ---------------

SELECT COUNT(*)
FROM emp;


----------- Question 2. Count employees with a non-NULL salary ---------------

SELECT COUNT(Salary)
FROM emp;


----------- Question 3. Find the total salary of all employees ---------------

SELECT SUM(Salary)
FROM emp;


----------- Question 4. Find the average salary of all employees ---------------

SELECT AVG(Salary)
FROM emp;


----------- Question 5. Find the highest salary ---------------

SELECT MAX(Salary)
FROM emp;


----------- Question 6. Find the lowest salary ---------------

SELECT MIN(Salary)
FROM emp;


----------- Question 7. Find the total salary for each department ---------------

SELECT Department,
       SUM(Salary) AS Total_Salary
FROM emp
GROUP BY Department;


----------- Question 8. Count the number of employees in each department ---------------

SELECT Department,
       COUNT(*) AS Employee_Count
FROM emp
GROUP BY Department;


----------- Question 9. Find the average salary for each department ---------------

SELECT Department,
       AVG(Salary) AS Average_Salary
FROM emp
GROUP BY Department;


----------- Question 10. Find the highest salary in each department ---------------

SELECT Department,
       MAX(Salary) AS Maximum_Salary
FROM emp
GROUP BY Department;


----------- Question 11. Find the lowest salary in each department ---------------

SELECT Department,
       MIN(Salary) AS Minimum_Salary
FROM emp
GROUP BY Department;


----------- Question 12. Show departments having more than 2 employees ---------------

SELECT Department,
       COUNT(*) AS Employee_Count
FROM emp
GROUP BY Department
HAVING COUNT(*) > 2;


----------- Question 13. Find the total salary of employees earning more than 50000 in each department ---------------

SELECT Department,
       SUM(Salary) AS Total_Salary
FROM emp
WHERE Salary > 50000
GROUP BY Department;


----------- Question 14. Show departments where the average salary is greater than 60000 ---------------

SELECT Department,
       AVG(Salary) AS Average_Salary
FROM emp
GROUP BY Department
HAVING AVG(Salary) > 60000;


----------- Question 15. Categorize employees based on salary ---------------

SELECT Name,
       Salary,
       CASE
           WHEN Salary >= 70000 THEN 'High'
           WHEN Salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS Salary_Category
FROM emp;


----------- Question 16. Categorize departments using CASE ---------------

SELECT Name,
       Department,
       CASE Department
           WHEN 'IT' THEN 'Technical'
           WHEN 'HR' THEN 'Non-Technical'
           WHEN 'Sales' THEN 'Business'
           ELSE 'Other'
       END AS Department_Type
FROM emp;


----------- Question 17. Replace NULL bonus values with 0 using COALESCE ---------------

SELECT Name,
       COALESCE(Bonus, 0) AS Bonus
FROM emp;


----------- Question 18. Use NULLIF to return NULL when two values are equal ---------------

SELECT NULLIF(100, 100) AS Result;


----------- Question 19. Use NULLIF to avoid division by zero ---------------

SELECT Sales / NULLIF(Orders, 0) AS Result
FROM emp;


----------- Question 20. Replace NULL bonus values with 0 using ISNULL ---------------

SELECT Name,
       ISNULL(Bonus, 0) AS Bonus
FROM emp;
