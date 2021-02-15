use sqlDB
go

create or alter procedure usp_ifElse
	@userName nvarchar(10)
AS
	DECLARE @bYear INT				-- 출생년도를 저장할 변수
	SELECT @bYear = birthYear		
	  FROM userTbl
	 WHERE userName = @userName;	

	 IF(@bYear >= 1980)
		 BEGIN
			Print '젊으십니다'
		 END
	 ELSE
		 BEGIN
			print '늙었습니다'
		 ENd
	 Go

EXEC usp_ifElse '김경호'
	