-- �����Լ� : ���� �Ǵ� ����(���)�� �ű�� �Լ�

SELECT ROW_NUMBER() over(order by height asc) as 'Ű ������', userName, addr, height
from userTbl

SELECT ROW_NUMBER() over(order by height desc) as 'Ű ū��', userName, addr, height
from userTbl


-- �ٵ� Ű�� �Ȱ��� ������� ó��������Ѵ�.


-- Ű�� �Ȱ����� �Ȱ��� ������� �̸� �����������
SELECT ROW_NUMBER() over(order by height desc, username asc) as 'Ű ū��', userName, addr, height
from userTbl


-- ������ ���ֱ����� ���� 2�� ó��
SELECT RANK() over(order by height desc) as 'Ű ū��',        -- ���� 2�� ���� 4��
	   userName, addr, height
from userTbl

SELECT DENSE_RANK() over(order by height desc) as 'Ű ū��',  -- ���� 2�� ���� 3��
	   userName, addr, height
from userTbl


 -- ���� ���� ������ Ű ū �����ű��
SELECT RANK() over(partition by addr order by height desc) as 'Ű ū��', 
	   userName, addr, height
from userTbl
-- order by�� ������ �ű������ ����, partition by�� ������ �ű涧 ���


-----------------------------------------------------------------------------

-- �м� �Լ� : PASS

-----------------------------------------------------------------------------

-- PIVOT/UNPIVOT : �� ���� ���Ե� ���� ���� ����ϰ�, �̸� �������� ���� ��ȯ�Ͽ� ���̺� ��ȯ ���� ȸ���ϰ� �ʿ��ϸ� ������� ����
/*
PiVOT(�����Լ�(��)
  FOR ���ο� ���� ������ �� �̸�
  IN (�� ���) AS �ǹ� �̸�)
*/

-- PIVOT
/*
CREATE table pivotTBL
(
	userName nvarchar(10),
	season   nvarchar(2),
	amount   int,
);

insert into pivotTBL values ('�����', '�ܿ�', 10),
							('������', '����', 15),
							('�����', '����', 25),
							('�����', '��',    3),
							('�����', '��',   37),
							('������', '�ܿ�', 40),
							('�����', '����', 14),
							('�����', '�ܿ�', 22),
							('������', '����', 64);
go
*/

SELECT * FROM pivotTBL;

SELECT * FROM pivotTBL  -- ���η� ���̴� �����͸� ���η� �װ�����
  pivot(sum(amount)
      for season
      in([��],[����],[����],[�ܿ�])) as resultpivot;


-----------------------------------------------------------------------------
/*
JSON(JavaScript Object Notation) ������ ���� ����� �������α׷� ��� �����͸� 
��ȯ�ϱ� ���� ������ ǥ�� ������ ���ϴµ�, �Ӽ�(Key)�� ��(Value)�� ���� �̷�� �����Ǿ��ִ�.
*/

SELECT userID, userName, addr, height	
  from userTbl
  where height >= 180
  for json auto;


-----------------------------------------------------------------------------

