-- 저장 프로시저

-- 프로시저 생성 
create procedure usp_users
AS
	SELECT userID, userName FROM userTBL
go

-- 프로시저 수정
ALTER procedure usp_users
AS
	SELECT userID, userName FROM userTBL
go

-- 프로시저 생성 또는 수정을 동시에(제일 많이씀)
create or ALTER procedure usp_users
AS
	SELECT userID, userName FROM userTBL
go


-- 프로시저 불러오기
EXEC usp_users;

------------------------------------------------------------------------------

use sqlDB;
go

create or alter procedure usp_buyproduct
	@userID char(8)
as
	SELECT num, userID, prodName, price * amount as '구매금액'
	  FROM buytbl
	 where userID = @userID;

go

exec usp_buyproduct 'BBK'
exec usp_buyproduct 'JYP'


------------------------------------------------------------------------------

