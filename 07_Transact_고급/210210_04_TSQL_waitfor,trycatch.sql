-- waitfor
begin
	-- waitfor delay '00:00:03';
	-- print '3�� ������ ����';
	waitfor time '11:10:30';
	print '11:10:30�� ����';
end

-----------------------------------------------------------------------
-- TRY/CATCH
-- �⺻Ű�� ��ܼ� �ߺ��� ID�� �����Ϸ����Ҷ� ���� �޼��� ���
begin try
	insert into usertbl values('LSG', '�̻�', 1988, '����', NULL, NULL, 170, GETDATE())
	print '���� ����'
end try

begin catch
	print '���� ����, �����ڿ��� ���� ���'
end catch