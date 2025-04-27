
--SQL Practice Queries – Northwind Database


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

-- Query 8: Products not containing the word "milk", ordered by stock (high to low)
-- This query retrieves all products whose names do not contain the word "milk". It also displays their unit prices and current stock levels, and sorts the result by UnitsInStock in descending order (most stock to least).

SELECT 
	ProductName, 
	UnitPrice, 
	UnitsInStock
FROM Products
WHERE ProductName NOT LIKE '%milk%'
ORDER BY UnitsInStock DESC

-- Query 9: List orders shipped between two specific dates using declared variables
-- This query lists orders shipped between two dynamic dates, defined using variables. It selects the shipping method (ShipVia), shipping name (ShipName), address, and the formatted order date.

-- Declare variables to hold start and end dates
DECLARE @startDate NVARCHAR(20)
DECLARE @endDate NVARCHAR(20)

-- Assign values to the variables using SET
SET @startDate = '01.01.1997'
SET @endDate = '31.03.1997'

-- Select relevant order information within the specified date range
SELECT 
    ShipVia,
    ShipName,
    ShipAddress,
    FORMAT(OrderDate, 'dd.MM.yyyy') AS OrderDate
FROM Orders
WHERE OrderDate BETWEEN 
    CONVERT(DATETIME, @startDate, 104) AND 
    CONVERT(DATETIME, @endDate, 104)
