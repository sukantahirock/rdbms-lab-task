CREATE PROCEDURE multiply
    @1stnumber INT,
    @2ndNumber INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentNumber INT = @1stnumber;

    WHILE @CurrentNumber <= @2ndnumber
    BEGIN
        -- multiply and display the result
        DECLARE @Result INT = @CurrentNumber * @1stnumber;
        PRINT CONCAT(@1stnumber, ' * ', @CurrentNumber, ' = ', @Result);
        SET @CurrentNumber = @CurrentNumber + 1;
    END;
END;

EXEC multiply @1stnumber = 3, @2ndnumber = 7;