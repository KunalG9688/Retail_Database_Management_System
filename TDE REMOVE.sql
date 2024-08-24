SELECT name, is_master_key_encrypted_by_server 
FROM sys.databases
WHERE is_master_key_encrypted_by_server = 1;

USE master;

SELECT name 
FROM sys.certificates
WHERE pvt_key_encryption_type = 'MK';

USE master;
DROP CERTIFICATE tdeCert;

DROP MASTER KEY;
