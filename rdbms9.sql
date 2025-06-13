/* To create table */
CREATE TABLE population (
   NID INT PRIMARY KEY,
   Name nvarchar(10),
   Date_of_Birth nvarchar(20)
    );
 insert into population values(100003,'suka','1 oct 2002');
CREATE TABLE dead_people (
   NID INT PRIMARY KEY,
   Name nvarchar(10),
   Date_of_dead nvarchar(20)
   );
insert into dead_people values(100003,'suka','2 oct 2017');
CREATE TABLE Birth_people(
   NID INT PRIMARY KEY,
   Name nvarchar(10),
   Date_of_Birth nvarchar(20)
   );
insert into Birth_people values(100001,'hir','2 May 2000');


/* To create trigger on birth table */
create  trigger Birth_people_trigger on Birth_people
after insert
as
begin
   declare @NID INT 
   declare @Name nvarchar(10)
   declare @Date_of_Birth nvarchar(20)
 

select @NID = Birth_people.NID from INSERTED Birth_people
select @Name = Birth_people.Name from INSERTED Birth_people
select @Date_of_Birth = Birth_people.Date_of_Birth from INSERTED Birth_people


insert into population(NID, Name, Date_of_Birth) values(@NID, @Name, @Date_of_Birth)
end



/* To create trigger on dead table */
create  trigger dead_people_trigger on dead_people
after insert
as
begin
   declare @NID int
   select @NID = dead_people.NID from INSERTED dead_people
   delete from population where NID=@NID;
end



/* To check table data */
select * from dead_people;
select * from Birth_people;
select * from population;


/* To check trigger */
insert into Birth_people values(,'','');
insert into Birth_people values(,'','');

insert into dead_people values(,'','');