use sqlDB
go

create or alter procedure usp_ifElse
	@userName nvarchar(10)
AS
	DECLARE @bYear INT				-- ����⵵�� ������ ����
	SELECT @bYear = birthYear		
	  FROM userTbl
	 WHERE userName = @userName;	

	 IF(@bYear >= 1980)
		 BEGIN
			Print '�����ʴϴ�'
		 END
	 ELSE
		 BEGIN
			print '�ľ����ϴ�'
		 ENd
	 Go

EXEC usp_ifElse '���ȣ'
	