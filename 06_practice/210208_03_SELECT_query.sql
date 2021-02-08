use sqlDB;
go

-- �̸��� '���ȣ'�� ������ ��ȸ
SELECT * FROM userTbl
WHERE username = '���ȣ'


-- 1970�� ���� ����̰�, Ű 182 �̻��� �������� ���̵�, �̸� ��ȸ
SELECT userID, username, birthYear, height
  FROM userTbl
 WHERE birthYear >= 1970 AND height >= 182

 -- 1970�� ���� ����̰ų�, Ű 182 �̻��� �������� ���̵�, �̸� ��ȸ
 SELECT userID, username, birthYear, height
  FROM userTbl
 WHERE birthYear >= 1970 OR height >= 182


 -- Ű�� 180~183 ������ ����� ��ȸ
 SELECT userID, username, height
  FROM userTbl
 WHERE  height >= 180 and height <=183;

 -- �� ���ǹ��� between A and B �� ���
 SELECT userID, username, height
  FROM  userTbl
 WHERE  height between 180 and 183;


 -- ������ �泲, ����, ��� �� ������ ��ȸ
 SELECT userID, username, addr
  FROM  userTbl
 WHERE addr = '�泲' or addr = '����' or addr = '���';

 -- �� ���ǹ��� IN ���� ���
 SELECT userID, username, addr
  FROM  userTbl
 WHERE addr IN ('�泲', '����', '���');

 
 -- ���� '��'���� ��� ��ȸ(LIKE ���)  
 SELECT userID, username, addr
  FROM  userTbl
 WHERE username like '��%';  -- '%'�� �����̵� ����Ѵٴ� �ǹ��̴�.

 SELECT userID, username, addr
  FROM  userTbl
 WHERE username like '_����'; -- '_'�� �ƹ��ų� �� ���ڰ� �͵� �Ǵٴ� �ǹ�

 /*
  '%'�� ����ڰ��͵� �������, '_'�� �ƹ��ų� �� ���ڰ� �´ٴ� ��
  _��% �� ���� ���, �� �տ� �ƹ� �ѱ��ڰ� ����, �ι�°�� ��, ����°���ʹ� �����͵� ������ٴ� ��.
  ����, ������, ������ ���, �̿����༭ �����մϴ�. ������ ��밡��
  */


  -- SubQuery
SELECT username, height
 FROM  userTbl
WHERE  height > 177;


SELECT username, height
 FROM  userTbl
WHERE  height > 
		(SELECT height from userTbl where username = '���ȣ'); -- ���ȣ�� Ű(177)�� ����
	 -- (SELECT username, height from userTbl where username = '���ȣ');
	 -- �������������� WHERE�� �Ȱ��� ���� ���� ����ؾ��Ѵ�.

	 -- (SELECT height from userTbl where username = '��%');
	 -- ���� ���������� ���� �ΰ� �̻� ��ȯ�Ǹ� ����(�� �ϳ��� ��ȯ�Ǿ���Ѵ�)


-- �ǹ������� ���� ���� ��������� ����
-- any ���(�������� ��� �߿� �ϳ��� �����ص���)
SELECT username, height
 FROM  userTbl
WHERE  height >= any
		(SELECT height from userTbl where addr = '�泲');


-- all ���(���� ���� ��� �� ��� �������Ѿ��Ѵ�.)
SELECT username, height
 FROM  userTbl
WHERE  height >= all
		(SELECT height from userTbl where addr = '�泲');

-- IN ���( '= any' �� ����)
SELECT username, height
 FROM  userTbl
WHERE  height in
		(SELECT height from userTbl where addr = '�泲');

SELECT username, height
 FROM  userTbl
WHERE  height = any
		(SELECT height from userTbl where addr = '�泲');



-- ORDER BY ����(������� ���� ������ ��ġ���� ������. ����� ��µǴ� ������ ������ �� �ִ�)
SELECT username, mDate
  from userTbl
--ORDER BY mDate desc;  -- DESC ��������
  ORDER BY mDate asc;   -- asc ��������

  SELECT *
  from userTbl
  order by userID asc;

  -- distinct : �ߺ� ����
  SELECT distinct addr
  from userTbl

 -- TOP 
  SELECT TOP(5) * 
  from userTbl
  ORDER BY mDate desc;   -- asc �� ��������

  -- offset �ռ� ������ŭ �پ� ���� �� ��ȸ
  SELECT userID, username, birthYear
  FROM userTbl
  order by birthYear
  offset 4 rows

  -- SELECT INTO : ���̺��� �����ؼ� ���(PK, FK���� ���� ������ ��������� ����)
  SELECT * INTO buytbl2 from buytbl				    -- ���̺� ����
  SELECT userID, prodName INTO buytbl3 from buytbl  -- �Ϻ� ���� ������ ���� ����

  select * from buytbl2;

-- GROUP BY : �׷����� �����ִ� ������ ��. 
-- �״�� select���ϸ� ������ �����Ͱ� ���� ��µǴµ�, �����Լ����̿��� �� ����ϰ� ����� �� �ִ�.
 SELECT userID, amount
   FROM buytbl
 order by userID;

-- ������ ������ sum�� �̿��� ���(�����Լ��� ���ڸ� ����)
select userID, sum(amount) AS '���� �հ�'  -- AS [] �Ǵ� AS '' �� �� �̸��� ������ �� �ִ�.
from buytbl
group by userID;

-- min, max
select min(height) AS '�ּ�Ű'
 from userTbl

 select max(height) AS '�ִ�Ű'
 from userTbl

 -- �� 2���� ��ġ��
 select min(height) AS '�ּ�Ű',  max(height) AS '�ִ�Ű'
 from userTbl

 -- �ٸ� �÷��� �ֱ�(�����Լ� + �ٸ� �÷��� group by�� ����ؾ��Ѵ�.)
  select userID, userName, min(height) AS '�ּ�Ű',  max(height) AS '�ִ�Ű'
 from userTbl
 group by userID, userName
 -- �̷����ϸ� ���ϴ� ��ȸ�� ���������Ƿ� where�� ���� ���������� �̿��ؾ���

 -- �츮�� ���ϴ� ��¹�
 select userName, height
 from userTbl
 where height = (select min(height) from userTbl) 
	or height = (select max(height) from usertbl);

-- �� ������ ����(count)  -> �÷� ����
select count(*) as 'ȸ����' from userTbl;    -- 10
select count(*) as '���ų�����' from buytbl; -- 12


