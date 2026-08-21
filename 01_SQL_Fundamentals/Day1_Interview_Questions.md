# Day 1 - SQL Fundamentals: Interview Questions

## 1. What is SQL?

SQL stands for Structured Query Language. It is used to work with data stored in relational databases. We can use SQL to retrieve, filter, insert, update, and delete data.



## 2. What is the difference between `SELECT *` and selecting specific columns?

`SELECT *` returns all columns from a table.

For example:

SELECT *
FROM emp;

If I only need specific information, I can select only those columns.

For example:

SELECT first_Name, Salary
FROM emp;

In real projects, selecting only the required columns is usually better than using `SELECT *`.



## 3. What is `DISTINCT`?

`DISTINCT` is used to remove duplicate values from the result.

For example:

SELECT DISTINCT Department
FROM emp;

If multiple employees belong to the IT department, IT will appear only once in the result.



## 4. What is the purpose of the `WHERE` clause?

The `WHERE` clause is used to filter rows based on a condition.

For example:

SELECT *
FROM emp
WHERE Salary > 60000;

This returns only employees whose salary is greater than 60000.



## 5. What is the difference between `AND` and `OR`?

`AND` means all conditions must be true.

`OR` means at least one condition must be true.

For example:

SELECT *
FROM emp
WHERE Department = 'IT'
AND Salary > 60000;

Here, both conditions must be true.



## 6. Why do we use parentheses with `AND` and `OR`?

Parentheses help control the order in which conditions are evaluated and make the query easier to understand.

For example:

SELECT *
FROM emp
WHERE Department = 'IT'
AND (Salary > 60000 OR Age < 25);

The employee must be from the IT department and must also satisfy at least one of the conditions inside the parentheses.



## 7. What is `LIKE` used for?

`LIKE` is used to search for a specific pattern in text.

For example:

SELECT *
FROM emp
WHERE first_Name LIKE 'A%';

This finds names that start with A.

`%` represents any number of characters.



## 8. What is `NULL` in SQL?

`NULL` means the value is missing or unknown. It is not the same as zero or an empty string.

To check for `NULL`, we use `IS NULL`.

For example:

SELECT *
FROM emp
WHERE Email IS NULL;



## 9. What is the difference between `IS NULL` and `= NULL`?

We should use `IS NULL` to check for missing values.

Correct:

WHERE Email IS NULL;

Using `= NULL` does not work because `NULL` represents an unknown value, and SQL cannot compare it using the normal equal operator.



## 10. What is `ORDER BY` used for?

`ORDER BY` is used to sort the result.

By default, it sorts in ascending order.

For example:

SELECT *
FROM emp
ORDER BY Salary DESC;

This sorts employees from the highest salary to the lowest salary.



## 11. What is the difference between `ASC` and `DESC`?

`ASC` means ascending order, such as lowest to highest or A to Z.

`DESC` means descending order, such as highest to lowest or Z to A.



## 12. What is `TOP` in SQL Server?

`TOP` is used to limit the number of rows returned.

For example:

SELECT TOP 5 *
FROM emp
ORDER BY Salary DESC;

This returns the top 5 highest-paid employees.



## 13. What is the difference between `TOP` and `OFFSET FETCH`?

`TOP` is mainly used when we simply want a specific number of rows.

`OFFSET FETCH` is useful when we want to skip some rows and return the next set of rows, such as for pagination.

For example:

SELECT *
FROM emp
ORDER BY Salary DESC
OFFSET 3 ROWS
FETCH NEXT 2 ROWS ONLY;

This skips the first 3 rows and returns the next 2 rows.



## 14. Why is `ORDER BY` important when using `TOP` or `OFFSET FETCH`?

Without `ORDER BY`, SQL does not guarantee which rows will be returned first.

If I want the highest-paid employees, I need to sort the salary first.

For example:

SELECT TOP 5 *
FROM emp
ORDER BY Salary DESC;



## 15. What is the logical execution order of a basic SQL query?

A simplified logical order is:

1. FROM
2. WHERE
3. SELECT
4. ORDER BY

SQL does not logically execute the query in the same order in which we write it.
Understanding this helps explain why some SQL operations work only at certain stages of a query.

