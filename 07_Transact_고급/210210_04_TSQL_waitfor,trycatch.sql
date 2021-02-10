-- waitfor
begin
	-- waitfor delay '00:00:03';
	-- print '3초 멈춘후 실행';
	waitfor time '11:10:30';
	print '11:10:30에 실행';
end

-----------------------------------------------------------------------
-- TRY/CATCH
-- 기본키를 어겨서 중복된 ID를 저장하려고할때 오류 메세지 출력
begin try
	insert into usertbl values('LSG', '이상구', 1988, '서울', NULL, NULL, 170, GETDATE())
	print '저장 성공'
end try

begin catch
	print '저장 실패, 관리자에게 문의 요망'
end catch