# Day 3 – SQL Joins Interview Questions

## Q1. What is a JOIN in SQL?

A JOIN is used to combine related rows from two or more tables using a matching condition between them.


## Q2. What is an INNER JOIN?

INNER JOIN returns only the rows where there is a matching value in both tables.

For example, if an employee has a department ID that exists in the department table, that employee will appear in the result.


## Q3. What is a LEFT JOIN?

LEFT JOIN returns all rows from the left table and the matching rows from the right table.

If there is no matching row in the right table, SQL shows NULL for the right table columns.


## Q4. What is a RIGHT JOIN?

RIGHT JOIN returns all rows from the right table and the matching rows from the left table.

If there is no matching row in the left table, SQL shows NULL for the left table columns.


## Q5. What is a FULL OUTER JOIN?

FULL OUTER JOIN returns all matching and non-matching rows from both tables.

If there is no match, SQL shows NULL for the columns from the table where the matching row is missing.


## Q6. What is a CROSS JOIN?

CROSS JOIN returns every possible combination of rows from two tables.

For example, if one table has 5 rows and another has 3 rows, the result will have 15 rows.


## Q7. What is a SELF JOIN?

A SELF JOIN means joining a table with itself.

It is useful when rows in the same table are related to each other, such as when an employee and their manager are stored in the same table.


## Q8. Why do we use aliases in a SELF JOIN?

We use aliases because the same table is used twice, and SQL needs a way to identify each copy of the table.

For example:

e can represent the employee and m can represent the manager.


## Q9. Explain this SELF JOIN condition:

ON e.ManagerID = m.EmpID

The employee's ManagerID is matched with another employee's EmpID.

For example, if Amit has ManagerID = 1, SQL looks for the employee whose EmpID = 1. If that employee is Rahul, Rahul is Amit's manager.


## Q10. What is a multiple-table JOIN?

A multiple-table JOIN is used when we need data from three or more related tables.

For example:

Employees → Departments → Locations

We can first connect Employees with Departments and then connect Departments with Locations.


## Q11. What is the difference between ON and WHERE in a JOIN?

ON is used to define how rows from the tables should match.

WHERE is used to filter the rows after the result is created.


## Q12. What happens when a condition is placed inside ON with a LEFT JOIN?

The condition controls which rows from the right table can match, but the LEFT JOIN still keeps all rows from the left table.

For example, if we put Department = 'IT' inside ON, all employees can still appear, but employees from other departments may get NULL for the department.


## Q13. What happens when a condition is placed in WHERE with a LEFT JOIN?

The LEFT JOIN first creates the result, and then WHERE filters that result.

Because of this, unmatched rows with NULL values can be removed.


## Q14. How can we find employees who do not have a matching department?

We can use a LEFT JOIN and check for NULL in the right table.

Example:

SELECT e.Name, d.Department
FROM Employees e
LEFT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
WHERE d.Department IS NULL;


## Q15. Can a SELF JOIN use LEFT JOIN?

Yes.

A LEFT JOIN can be used in a SELF JOIN when we want to keep all employees, including employees who do not have a manager.


## Q16. Can we use GROUP BY and HAVING with a SELF JOIN?

Yes.

For example, we can use SELF JOIN with GROUP BY and HAVING to find managers who have at least two employees reporting to them.


## Q17. What is the difference between a JOIN condition and a filter condition?

A JOIN condition tells SQL how two tables are related and which rows should match.

A filter condition is used to decide which rows should remain in the final result.
