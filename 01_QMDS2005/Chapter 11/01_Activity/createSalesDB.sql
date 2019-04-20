CREATE DATABASE SalesDB;
GO
USE SalesDB

-- to create SalesDetails table
CREATE TABLE SalesDetails
(
Year varchar(4),
TotalSales money
)
-- to insert data in the SalesDetails table
INSERT INTO SalesDetails VALUES ('2006',25000)

-- create user in the SalesDB Database
CREATE USER Robert FOR LOGIN Robert

-- to grant permission
EXEC sp_addrolemember 'db_owner', 'Robert'

-- to give ownership of teh database to the sa

ALTER DATABASE AdventureWorks SET TRUSTWORTHY ON
ALTER DATABASE SalesDB SET TRUSTWORTHY ON
ALTER AUTHORIZATION ON DATABASE::[AdventureWorks] TO [SA];
ALTER AUTHORIZATION ON DATABASE::[SalesDB] TO [SA];

-- to crate master encryption key
USE AdventureWorks
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'niit#1234'
USE SalesDB
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'niit#1234'


-- to enable Service Broker 
ALTER DATABASE AdventureWorks SET ENABLE_BROKER
ALTER DATABASE SalesDB SET ENABLE_BROKER
USE AdventureWorks
GO
DISABLE TRIGGER SalesOrderHeader.uSalesOrderHeader ON
Sales.SalesOrderHeader