USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 21-02-15-월 오후 2:11:25 ******/
CREATE or ALTER procedure usp_users4
	@txtValue nvarchar(10),
	@outValue int output   -- 리턴받는 매개변수

AS
	insert into testTbl values (@txtValue);
	select @outValue = IDENT_CURRENT('testTbl') -- testTbl의 현재 identity값 리턴
go


declare @myvalue int;
exec usp_users4 '테스트값 1', @myValue output;

print concat('현재 입력된 값은 ==> ', @myValue)
select @myValue
