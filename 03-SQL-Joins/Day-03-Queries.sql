/*
========================================================
Topic      : SQL Joins
Day        : 3
Database   : SQL Server (SSMS)
Author     : Avantika Sharad Kaloge
========================================================
*/


----------- Question 1. Display employee name and department name using INNER JOIN ---------------

SELECT e.Name AS Employee,
       d.Department AS Department
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;


----------- Question 2. Display all employees and their department names using LEFT JOIN ---------------

SELECT e.Name AS Employee,
       d.Department AS Department
FROM Employees e
LEFT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;


----------- Question 3. Display all departments and matching employees using RIGHT JOIN ---------------

SELECT e.Name AS Employee,
       d.Department AS Department
FROM Employees e
RIGHT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;


----------- Question 4. Display all employees and all departments using FULL OUTER JOIN ---------------

SELECT e.Name AS Employee,
       d.Department AS Department
FROM Employees e
FULL OUTER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;


----------- Question 5. Display every possible employee and department combination using CROSS JOIN ---------------

SELECT e.Name AS Employee,
       d.Department AS Department
FROM Employees e
CROSS JOIN Departments d;


----------- Question 6. Display each employee along with their manager using SELF JOIN ---------------

SELECT e.Name AS Employee, 
       m.Name AS Manager
FROM Employees e
JOIN Employees m
    ON e.ManagerID = m.EmpID;


----------- Question 7. Display all employees including employees without a manager ---------------

SELECT e.Name AS Employee,
       m.Name AS Manager
FROM Employees e
LEFT JOIN Employees m
    ON e.ManagerID = m.EmpID;


----------- Question 8. Find employees who earn more than their managers ---------------

SELECT e.Name AS Employee,
       e.Salary AS EmployeeSalary,
       m.Name AS Manager,
       m.Salary AS ManagerSalary
FROM Employees e
JOIN Employees m
    ON e.ManagerID = m.EmpID
WHERE e.Salary > m.Salary;


----------- Question 9. Find managers who have 2 or more employees reporting to them ---------------

SELECT m.Name AS Manager,
       COUNT(*) AS EmployeeCount
FROM Employees e
JOIN Employees m
    ON e.ManagerID = m.EmpID
GROUP BY m.Name
HAVING COUNT(*) >= 2;


----------- Question 10. Display employee, department and city using multiple JOINs ---------------

SELECT e.Name AS Employee,
       d.Department AS Department,
       l.City AS City
FROM Employees e
JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
JOIN Locations l
    ON d.LocationID = l.LocationID;


----------- Question 11. LEFT JOIN with condition inside ON ---------------

SELECT e.Name AS Employee,
       d.Department AS Department
FROM Employees e
LEFT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
    AND d.Department = 'IT';


----------- Question 12. LEFT JOIN with condition inside WHERE ---------------

SELECT e.Name AS Employee,
       d.Department AS Department
FROM Employees e
LEFT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
WHERE d.Department = 'IT';


----------- Question 13. Find employees who do not have a matching department ---------------

SELECT e.Name AS Employee,
       d.Department AS Department
FROM Employees e
LEFT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
WHERE d.Department IS NULL;
