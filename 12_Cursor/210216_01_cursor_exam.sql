use sqldB;
go
/*
-- global�� ���������� ���ڴٴ� ����
Declare cur_userTbl cursor global 
	for select height from userTbl

open cur_userTbl

declare @height smallint;      -- ȸ���� Ű��� ����
declare @cnt int = 0;          -- ȸ����(���� ���)
declare @totalheight int = 0;  -- ȸ�� Ű�� �հ� ����

fetch next from cur_usertbl into @height;  -- Ŀ���� �о @height ������ �Ҵ�

-- �ݺ��� ����
while @@FETCH_STATUS = 0
begin 
	set @cnt +=1;
	set @totalheight += @height
	fetch next from cur_usertbl into @height;
end

print concat('ȸ�� Ű ��� = ', @totalheight / @cnt);
close cur_usertbl;
deallocate cur_usertbl
*/

------------------------------------------------------------------------------------

-- global�� ���������� ���ڴٴ� ����
Declare cur_userTbl cursor global 
	for select username, height from userTbl

open cur_userTbl

declare @userName nchar(8);    -- ȸ�� �̸�
declare @height smallint;      -- ȸ���� Ű��� ����
declare @cnt int = 0;          -- ȸ����(���� ���)
declare @totalheight int = 0;  -- ȸ�� Ű�� �հ� ����

fetch next from cur_usertbl into @userName, @height;  -- Ŀ���� �о @height ������ �Ҵ�

-- �ݺ��� ����
while @@FETCH_STATUS = 0
begin 
	set @cnt +=1;
	set @totalheight += @height
	print concat('ȸ�� : ', @userName, ' Ű: ', @height);
	fetch next from cur_usertbl into @userName, @height;
end

print concat('ȸ�� Ű ��� = ', @totalheight / @cnt);
close cur_usertbl;
deallocate cur_usertbl
