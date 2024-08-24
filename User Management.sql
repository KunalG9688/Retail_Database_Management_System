-- Create a New User
CREATE LOGIN RetailUser WITH PASSWORD = 'SecurePassword123';

-- Create a User in the Database
CREATE USER RetailUser FOR LOGIN RetailUser;

-- Grant Permissions
ALTER ROLE db_datareader ADD MEMBER RetailUser;
ALTER ROLE db_datawriter ADD MEMBER RetailUser;
