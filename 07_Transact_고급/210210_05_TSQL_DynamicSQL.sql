-- exec
/*use sqlDB
go

declare @sql varchar(100);
set @sql = 'select * from usertbl where userid = ''EJW''; ';
exec (@sql);
*/
--------------------------------------------------------
-- exec 예제

declare @curDate  date;
declare @curyear  varchar(4);
declare @curMonth varchar(2);
declare @curDay   varchar(2);

declare @sql varchar(2000);

set @curDate  = getDate();
set @curyear  = year(@curDate);
set @curMonth = month(@curDate);
set @curDay   = day(@curDate);

print format(@curdate, 'yyyy-MM-dd'); -- 제일 쉬운거

print concat(@curYear, '년');

print concat(@curMonth, '월');
print concat(replicate('0', 2 - len(@curmonth)) + @curmonth, '월');
print concat(right(('00' + @curMonth), 2), '월');

print concat(@curDay, '일');

set @sql = 'CREATE TABLE backup_' + format(@curdate, 'yyyy_MM_dd') ;  -- 테이블명은 '-'가 안들어가서 '_'로 대체
set @sql += '(id int not null primary key, bName nvarchar(100) not null); ';
print @sql
exec(@sql)