Create database Exercise14Database
use Exercise14Database

create table Products
( PId int primary key identity(1000,1),
PName nvarchar(50) not null,
PPrice float,
PTax as PPrice * 0.10 persisted,
PCompany nvarchar(50) check (PCompany in ('Samsung', 'Apple', 'HTC', 'Realme')),
PQty int default 1)
insert into Products(PName,PPrice, PCompany, PQty) values  ('S23', 120000.50, 'Samsung', 2)
insert into Products(PName,PPrice, PCompany) values  ('Note 23', 150000.50, 'Samsung')
insert into Products(PName,PPrice, PCompany, PQty) values  ('Narzo14', 12000.50, 'Realme', 2)
insert into Products(PName,PPrice, PCompany) values  ('X20', 30000.50, 'Realme')
insert into Products(PName,PPrice, PCompany, PQty) values  ('Huawei 12', 100000.50, 'HTC', 2)
insert into Products(PName,PPrice, PCompany) values  ('Huawei 14', 110000.50, 'HTC')
insert into Products(PName,PPrice, PCompany, PQty) values  ('Iphone14 pro', 140000.50, 'Apple', 2)
insert into Products(PName,PPrice, PCompany) values  ('Macbook Pro', 220000.50, 'Apple')
insert into Products(PName,PPrice, PCompany, PQty) values  ('Iphone SE', 25000.50, 'Apple', 2)
insert into Products(PName,PPrice, PCompany) values  ('IPad', 130000.50, 'Apple')


--1.Display details
Alter proc diplayDetails
with encryption
as
begin
select PId, PName, PPrice + PTax as 'PPrice with Tax', PCompany, PQty * (PPrice + PTax) as 'TotalPrice'
from Products
end;
execute diplayDetails

--2.Total Tax 
create proc GetTotalTax
@pc nvarchar(50),
@tTax float out
with encryption
as
begin 
select @tTax = sum(PTax) from Products where PCompany = @pc
end
declare @TotalTax float
execute GetTotalTax 'Samsung', @TotalTax out
print @TotalTax