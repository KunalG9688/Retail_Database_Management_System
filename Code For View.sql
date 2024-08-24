--- Customer Order Summary View
-- A view to display a summary of orders for each customer, including the total number of orders and the total amount spent.


CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.CustomerID,
    c.Name,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(od.Quantity * p.Price) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.Name;


--- Product Inventory View
-- A view to list products with their current stock levels and supplier information.


CREATE VIEW ProductInventory AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.StockQuantity,
    s.ContactName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;


--- Employee Sales Performance View
-- A view to show the sales performance of each employee, including the number of orders processed and total sales amount.


CREATE VIEW EmployeeSalesPerformance AS
SELECT 
    e.EmployeeID,
    e.Name,
    COUNT(o.OrderID) AS OrdersProcessed,
    SUM(od.Quantity * p.Price) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY e.EmployeeID, e.Name;


--- Recent Orders View
-- A view to display orders placed within the last 30 days.


CREATE VIEW RecentOrders AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.Name,
    e.Name AS EmployeeName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate >= DATEADD(DAY, -30, GETDATE());


--- Top Selling Products View
--- A view to identify the top-selling products based on total quantity sold.

CREATE VIEW TopSellingProducts AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.Name;

SELECT * 
FROM TopSellingProducts
ORDER BY TotalQuantitySold DESC;


--- Order Details by Product View
--- A view to list detailed information for orders by product.

CREATE VIEW OrderDetailsByProduct AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    o.OrderID,
    o.OrderDate,
    od.Quantity,
    (od.Quantity * p.Price) AS TotalPrice
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID;



--- Pending Orders View
--- A view to show orders that have not been shipped yet.

CREATE VIEW PendingOrders AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.Name,
    e.Name AS EmployeeName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.Status = 'Processing';


--- Supplier Product List View
--- A view to list all products supplied by each supplier.

CREATE VIEW SupplierProductList AS
SELECT 
    s.SupplierID,
    s.Name,
    p.ProductID,
    p.Name AS ProductName
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID;


--- Monthly Sales View
--- A view to summarize sales by month and year.

CREATE VIEW MonthlySales AS
SELECT 
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month,
    SUM(od.Quantity * p.Price) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate);



SELECT * 
FROM MonthlySales
ORDER BY Year, Month;


--- Customer Location View
--- A view to show customers along with their city and state information.

CREATE VIEW CustomerLocation AS
SELECT 
    c.CustomerID,
    c.Name,
    c.City,
    c.State
FROM Customers c;
