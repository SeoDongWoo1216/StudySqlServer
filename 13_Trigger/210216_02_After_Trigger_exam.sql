use sqlDB;
go

create trigger trg_backupUserTbl  -- Ʈ���� ����
on userTbl						  -- Ʈ���� ������ ���̺��

after update, delete			  -- update, delete�Ҷ� Ʈ���� �߻�
as
	declare @modType nchar(2);

	if (COLUMNS_UPDATED() > 0) -- ������Ʈ
		begin
			set @modType = '����';
		end
	else -- ����Ʈ
		begin
			set @modType = '����';
		end

	insert into backup_userTbl
		SELECT [userID],[username],[birthYear],[addr],[mobile1],[mobile2],
			   [height],[mDate],@modType,getdate(),user_name()
		  FROM deleted;

go


