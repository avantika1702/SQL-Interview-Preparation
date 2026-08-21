# Day 2 - Aggregate Functions: Interview Questions

## 1. What are aggregate functions in SQL?

Aggregate functions perform calculations on multiple rows and return a single result.

Some common aggregate functions are:

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

They can also return one result for each group when used with GROUP BY.


## 2. What is the difference between COUNT(*) and COUNT(column)?

COUNT(*) counts all rows.

COUNT(column) counts only the rows where that column is not NULL.

For example, if a Salary column has 5 rows but one salary is NULL:

* COUNT(*) returns 5
* COUNT(Salary) returns 4



## 3. What is COUNT(1)?

COUNT(1) counts the rows in a similar way to COUNT(*).

In normal SQL Server usage, COUNT(1) and COUNT(*) are generally used to count rows.



## 4. How does NULL affect aggregate functions?

Most aggregate functions ignore NULL values.

For example, SUM(), AVG(), MIN(), and MAX() ignore NULL values.

COUNT(column) also ignores NULL values, but COUNT(*) counts all rows.


## 5. What is GROUP BY?

GROUP BY is used to group rows that have the same value in one or more columns.

It is commonly used with aggregate functions.

For example, to find the total salary for each department:

SELECT Department, SUM(Salary)
FROM emp
GROUP BY Department;



## 6. When do you know that GROUP BY may be needed?

Words like "per", "each", or "for every" can indicate that GROUP BY may be needed.

For example:

* Total salary per department
* Average salary for each department
* Number of employees in each department



## 7. Why can't we select any column when using GROUP BY?

When GROUP BY is used, a selected column should either be included in the GROUP BY clause or be used inside an aggregate function.

Otherwise, SQL may not know which value from the group should be returned.



## 8. What is the difference between WHERE and HAVING?

WHERE filters individual rows before grouping.

HAVING filters groups after GROUP BY.

For example:

WHERE Salary > 50000

filters employees before they are grouped.

HAVING COUNT(*) > 2

filters the groups after the employee count has been calculated.



## 9. Can aggregate functions be used directly in WHERE?

Normally, aggregate functions such as COUNT(), SUM(), or AVG() cannot be used directly in WHERE because WHERE is processed before grouping and aggregation.

For filtering aggregated results, we use HAVING.



## 10. Can WHERE and HAVING be used in the same query?

Yes.

WHERE filters rows first.

Then GROUP BY creates groups.

HAVING filters those groups.

For example:

SELECT Department, COUNT(*)
FROM emp
WHERE Salary > 50000
GROUP BY Department
HAVING COUNT(*) > 2;



## 11. What is CASE in SQL?

CASE is used to apply conditions and return different values based on those conditions.

It works similar to IF-ELSE logic.

For example, it can be used to categorize salaries as High, Medium, or Low.

The ELSE part is optional, but END is required to finish the CASE expression.



## 12. Does CASE stop after finding a true condition?

Yes. CASE checks the conditions in order.

When a condition is true, it returns that result and does not continue to the later WHEN conditions.

This is why the order of conditions is important.


## 13. What does COALESCE() do?

COALESCE() returns the first non-NULL value from the expressions provided.

For example:

COALESCE(Bonus, 0)

If Bonus is NULL, it returns 0.

COALESCE() can also check multiple values.



## 14. What does NULLIF() do?

NULLIF() compares two expressions.

If both values are equal, it returns NULL.

If they are different, it returns the first value.

For example:

NULLIF(100, 100)

returns NULL.

NULLIF() is commonly used to help avoid division-by-zero errors.



## 15. What does ISNULL() do?

ISNULL() is used in SQL Server to replace a NULL value with another value.

For example:

ISNULL(Bonus, 0)

If Bonus is NULL, it returns 0.

Otherwise, it returns the original Bonus value.



## 16. What is the difference between COALESCE() and ISNULL()?

Both can be used to handle NULL values.

ISNULL() accepts exactly two arguments and is mainly associated with SQL Server.

COALESCE() can accept multiple expressions and is more portable across different database systems.

For example:

COALESCE(Phone, Email, AlternativePhone, 'No Contact')

returns the first available non-NULL value.



## 17. What does portable mean in SQL?

Portable means that SQL code can work across different database systems with little or no change.

COALESCE() is more portable because it is supported by major database systems.



## 18. What is the logical execution order when using GROUP BY and HAVING?

A simplified logical execution order is:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. OFFSET/FETCH

This order helps explain why aggregate conditions are generally used in HAVING instead of WHERE.

