SELECT 
    db.name AS DatabaseName,
    CASE 
        WHEN dek.encryption_state IS NULL THEN 'Not Encrypted'
        WHEN dek.encryption_state = 0 THEN 'No Encryption Key'
        WHEN dek.encryption_state = 1 THEN 'Unencrypted'
        WHEN dek.encryption_state = 2 THEN 'Encryption in Progress'
        WHEN dek.encryption_state = 3 THEN 'Encrypted'
        WHEN dek.encryption_state = 4 THEN 'Key Change in Progress'
        WHEN dek.encryption_state = 5 THEN 'Decryption in Progress'
        ELSE 'Unknown State'
    END AS EncryptionStatus,
    dek.encryption_state AS EncryptionState,
    dek.key_algorithm AS KeyAlgorithm,
    dek.key_length AS KeyLength
FROM 
    sys.databases db
LEFT JOIN 
    sys.dm_database_encryption_keys dek 
ON 
    db.database_id = dek.database_id
ORDER BY 
    db.name;
GO
