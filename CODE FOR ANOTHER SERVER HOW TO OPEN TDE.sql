USE MASTER;
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Kun!!123';
GO

CREATE CERTIFICATE tdeCert
FROM FILE = 'C:\Users\Tarun Gaurav\Desktop\password for retail business\LAPTOP_DHF29DBJEncryptionCert.certbak'
with private key (file = 'C:\Users\Tarun Gaurav\Desktop\password for retail business\LAPTOP_DHF29DBJEncryptionCert.pkbak',
Decryption by password = 'Kun!!123Kun!!123');
GO

