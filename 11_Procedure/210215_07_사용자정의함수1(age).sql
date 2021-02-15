-- ��Į�� ����� ���� �Լ�(���� ���ϱ�)
/*
use sqlDB
go

create or alter function ufn_getAge
(
	@birthYear int
)
returns int
as
	begin
		declare @age int;
		set @age = (year(getdate()) - @birthYear) + 1;
		return @age;
	end
go
*/

-- ����� ���� �Լ��� ��� ���� ��
select *, year(getdate()) - birthYear + 1 as ����
  from usertbl
 

-- ����� ���� �Լ� ���
select *, dbo.ufn_getAge(birthYear) as ����
  from userTBL

