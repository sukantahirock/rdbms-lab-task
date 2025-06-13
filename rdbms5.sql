
select *from itstudent2;

CREATE PROCEDURE p
    @regno INT,
    @mark1 INT,
    @mark2 INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @total INT;
    SET @total = @mark1 + @mark2;
 IF NOT EXISTS (SELECT 1 FROM itstudent2 WHERE regno = @regno)
    BEGIN
        THROW 50001, 'First Insert this on table!!!!', 16;
    END
    ELSE
    BEGIN
        -- If the student already exists, update the total marks
        UPDATE itstudent2
        SET mark1 = @mark1, mark2 = @mark2, total = @total
        WHERE regno = @regno;
    END;
END;


EXEC p @regno = 1, @mark1 = 100, @mark2 = 85;

EXEC p @regno = 2, @mark1 = 20, @mark2 = 65;


CREATE PROCEDURE p1
    @regno INT
AS
BEGIN
    DECLARE @mark1 INT;
    DECLARE @mark2 INT;
    DECLARE @total INT;

    SELECT @mark1 = mark1, @mark2 = mark2
    FROM itstudent2
    WHERE regno = @regno;

    SET @total = @mark1 + @mark2;

    UPDATE itstudent2
    SET total = @total
    WHERE regno = @regno;
END;
EXEC p1 @regno = 1;

