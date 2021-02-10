-- �� ����

use sqlDB
go

-- �� ����
create view uv_buytbl
as
	select * from buytbl where groupName = '����';
go


-- ���� �� ��ȸ
select * from uv_buytbl;


-- �信�� delete�� ��������. '0�� ���� ������ ����.' �� �߸鼭 �������� �ʴ´�.
delete from uv_buytbl


-- Ʈ������� ���� �����͸� ���� �� �ִ�. �׷��� �� ��Ȳ��
-- �����͸� �߸������ ��Ȳ�̹Ƿ� rollback�� �������.(������ �Ŀ� �������ִ� ����)
begin tran; -- Ʈ�����

delete from uv_buytbl

rollback;   -- ������ ����



-- �����͵� ���� �� �ִ�.
insert into uv_buytbl values('kkh', '��Ÿ', '�Ǳ�', '4000', 1);



-- ������ ���� ������ �ȸ°ԉ������� ���� �� ����.(�並 �����ٰ� �Ʒ� ������ �ٽ� �����غ���)
create view uv_buytbl
as
	select num, prodName, groupName from buytbl where groupName = '����';
go

-- ���� ������ �ٸ��⶧���� ���� ���� �� ����.
insert into uv_buytbl values('kkh', '��Ÿ', '�Ǳ�', '4000', 1);


