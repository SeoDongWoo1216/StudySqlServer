use sqlDB
go

create trigger trg_testtbl
on testtbl 
after insert, delete, update -- ����, �����Ҷ� Ʈ���� �߻�
as
	print '�� Ʈ���� �߻�'

insert into testtbl VALUES ('BTS');
SELECT * FROM testTbl where txt = '������';
update testTbl set txt = '��������!' where id = 4
delete testTbl where id = 3