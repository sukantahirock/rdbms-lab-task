select * from niup;
insert into niup values(1,'aa',20);



CREATE TRIGGER prevent1
ON niup
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    THROW 50001, 'Insert, Update, and Delete operations are not allowed on this table!!!!', 16;
END;

update niup set name='bb' where id=1;
delete niup where id=1;