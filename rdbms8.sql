/* To create table */

create table student
( 
Id nvarchar(10) primary key,
Name nvarchar(20),
Nickname nvarchar(10),
Department nvarchar(10),
Balance nvarchar(10),
CGPA nvarchar(10),
Gmail nvarchar(30),
Address nvarchar(30),
Phone nvarchar(15),
Fathers_name nvarchar(20)
);


create table stu_table1
( 
Id nvarchar(10) primary key,
Name nvarchar(20),
Nickname nvarchar(10),
Department nvarchar(10),

);


create table stu_table2
( 
Id nvarchar(10) primary key,
Balance nvarchar(10),
CGPA nvarchar(10),
Gmail nvarchar(30),

);


create table stu_table3
( 
Id nvarchar(10) primary key,
Address nvarchar(30),
Phone nvarchar(15),
Fathers_name nvarchar(20)
);


/* To Create the trigger */

CREATE TRIGGER InsertData
ON student
AFTER INSERT
AS
BEGIN
    declare @Id nvarchar(10)
    declare @Name nvarchar(20)
    declare @Nickname nvarchar(10)
    declare @Department nvarchar(10)
 declare @Balance nvarchar(10)
    declare @CGPA nvarchar(10)
    declare @Gmail nvarchar(30)
    declare @Address nvarchar(30)
   declare @Phone nvarchar(15)
   declare @Fathers_name nvarchar(20)

   select @Id = student.Id from INSERTED student
   select @Name = student.Name from INSERTED student
   select @Nickname = student.Nickname from INSERTED student
   select @Department = student.Department from INSERTED student
   select @Balance = student.Balance from INSERTED student
   select @CGPA = student.CGPA from INSERTED student
   select @Gmail = student.Gmail from INSERTED student
   select @Address = student.Address from INSERTED student
   select @Phone = student.Phone from INSERTED student
   select @Fathers_name = student.Fathers_name from INSERTED student
   
    INSERT INTO stu_table1 (Id, Name,Nickname ,Department ) values(@Id, @Name, @Nickname, @Department);
       
    INSERT INTO stu_table2 (Id, Balance,CGPA,Gmail) values(@Id, @Balance, @CGPA, @Gmail);
   
    INSERT INTO stu_table3 (Id, Address, Phone, Fathers_name) values(@Id, @Address, @Phone, @Fathers_name)
    
END



/* To check Trigger */
insert into student values ('1','suk','hirock','cse','5000',
'2.50','suk@gmail','Tangail','017000000','Hari');


/* To see table data */
select * from student;
select * from stu_table1;
select * from stu_table2;
select * from stu_table3;