---DBCC CHECKDB---

DBCC CHECKDB	('RetailB_DB')
DBCC CHECKDB    ('RetailB_DB') with no_infomsgs

alter database RetailB_DB set single_user with rollback immediate
go
dbcc checkdb ('RetailB_DB',REPAIR_ALLOW_DATA_LOSS)
GO
alter database RetailB_DB set MULTI_user with rollback immediate
GO
