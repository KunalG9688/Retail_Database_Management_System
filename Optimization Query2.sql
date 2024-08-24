---- Query Optimization


-- Efficient JOIN and use of WHERE clause to filter data early
SELECT o.OrderID, p.Name, od.Quantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate >= '2024-01-01';


-- Select only necessary columns
SELECT Name, Price
FROM Products
WHERE StockQuantity > 0;

-- Use EXISTS for better performance in subqueries
SELECT p.Name
FROM Products p
WHERE EXISTS (
    SELECT 1
    FROM OrderDetails od
    WHERE od.ProductID = p.ProductID
);

--- Optimizing Joins

-- Join on indexed columns and ensure efficient filtering
SELECT c.Name, o.OrderID
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate > '2024-01-01';




