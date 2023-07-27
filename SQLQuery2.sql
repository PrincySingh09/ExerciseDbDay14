use Day14Db
select * from Emps
exec usp_insertEmp 1, 'Rohan','K',87000,'11/11/2019'
exec usp_insertEmp 14, 'Rohit','A',85000,'12/11/2019'
exec usp_insertEmp 12, 'Sohan','B',82000,'11/12/2018'

select max(Salary) 'Max' from Emps
select min(Salary) 'Min' from Emps
select avg(Salary) 'Avg' from Emps
select sum(Salary) 'Sum' from Emps

create proc usp_GetMaxSal
@maxSal float out
as
begin
select @maxSal=max(Salary) from Emps
end
declare @mSalary float
execute usp_GetMaxSal @mSalary out
print @mSalary
exec usp_deleteEmp 12

--Built in stored procedure
execute sp_tables
execute sp_server_info
execute sp_helptext usp_deleteEmp
execute sp_helptext usp_GetMaxSal

alter proc usp_deleteEmp
@id int
with encryption
as begin
delete from Emps where Id=@id
if(@@ROWCOUNT>=1)
print 'Record Deleted'
end
execute sp_helptext usp_deleteEmp

--nested procedure example
create proc usp_nestPro
as begin
declare @mSalary float
execute usp_GetMaxSal @mSalary out
print @mSalary
end
exec usp_nestPro
