---- Optimized SQL Queries

-- Retrieve all customers with only necessary columns
SELECT CustomerID, Name, Email, City, State
FROM Customers;

-- Retrieve all orders for a specific customer using an index
CREATE INDEX idx_customer_name ON Customers (Name);

SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Name = 'John Doe';


-- Retrieve all products with their suppliers
SELECT p.Name AS ProductName, s.Name AS SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;


-- Retrieve orders with a total amount greater than $1000
SELECT OrderID, CustomerID, OrderDate, TotalAmount
FROM Orders
WHERE TotalAmount > 1000;

-- Retrieve the top 5 most expensive products using indexes
CREATE INDEX idx_price ON Products (Price);

SELECT TOP 5 Name, Price
FROM Products
ORDER BY Price DESC;


-- Retrieve all order details for a specific order
SELECT od.OrderID, p.Name AS ProductName, od.Quantity, od.Price
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE od.OrderID = 1;

-- Retrieve total sales amount by customer
SELECT c.Name, SUM(o.TotalAmount) AS TotalSales
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Name
ORDER BY TotalSales DESC;

-- Retrieve all orders with their statuses
SELECT o.OrderID, c.Name AS CustomerName, o.OrderDate, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Retrieve products with stock quantity less than 50
SELECT Name, StockQuantity
FROM Products
WHERE StockQuantity < 50;


-- Retrieve customers located in a specific state using an index
CREATE INDEX idx_state ON Customers (State);

SELECT Name, Email, City, State
FROM Customers
WHERE State = 'California';
