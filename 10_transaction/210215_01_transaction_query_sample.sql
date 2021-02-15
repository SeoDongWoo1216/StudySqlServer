USE [sqlDB]
GO


-- rollback�� �־��ָ� �����Ͱ� �ȵ���. (Commit���� �ٲٸ� ��)
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
           ,'�̽±�'
           ,1982
           ,'����'
           ,'010'
           ,'90909090'
           ,181
           ,getdate())
COMMIT
*/


-- BEGIN TRY�� begin catch�� ������ �߻��������� ������ ������ �ƿ� �����ʵ��� ���ټ����ִ�.
-- ������ �߻����������� �״�� �������� ������ �Ͼ��.
-- �������� ���Ἲ�����ؼ� ������������ IDENTITY�� �þ��.
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
			   ,'������'
			   ,1988
			   ,'����'
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
			   ,'���۶�'
			   ,''
			   ,800000000
			   ,1
			   )
	Commit
END try
begin catch
	rollback
end catch




