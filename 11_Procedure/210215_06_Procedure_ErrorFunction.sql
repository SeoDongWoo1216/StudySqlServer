use sqlDB;
go

create or alter procedure usp_error
	@userID char(8),
	@userName nvarchar(10),
	@birthYear int = 1900,
	@addr nchar(2) = '서울',
	@mobile1 char(3) = Null,
	@mobile2 char(8) = Null,
	@height smallint = 170,
	@mDate date = '2021-02-15'
AS
	DECLARE @err INT;
	begin try
		begin tran	
			INSERT INTO userTbl VALUES( @userID, @userName, @birthYear, @addr, @mobile1, @mobile2, @height, @mDate)
		commit

	end try
	begin catch
		select @err = error_number();
		rollback;
	end catch

	if @err != 0
	begin
		print '###' + @userName + '을(를) INSERT에 실패했습니다.'
	end

	print concat('에러 번호 : ', @err); -- 오류번호 돌려줌.
go


declare @errNum INT;
EXEC usp_error 'WDT', '우당탕', 1988, '부산', '019', '99990024', 190, '2021-02-14'

EXEC usp_error 'WDD', '우당당'
SELECT * from userTbl
