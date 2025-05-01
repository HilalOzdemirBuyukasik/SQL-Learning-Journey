
-- The following examples showcase commonly used SQL queries, solved using the Northwind sample database. These queries demonstrate essential SQL concepts such as JOIN, GROUP BY, HAVING, AGGREGATE FUNCTIONS, and more — all designed to help beginners and intermediate users improve their data analysis skills using relational databases.

--Each query focuses on real-world business questions like:

-- Who is the top-performing employee?

-- What are the sales totals by category?

-- Which customers generate the most revenue?

-- What are the most frequently sold products?

-- Feel free to explore, modify, and learn from these examples!


-- Q1: Who Is My Top Performing Employee?
-- Find the employee who generated the highest revenue from orders.

SELECT
	TOP 1
	E.FirstName+SPACE(1) + E.LastName as FullName,
	FORMAT(SUM(OD.UnitPrice * OD.Quantity * (1 - Discount)), 'C', 'tr-TR') AS TotalRevenue
FROM Employees AS E
JOIN Orders as O ON E.EmployeeID = O.EmployeeID
JOIN [Order Details] AS OD ON OD.OrderID = O.OrderID
GROUP BY E.FirstName, E.LastName
ORDER BY SUM(OD.UnitPrice * OD.Quantity * (1 - Discount)) DESC


-- Q2: 2️⃣ Sales by Category
-- Show total sales revenue for each product category.

SELECT 
		C.CategoryName,
		FORMAT(SUM(OD.UnitPrice * OD.Quantity * (1-Discount)), 'C', 'tr-TR') AS Totalrevenue
FROM Products AS P
JOIN [Order Details] AS OD ON OD.ProductID = P.ProductID
JOIN Categories as C ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName
ORDER BY SUM(OD.UnitPrice * OD.Quantity * (1-Discount)) DESC

-- Q3: Customer Sales Report (Under 10,000)
-- List customers whose total purchases are under 10,000.

SELECT
	C.CompanyName,
	CAST(SUM(OD.UnitPrice * OD.Quantity * (1-Discount)) AS DECIMAL(18,2)) AS TotalSales
FROM [Order Details] AS OD
JOIN Orders AS O ON O.OrderID = OD.OrderID
JOIN Customers AS C ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName
HAVING SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount)) <= 10000
ORDER BY TotalSales DESC

-- Q4: Product Sales and Supplier Info (Quantities > 1000)
-- Display sales quantity and revenue per product and supplier for products sold more than 1000 units.

SELECT 
	P.ProductName,
	S.CompanyName,
	SUM(OD.Quantity) AS TotalQuantity,
	FORMAT(SUM(OD.UnitPrice * OD.Quantity * (1-Discount)), 'C', 'en-US') AS TotalRevenue
FROM Products AS P
JOIN [Order Details] AS OD ON OD.ProductID = P.ProductID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID
GROUP BY P.ProductName, S.CompanyName
HAVING SUM(OD.Quantity) > 1000
ORDER BY TotalQuantity Desc


-- Q5: Monthly Order Count (Over 100 Orders)
-- Show the number of orders per month, only for months with more than 100 orders.

SELECT
	MONTH(OrderDate) AS Month,
	COUNT(OrderID) AS TotalOrder
FROM Orders
GROUP BY MONTH(OrderDate)
HAVING COUNT(OrderID) > 100
ORDER BY TotalOrder DESC

-- Q6: Product Count by Category
-- Count how many products exist in each category.

SELECT
	C.CategoryName,
	COUNT(p.ProductID) AS TotalProduct
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
ORDER BY TotalProduct DESC

-- Q7: Order Revenue Below $2000
-- List orders where the total revenue is less than $2000.

SELECT 
  OrderID,
  FORMAT(SUM(UnitPrice * Quantity * (1 - Discount)), 'C', 'en-US') AS OrderRevenue
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice * Quantity * (1 - Discount)) < 2000
ORDER BY OrderRevenue DESC
