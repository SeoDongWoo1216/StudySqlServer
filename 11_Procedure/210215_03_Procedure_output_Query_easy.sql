use sqlDB
go
-- output�� ���ӻ������� �ָ�

create or alter procedure plusNew
	@p1 int,  -- �Է� �Ķ����1
	@p2 int,  -- �Է� �Ķ����2
	@pout int output  -- ���(����) �Ķ����
as
	select @pout = @p1 + @p2;
go

DECLARE @newResult int;
SET @newResult = 2;
exec plusNew 3, 4, @newResult output

print concat('PlusNew(3,4) = ', @newResult);