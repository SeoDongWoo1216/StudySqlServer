-- �ӽ����̺�
-- ���������ϰ� DB ���� �����ٰ� �ٽ� �����ϸ� �ӽ����̺��� ������ִ�.

use tableDB
go

create table #temptbl (id int, txt nvarchar(10));
create table ##temptbl (id int, txt nvarchar(10));
go

insert into #tempTBL VALUES (1, '�����ӽ����̺�');
insert into ##tempTBL VALUES (2, '�����ӽ����̺�');
go

SELECT * FROM #temptbl
SELECT * FROM ##temptbl
