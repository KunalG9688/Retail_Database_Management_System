--- Customer Purchase History View
--- A view to display the purchase history of each customer, including the products they've purchased and the dates of their orders.

CREATE VIEW CustomerPurchaseHistory AS
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.OrderDate,
    p.ProductID,
    p.Name AS ProductName,
    od.Quantity,
    (od.Quantity * p.Price) AS TotalPrice
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;


--- Inactive Customers View
--- A view to list customers who have not placed any orders in the past year.

CREATE VIEW InactiveCustomers AS
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    MAX(o.OrderDate) AS LastOrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING MAX(o.OrderDate) < DATEADD(YEAR, -1, GETDATE()) OR MAX(o.OrderDate) IS NULL;

--- Employee Order History View
---A view to display the order history handled by each employee.

CREATE VIEW EmployeeOrderHistory AS
SELECT 
    e.EmployeeID,
    e.Name,
    o.OrderID,
    o.OrderDate,
    c.Name AS CustomerName,
    SUM(od.Quantity * p.Price) AS TotalOrderValue
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY e.EmployeeID, e.Name, o.OrderID, o.OrderDate, c.Name;


--- Supplier Performance View
--- A view to evaluate the performance of suppliers based on the number of products supplied and the total value of those products.

CREATE VIEW SupplierPerformance AS
SELECT 
    s.SupplierID,
    s.Name AS SupplierName,
    COUNT(p.ProductID) AS ProductsSupplied,
    SUM(p.StockQuantity * p.Price) AS TotalValueSupplied
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.Name;


-- Order Profitability View
-- A view to calculate the profitability of each order, assuming a cost column is available in the Products table.

CREATE VIEW OrderProfitability AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.Name AS CustomerName,
    SUM(od.Quantity * (p.Price)) AS TotalProfit
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderID, o.OrderDate, c.Name;


--- Daily Sales Summary View
--- A view to summarize sales on a daily basis.

CREATE VIEW DailySalesSummary AS
SELECT 
    CAST(o.OrderDate AS DATE) AS SaleDate,
    SUM(od.Quantity * p.Price) AS TotalSales,
    COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY CAST(o.OrderDate AS DATE);


--- Order Details with Customer Info View
--- A view to combine order details with customer information for detailed reporting.

CREATE VIEW OrderDetailsWithCustomerInfo AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    c.Name As CustomerName,
    od.ProductID,
    p.Name AS ProductName,
    od.Quantity,
    (od.Quantity * p.Price) AS TotalPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

--- Product Restock Alert View
--- A view to list products that need restocking based on a minimum stock threshold.

CREATE VIEW ProductRestockAlert AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.StockQuantity,
    p.SupplierID,
    s.ContactName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.StockQuantity < 10; -- Assuming 10 is the threshold for restocking

--- Monthly Customer Spending View
--- A view to show the total spending of each customer per month.
CREATE VIEW MonthlyCustomerSpending AS
SELECT 
    c.CustomerID,
    c.Name As CustomerName,
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month,
    SUM(od.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.Name, YEAR(o.OrderDate), MONTH(o.OrderDate);
