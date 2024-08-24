-- Comprehensive Retail Database Management System: Design, Implementation, and Optimization

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    Address NVARCHAR(255)
);

-- Create a new Products table without IDENTITY
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(255),
    Description NVARCHAR(255),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    SupplierID INT FOREIGN KEY REFERENCES Suppliers(SupplierID)
);


-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    Price DECIMAL(10, 2)
);

-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Position NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(15)
);

-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    ContactName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    Address NVARCHAR(255)
);


-- Create Orders Table with EmployeeID
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    Status NVARCHAR(50),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID) -- Added EmployeeID
);


ALTER TABLE Customers
ADD City NVARCHAR(100),
    State NVARCHAR(100);
