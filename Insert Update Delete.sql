-----Insert Update Delete-----

-- Insert a new customer record
INSERT INTO Customers (Name, Email, Phone, Address, City, State)
VALUES ('Liam Parker', 'liam.parker@example.com', '555-9876', '789 Maple Street', 'Boston', 'Massachusetts');

-- Retrieve the CustomerID of the inserted record
DECLARE @CustomerID INT;
SET @CustomerID = SCOPE_IDENTITY();


-- Update the phone number of the newly inserted customer
UPDATE Customers
SET Phone = '555-6789'
WHERE CustomerID = 27;

-- Delete the customer record
DELETE FROM Customers
WHERE CustomerID = 27;
