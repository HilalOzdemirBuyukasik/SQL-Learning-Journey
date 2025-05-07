
USE Northwind;

-- Basic SELECT & WHERE Clauses

-- Query 1: Select all columns from Products table
-- This query retrieves every column for each product in the Products table.

SELECT * FROM Products

-- Query 2: Select products with UnitPrice greater than 20
-- Filters products that have a unit price higher than 20.

SELECT 
	ProductName, 
	UnitPrice
FROM Products
WHERE UnitPrice > 20

-- Query 3: Products with stock ≥ 50 and price between 30 and 100
-- Lists products that have at least 50 units in stock and a unit price between 30 and 100.

SELECT 
	ProductName, 
	UnitPrice, 
	UnitsInStock
FROM Products
WHERE UnitsInStock >= 50 AND UnitPrice BETWEEN 30 AND 100

-- Query 4: Customers from USA
-- Retrieves all customers located in the USA.

SELECT 
	CompanyName, 
	ContactName
FROM Customers
WHERE Country = 'USA'

-- Query 5: Employees hired before the year 2000
-- Lists employees who were hired before January 1st, 2000.

SELECT 
	FirstName, 
	LastName
FROM Employees
WHERE HireDate < '2000-01-01'

-- Query 6: Employees who have worked for 5+ years
-- Returns the names of employees who have been working at the company for at least 5 years.

SELECT 
	FirstName, 
	LastName, 
DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked
FROM Employees
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) >= 5

-- Query 7: Customers whose contact names start with 'P'
-- Lists customers whose contact person’s name begins with the letter "P".

SELECT 
	CompanyName, 
	ContactName
FROM Customers
WHERE ContactName LIKE 'P%'

