-- Create the Log table to store data
CREATE TABLE Log (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Department VARCHAR(255)
);

-- Create the AuditLog1 table to store audit information
CREATE TABLE AuditLog1 (
    Operation NVARCHAR(10),
    TableName NVARCHAR(255),
    OldValue NVARCHAR(MAX),
    NewValue NVARCHAR(MAX),
    ChangeDate DATETIME
);

-- Create a trigger to capture old and new values
CREATE TRIGGER AuditTrigger
ON Log
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation NVARCHAR(10);

    IF EXISTS (SELECT * FROM INSERTED)
    BEGIN
        IF EXISTS (SELECT * FROM DELETED)
            SET @Operation = 'UPDATE';
        ELSE
            SET @Operation = 'INSERT';
    END
    ELSE
    BEGIN
        SET @Operation = 'DELETE';
    END;

    INSERT INTO AuditLog1 (Operation, TableName, OldValue, NewValue, ChangeDate)
    SELECT
        @Operation,
        'Log',
        CAST((SELECT * FROM DELETED FOR XML AUTO, ELEMENTS) AS NVARCHAR(MAX)),
        CAST((SELECT * FROM INSERTED FOR XML AUTO, ELEMENTS) AS NVARCHAR(MAX)),
        GETDATE();
END;

insert into Log values('1','suk','cse')
insert into Log values('2','hircok','te')
insert into Log values('3','suk','ict')
insert into Log values('4','hirock','it')

select * from AuditLog1
update Log set Name='hi' where Id= 4
select * from Log