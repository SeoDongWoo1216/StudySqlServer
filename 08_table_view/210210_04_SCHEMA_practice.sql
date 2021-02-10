use schemaDB;
go

create table users.userTBL(id int not null);
go
create table sales.buyTbl (id int not null);
go
create table sales.prodTBL (pid int);
go
create table normalTBL (nid int not null);
go

select * from users.userTBL;
select * from sales.buyTbl;
select * from dbo.normalTBL;

