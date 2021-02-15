-- Ʈ������� ����ؾ��ϴ� ����
use tempdb
go

-- �������̺� ����
CREATE TABLE bankbook
( 
	uName NVARCHAR(10),
	uMoney INT,
	CONSTRAINT CK_MONEY CHECK(uMoney >= 0)
);

GO

INSERT INTO bankBook VALUES (N'������', 1000);
INSERT INTO bankBook VALUES (N'�Ǹ���', 0);


-------------------------------------------------------------------------------------

-- �����ڰ� �Ǹ��ڿ��� 500�� �۱�
UPDATE bankbook SET uMoney = uMoney - 500 WHERE uName = '������';
UPDATE bankbook SET uMoney = uMoney + 500 WHERe uName = '�Ǹ���';


-- ���� ������ �Ʒ��� ���� �ڵ����� �����Ǿ� ����Ǿ��ִ�.(BEGIN TRAN�� ����X)
BEGIN TRAN
	UPDATE bankbook SET umoney = umoney - 500 WHERE uNAme = '������';
COMMIT TRAN

BEGIN TRAN
	UPDATE bankbook SET umoney = umoney + 500 WHERE uNAme = '�Ǹ���';
COMMIT TRAN

-------------------------------------------------------------------------------------

-- �̹����� �����ڰ� �Ǹ��ڿ��� 600���� �۱��غ���.
UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '������';
UPDATE bankbook SET uMoney = uMoney + 600 WHERe uName = '�Ǹ���';

SELECT * FROM bankBook
/*
 ���� UPDATE������ 500���� �ְ�ް��� �Ŀ�, �ٽ� 600���� �ְ�������� CHECK ���������� �浹�ߴٰ� ������ ���.
 SELECT������ bankbook�� ��������� �������� �ܾ��� �״���ε� �Ǹ����� �ܾ��� 600���� ��������.
 �̴� ���࿡���� ��������̴�.
*/

-- ������ �Ʒ��� ����.(BEGIN TRAN�� ����X)

BEGIN TRAN -- 1�� Ʈ�����
	UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '������';
	-- ������ �߻����� ���� X(���� Ʈ������� 1�� Ʈ����ǿ� �ѹ��� �Ͼ ������ �����)
COMMIT TRAN

BEGIN TRAN -- 2�� Ʈ�����
	UPDATE bankbook SET uMoney = uMoney + 600 WHERE uName = '�Ǹ���';
	-- ���������� �����
COMMIT TRAN

-- �������� ���忡�� ���� ������ �ʾ����Ƿ�, �Ǹ����� ���忡�� �Ա��� �����ʾƾ��Ѵ�.
-- �׷��� 1�� Ʈ����ǰ� 2�� Ʈ������� ���� ������� ���������� ����ǹǷ� �̷��� ������ ������ �߻��� ���̴�.


-------------------------------------------------------------------------------------

-- �̷��� ���, �� ���� UPDATE�� �ϳ��� Ʈ��������� �����־���Ѵ�.

-- �ϴ� �Ǹ����� ���¸� ������� ������.
UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '�Ǹ���';

-- �� UPDATE���� ��� �����غ���.
BEGIN TRAN
	UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '������';
	UPDATE bankbook SET uMoney = uMoney + 600 WHERe uName = '�Ǹ���';
COMMIT TRAN

SELECT * FROM bankbook

-- �� ������ �߻��ߴ�.
-- ù��° UPDATE������ ������ �߻������Ƿ� ��ü�� �ѹ�Ǿ �Ǹ����� ���忡�� 500���� �־���ϴµ� �Ǹ��ڿ��� 600���� �ԱݵǾ���.

/*
�� ������ �ڡڡ� ��������(���⼭�� CHECK)�� ���� ������ �ѹ���� �ʱ� �����̴�. �ڡڡ�
�׷��Ƿ�, ���� ������ ���� �߻��ÿ��� ������ �ѹ� ��������Ѵ�.
��, ù��° UPDATE���� ������ ���¿��� 600���� ������, ������ �߻��Ǿ� �� �ุ ����ȵȰ��̰�, �ѹ��� ����Ȱ��� �ƴϴ�.
*/

-------------------------------------------------------------------------------------

-- �켱, �ٽ� �Ǹ����� �ܾ��� ����ġ�� ������.
UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '�Ǹ���';

-- Try ~ catch ���� ����غ���.

BEGIN TRY
	BEGIN TRAN
		UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '������';
		UPDATE bankbook SET uMoney = uMoney + 600 WHERe uName = '�Ǹ���';
	COMMIT TRAN
END TRY

BEGIN CATCH
	ROLLBACK TRAN
ENd CATCH

SELECT * FROM bankbook

-- ù��° UPDATE���� ������ �߻��Ǿ����Ƿ� CATCH�� ROLLBACK TRAN�� ����Ǿ ��ü Ʈ������� �ѹ�ȴ�.
-- ���� ������ �߻��ϴ��� �ѹ�Ǿ ������� �ٲ����ʴ´�.(= �츮�� ���ϴ� ���)




