use sqlDB
go

create trigger trg_testtbl
on testtbl 
after insert, delete, update -- 삭제, 수정할때 트리거 발생
as
	print '새 트리거 발생'

insert into testtbl VALUES ('BTS');
SELECT * FROM testTbl where txt = '마마무';
update testTbl set txt = '마마무뉴!' where id = 4
delete testTbl where id = 3