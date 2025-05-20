SQL Query Collection

This repository contains a collection of SQL queries designed to showcase various essential SQL concepts. These queries cover common database operations such as:

JOIN, GROUP BY, HAVING for combining and aggregating data.

Using aggregate functions like SUM, COUNT, and others for data analysis.

Filtering data with WHERE clauses and handling dynamic conditions.

Working with date ranges and performing date filtering.

What You'll Find:
Basic Queries
Selecting data, filtering by conditions like price, quantity, and location.

Advanced Queries
Aggregating data, identifying top performers, calculating totals by customer or category.

Performance Analysis

"Loyal Customers" report: Finds customers with 10+ orders, their total spending, and most frequent ship country.

"Revenue-Generating Employees": Lists employees generating over 5,000 TL in sales, using a scalar function.

"Search Products by Name": A stored procedure enabling keyword-based product search with optional price filtering.

Indexes for Optimization
Non-clustered indexes are created conditionally to optimize performance in high-read operations like JOINs and WHERE filters on CustomerID, EmployeeID, OrderID, ProductName, and UnitPrice.

Stored Procedures & Functions
Demonstrates use of CREATE PROCEDURE and CREATE FUNCTION with parameters and default values to support reusable, parameterized querying.
