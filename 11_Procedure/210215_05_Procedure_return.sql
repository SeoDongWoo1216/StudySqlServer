use sqlDB;
go

create or alter proc usp_return
	@userName nvarchar(10)
as
	declare @userID char(8);
	 select @userID = userID
	   from userTBL
	  WHERE userName = @userName;

	 if(@userID <> '') return 1;
	 else				return 0;
go

declare @retVal int;
exec @retVal = usp_return 'ÀºÀÚ¿ø'
print @retVal