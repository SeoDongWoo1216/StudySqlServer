USE [sqlDB]
GO


-- rollback을 넣어주면 데이터가 안들어간다. (Commit으로 바꾸면 들어감)
/*
BEGIN TRAN
INSERT INTO [dbo].[userTbl]
           ([userID]
           ,[username]
           ,[birthYear]
           ,[addr]
           ,[mobile1]
           ,[mobile2]
           ,[height]
           ,[mDate])
     VALUES
           ('LSK'
           ,'이승구'
           ,1982
           ,'뉴욕'
           ,'010'
           ,'90909090'
           ,181
           ,getdate())
COMMIT
*/


-- BEGIN TRY와 begin catch로 오류가 발생했을때는 데이터 변경이 아예 되지않도록 해줄수도있다.
-- 오류가 발생하지않으면 그대로 데이터의 변경이 일어난다.
-- 데이터의 무결성에의해서 오류났을때의 IDENTITY도 늘어난다.
BEGIN TRY
	BEGIN TRAN
	INSERT INTO [dbo].[userTbl]
			   ([userID]
			   ,[username]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('KGD'
			   ,'권지용'
			   ,1988
			   ,'서울'
			   ,'010'
			   ,'98989898'
			   ,175
			   ,getdate())

	INSERT INTO [dbo].[buytbl]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   (
			   'KGD'
			   ,'선글라스'
			   ,''
			   ,800000000
			   ,1
			   )
	Commit
END try
begin catch
	rollback
end catch




