-- TestTBL insert
use sqlDB
go

-- DML �� SELECT
select * from TestTbl1

-- DML �� INSERT
INSERT INTO TestTbl1					  VALUES(1,'ȫ�浿',15); -- �ʵ带 ������������� ���� �����
INSERT INTO TestTbl1 (id, userName)		  VALUES(2,'����');      -- �ʵ带 ��������� ����� ���� �־����
INSERT INTO TestTbl1 (userName, age, id)  VALUES('�ʾ�',17, 3);  -- ������� ����������� VALUES���� ������ ���� �����ؾ���
INSERT INTO TestTbl1					  VALUES('ȫ�浿',15);	 -- ����(�� ������ �������)
INSERT INTO TestTbl1 (age, userName)      VALUES(15, 'ȫ�浿');  -- ����(�⺻Ű ����)		


-- IDENTITY �߰�������  => id�� ������ 1�� �����ؼ� ����ȴ�
INSERT INTO Testtbl1 values('���ð�', 44);

-- ���� ���̺��� IDENTITY���� ������ ���
select IDENT_CURRENT('testTbl1');
SELECT @@IDENTITY;


-- sale.order_items ���̺� ����
CREATE TABLE [sales_order_items](
			 [order_id] [int] NOT NULL,
			 [item_id] [int] NOT NULL,
			 [product_id] [int] NOT NULL,
			 [quantity] [int] NOT NULL,
			 [list_price] [decimal](10, 2) NOT NULL,
			 [discount] [decimal](4, 2) NOT NULL
			 )

--  BikeStores.sales.order_items�� �ִ� ������ �����ϰ� ����
INSERT INTO sales_order_items
select * FROM BikeStores.sales.order_items;

-- SELECT INTO�� INSERT INTO SELECT FROM �̶� �����ؾ���.





SELECT * FROM testtbl1;

-- DML �� update
update testTbl1
   set age  = 30, userName = '������'
   WHERE id = '4'
-- ���Ǿ����� ��� �����Ͱ� �ٲ�⶧���� ��!!!! WHERE�� �ؾ��Ѵ�.


-- DML �� DELETE
DELETE from testTbl1
 WHERE id = 9
-- �̰ŵ� ���Ǿ����� ��� �����Ͱ� �����Ǳ⶧���� �� WHERE�� �ؾ���.


