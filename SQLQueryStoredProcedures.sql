create database Day14Db
use Day14Db
create table Emps
(Id int primary key,
Fname nvarchar (50),
Lname nvarchar(50),
Salary float,
DOJ date )
insert into Emps values (1,'Sam','Dicosta',98000.5,'12/23/2019')
insert into Emps values (2,'Raj','Kumar',98000.5,'12/09/2021')
insert into Emps values (3,'Ravi','Garg',58000.5,'11/23/2020')

create procedure usp_sEmps
as
begin
select * from Emps
end
execute usp_sEmps

create proc usp_searchEmp
@id int
as
begin
select * FROM Emps where Id=@id
end

execute usp_searchEmp 1

--insert procedure
create proc usp_insertEmp
@id int,
@fn nvarchar(50),
@ln nvarchar(50),
@sal float,
@doj date
as begin
insert into Emps(Id,Fname,Lname,Salary,DOJ) values (@id,@fn,@ln,@sal,@doj)
if(@@ROWCOUNT>=1)
print 'Record Inserted'
end
execute usp_insertEmp 13,'Aman','Gupta',76000,'12/12/2021'
execute usp_sEmps

create procedure usp_updateEmp
@id int,
@fn nvarchar(50),
@ln nvarchar(50),
@sal float,
@doj date
as
begin
update Emps
set
Id=@id,
fname=@fn,
lname=@ln,
Salary=@sal,
DOJ=@doj
where
Id=@id;
end;
execute usp_updateEmp 14,'Priya','Singh',95000,'12/11/2020'
execute usp_sEmps

create proc usp_DeleteEmp
@id int
as begin 
delete from Emps
where Id=@id
if(@@ROWCOUNT>=1)
print 'Record Deleted'
end
execute usp_DeleteEmp 1
execute usp_sEmps

--default parameter
alter proc usp_searchEmp
@id int=2
as begin
select * from Emps where Id=@id
end
execute usp_searchEmp 2
