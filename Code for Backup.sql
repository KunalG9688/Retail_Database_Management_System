USE EmployeeManagement;
-------------------------------------Take one back before----------------------------------------------------
-------------------------------------Take one back before FULL BACKUP----------------------------------------------------
-- Insert first group of 3 records into Employees table
-- Insert records into Employees table
BEGIN TRANSACTION;


INSERT INTO Employees (FirstName, LastName, DateOfBirth, Email, PhoneNumber, HireDate, JobTitle, Department, Salary)
VALUES 
('James', 'Anderson', '1985-06-14', 'james.anderson@example.com', '555-0101', '2020-03-10', 'Project Manager', 'Operations', 95000),
('Olivia', 'Taylor', '1990-01-23', 'olivia.taylor@example.com', '555-0202', '2019-07-12', 'Software Engineer', 'IT', 80000),
('Ethan', 'White', '1987-09-11', 'ethan.white@example.com', '555-0303', '2018-05-21', 'Accountant', 'Finance', 70000);

-- Insert first group of 3 records into Attendance table
INSERT INTO Attendance (EmployeeID, AttendanceDate, Status, CheckInTime, CheckOutTime)
VALUES 
(31, '2024-07-01', 'Present', '09:00', '17:00'),
(32, '2024-07-01', 'Present', '09:15', '17:15'),
(33, '2024-07-01', 'Absent', NULL, NULL);


-- Insert first group of 3 records into Payroll table
INSERT INTO Payroll (EmployeeID, BasicSalary, Bonuses, Deductions)
VALUES 
(31, 95000, 5000, 1000),
(32, 80000, 4000, 800),
(33, 70000, 3500, 700);

COMMIT TRANSACTION;
-------------------------------------Take FULL BACKUP----------------------------------------------------
--- Step 1 taking full back from here ---