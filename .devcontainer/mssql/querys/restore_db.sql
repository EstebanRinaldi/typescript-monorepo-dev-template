-- List the LogicalNames for the move command.
restore filelistonly from disk = '/var/opt/mssql-tools/backups/SSAS_Lunes.bak'
GO

/**
-- Restore the database (must not exist a database with the same name).
-- The move string is the logical name of each file.
restore database SSAS from disk = '/var/opt/mssql-tools/backups/SSAS_Lunes.bak'
with move 'Base_Data' to '/var/opt/mssql/data/SSAS.mdf',
move 'Base_Log' to '/var/opt/mssql/data/SSAS.ldf'
GO
**/