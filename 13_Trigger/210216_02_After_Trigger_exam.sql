use sqlDB;
go

create trigger trg_backupUserTbl  -- 트리거 선언
on userTbl						  -- 트리거 선언할 테이블명

after update, delete			  -- update, delete할때 트리거 발생
as
	declare @modType nchar(2);

	if (COLUMNS_UPDATED() > 0) -- 업데이트
		begin
			set @modType = '수정';
		end
	else -- 딜리트
		begin
			set @modType = '삭제';
		end

	insert into backup_userTbl
		SELECT [userID],[username],[birthYear],[addr],[mobile1],[mobile2],
			   [height],[mDate],@modType,getdate(),user_name()
		  FROM deleted;

go


