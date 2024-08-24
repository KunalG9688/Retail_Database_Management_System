USE MyDatabase
go

ALTER DATABASE MyDatabase SET ENCRYPTION OFF
GO
DROP DATABASE ENCRYPTION KEY 

-- Drop the existing master key
DROP MASTER KEY;
GO

USE master;
GO

-- Drop the certificate
DROP CERTIFICATE tdeCert;
GO
