/*
============================================================
CREATE Database and Schemas
============================================================

Script Purpose:
This script resets and initializes the DataWarehouse database.

It drops the existing DataWarehouse database (if it exists),
creates a new one, switches to it, and creates the Bronze and
Silver schemas used to organize data warehouse layers.

WARNING:

within the database: 'bronze', 'silver', and 'gold'.

WARNING:

  Running this script will drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be permanently deleted. Proceed with caution
  and ensure you have proper backups before running this script.

*/

USE master;
-- GO signals the end of a batch, forcing SQL Server to execute the previous commands before moving on.
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- GO is required here because CREATE SCHEMA must be the first statement in a query batch.
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
