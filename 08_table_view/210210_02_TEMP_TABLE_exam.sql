-- 임시테이블
-- 쿼리실행하고 DB 연결 끊었다가 다시 실행하면 임시테이블이 사라져있다.

use tableDB
go

create table #temptbl (id int, txt nvarchar(10));
create table ##temptbl (id int, txt nvarchar(10));
go

insert into #tempTBL VALUES (1, '지역임시테이블');
insert into ##tempTBL VALUES (2, '전역임시테이블');
go

SELECT * FROM #temptbl
SELECT * FROM ##temptbl
