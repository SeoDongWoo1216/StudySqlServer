-- DB ������ ��� : DECLARE�� ������ ������ ���� �Ŀ� ��� ������Ƿ�, �� ���徿 ���� �����ϸ� ������ �߻���.
use sqlDB;
DECLARE @myVar1 INT;
DECLARE @myVar2 SMALLINT;
DECLARE @myVar3 DECIMAL(5,2);
DECLARE @myVar4 NCHAR(20);

SET @myVar1 = 154287894;
SET @myVar2 = 32085;
SET @myVar3 = 4.25;
SET @myVar4 = '���� �̸� ==>';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;
SELECT @myVar4, userName AS 'Ű�� 180�̻��� ���' FROM userTbl WHERE height > 180;