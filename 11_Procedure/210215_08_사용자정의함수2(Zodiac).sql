use sqlDB;
go

create or alter function ufn_getZodiac(@birthYear int)
returns nchar(3)
as
	begin
		declare @result nchar(3);

		set @result =
			case
				when (@birthYear % 12 = 0) then '������'
				when (@birthYear % 12 = 1) then '��'
				when (@birthYear % 12 = 2) then '��'
				when (@birthYear % 12 = 3) then '����'
				when (@birthYear % 12 = 4) then '��'
				when (@birthYear % 12 = 5) then '��'
				when (@birthYear % 12 = 6) then 'ȣ����'
				when (@birthYear % 12 = 7) then '�䳢'
				when (@birthYear % 12 = 8) then '��'
				when (@birthYear % 12 = 9) then '��'
				when (@birthYear % 12 = 10) then '��'
				else '��'
			end;
		return @result;
	end
go



-- ����� ���� �Լ� ���
select *, 
	  dbo.ufn_getAge(birthYear) as ����,
	  dbo.ufn_getZodiac(birthYear) as ��
  from userTBL


-- ����� ���� �Լ� ��� ����(�������� case���� �����;���)
  select *, 
	  dbo.ufn_getAge(birthYear) as ����,
			case
				when (birthYear % 12 = 0) then '������'
				when (birthYear % 12 = 1) then '��'
				when (birthYear % 12 = 2) then '��'
				when (birthYear % 12 = 3) then '����'
				when (birthYear % 12 = 4) then '��'
				when (birthYear % 12 = 5) then '��'
				when (birthYear % 12 = 6) then 'ȣ����'
				when (birthYear % 12 = 7) then '�䳢'
				when (birthYear % 12 = 8) then '��'
				when (birthYear % 12 = 9) then '��'
				when (birthYear % 12 = 10) then '��'
				else '��'
			end as ��
  from userTBL