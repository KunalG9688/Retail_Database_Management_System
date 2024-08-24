----TDE----

USE Master;
GO
CREATE MASTER KEY ENCRYPTION
BY PASSWORD= 'Password@123';
Go


USE MASTER
GO
CREATE CERTIFICATE tdeCert WITH SUBJECT = 'IDE Certificate';



USE MASTER
GO
SELECT name, pvt_key_encryption_type_desc FROM sys.certificates
WHERE name = 'tdeCert'



BACKUP CERTIFICATE tdeCert TO FILE='C:\LAPTOP-DHF29DBJEncryptionCert.certbak'
WITH PRIVATE KEY(
FILE='C:\LAPTOP-DHF29DBJEncryptionCert.certbak',
ENCRYPTION BY PASSWORD='Password@123')
