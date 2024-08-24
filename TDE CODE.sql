
USE MASTER;
GO

DROP MASTER KEY;


CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Kun!!123Kun!!123';
GO


USE MASTER;
GO
CREATE CERTIFICATE tdeCert WITH SUBJECT = 'TDE Certificate';

USE MASTER;
go
SELECT name, pvt_key_encryption_type_desc FROM sys.certificates
where name = 'tdeCert'

BACKUP CERTIFICATE tdeCert To FILE = 'C:\Users\Tarun Gaurav\Desktop\password for retail business\LAPTOP_DHF29DBJEncryptionCert.certbak'
WITH PRIVATE KEY (
FILE = 'C:\Users\Tarun Gaurav\Desktop\password for retail business\LAPTOP_DHF29DBJEncryptionCert.pkbak',
ENCRYPTION BY PASSWORD ='Kun!!123Kun!!123')

USE [RetailB_DB]
GO
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_128
ENCRYPTION BY SERVER CERTIFICATE tdeCert

ALTER DATABASE [RetailB_DB] SET ENCRYPTION ON

USE master;
go
SELECT name, is_encrypted from sys.databases

