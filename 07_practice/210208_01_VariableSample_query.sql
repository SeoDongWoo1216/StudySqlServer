-- DB 변수의 사용 : DECLARE로 선언한 변수는 실행 후에 즉시 사라지므로, 한 문장씩 따로 실행하면 오류가 발생함.
use sqlDB;
DECLARE @myVar1 INT;
DECLARE @myVar2 SMALLINT;
DECLARE @myVar3 DECIMAL(5,2);
DECLARE @myVar4 NCHAR(20);

SET @myVar1 = 154287894;
SET @myVar2 = 32085;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름 ==>';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;
SELECT @myVar4, userName AS '키가 180이상인 사람' FROM userTbl WHERE height > 180;