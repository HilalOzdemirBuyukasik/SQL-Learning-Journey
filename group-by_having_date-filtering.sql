
USE Northwind;

-- This script includes SQL queries that demonstrate the use of GROUP BY, HAVING, and date filtering techniques 
-- to aggregate, filter, and analyze data in the Northwind database. The queries focus on orders, revenue, 
-- and order shipment details within specific date ranges.

-- Query 1: Monthly Order Count (Over 100 Orders)
-- This query counts the number of orders per month and filters to show only months with more than 100 orders. 
-- The results are sorted by the total order count in descending order.

-- Query 2: Order Revenue Below $2000
-- This query calculates the total revenue for each order and filters for orders where the total revenue is less than $2000. 
-- The results are sorted by order revenue in descending order.

-- Query 3: List Orders Shipped Between Two Specific Dates
-- This query lists orders shipped between two user-defined dates using variables. It selects the shipping method, 
-- ship name, address, and formats the order date in a readable format.



-- Q1: Monthly Order Count (Over 100 Orders)
-- Show the number of orders per month, only for months with more than 100 orders.

SELECT
	MONTH(OrderDate) AS Month,
	COUNT(OrderID) AS TotalOrder
FROM Orders
GROUP BY MONTH(OrderDate)
HAVING COUNT(OrderID) > 100
ORDER BY TotalOrder DESC

-- Q2: Order Revenue Below $2000
-- List orders where the total revenue is less than $2000.

SELECT 
  OrderID,
  FORMAT(SUM(UnitPrice * Quantity * (1 - Discount)), 'C', 'en-US') AS OrderRevenue
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice * Quantity * (1 - Discount)) < 2000
ORDER BY OrderRevenue DESC


-- Q3: List orders shipped between two specific dates using declared variables
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
