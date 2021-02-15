use sqlDB
go
-- output의 쓰임새에대해 주목

create or alter procedure plusNew
	@p1 int,  -- 입력 파라미터1
	@p2 int,  -- 입력 파라미터2
	@pout int output  -- 출력(리턴) 파라미터
as
	select @pout = @p1 + @p2;
go

DECLARE @newResult int;
SET @newResult = 2;
exec plusNew 3, 4, @newResult output

print concat('PlusNew(3,4) = ', @newResult);