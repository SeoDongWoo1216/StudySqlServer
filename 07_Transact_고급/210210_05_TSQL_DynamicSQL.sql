-- exec
/*use sqlDB
go

declare @sql varchar(100);
set @sql = 'select * from usertbl where userid = ''EJW''; ';
exec (@sql);
*/
--------------------------------------------------------
-- exec ����

declare @curDate  date;
declare @curyear  varchar(4);
declare @curMonth varchar(2);
declare @curDay   varchar(2);

declare @sql varchar(2000);

set @curDate  = getDate();
set @curyear  = year(@curDate);
set @curMonth = month(@curDate);
set @curDay   = day(@curDate);

print format(@curdate, 'yyyy-MM-dd'); -- ���� �����

print concat(@curYear, '��');

print concat(@curMonth, '��');
print concat(replicate('0', 2 - len(@curmonth)) + @curmonth, '��');
print concat(right(('00' + @curMonth), 2), '��');

print concat(@curDay, '��');

set @sql = 'CREATE TABLE backup_' + format(@curdate, 'yyyy_MM_dd') ;  -- ���̺���� '-'�� �ȵ��� '_'�� ��ü
set @sql += '(id int not null primary key, bName nvarchar(100) not null); ';
print @sql
exec(@sql)