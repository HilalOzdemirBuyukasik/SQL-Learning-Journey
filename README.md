# SQL Query Collection

Welcome to the **SQL Query Collection** repository! This collection is designed to showcase essential SQL concepts through practical examples. The queries cover a wide range of database operations, from basic data selection to advanced performance analysis. Whether you're a beginner or looking to sharpen your SQL skills, you'll find valuable examples here.

## Key Concepts Covered:
- **JOINS, GROUP BY, HAVING**: Combining and aggregating data across multiple tables.
- **Aggregate Functions**: Using functions like `SUM`, `COUNT`, and others for in-depth data analysis.
- **Filtering Data**: Using `WHERE` clauses for conditional filtering and handling dynamic parameters.
- **Date Operations**: Filtering data based on date ranges and specific time frames.

## What You’ll Find:

### 1. **Basic Queries**
- Selecting data from tables with conditions such as price, quantity, and location.
- Basic `SELECT`, `WHERE`, and simple aggregate functions.

### 2. **Advanced Queries**
- Aggregating data for reporting purposes (e.g., total sales, order counts).
- Finding top performers, such as high-value customers or best-selling products.
- Calculating totals by category or customer, often involving complex joins.

### 3. **Performance Analysis**
- **Loyal Customers Report**: Identifying customers with 10+ orders, their total spending, and the country they ordered from most frequently.
- **Revenue-Generating Employees**: Listing employees who have generated over 5,000 TL in sales, with the help of scalar functions.
- **Search Products by Name**: A stored procedure to search products based on a keyword with optional price filtering.

### 4. **Indexing for Optimization**
- Non-clustered indexes are created conditionally to enhance performance during high-read operations (e.g., `JOIN` and `WHERE` filters on `CustomerID`, `EmployeeID`, `OrderID`, `ProductName`, and `UnitPrice`).
- Query performance is significantly improved by utilizing proper indexes.

### 5. **Stored Procedures & Functions**
- Demonstrates the use of **CREATE PROCEDURE** and **CREATE FUNCTION** with parameters and default values to support reusable, parameterized querying.
- Allows for dynamic queries that are flexible and efficient.
