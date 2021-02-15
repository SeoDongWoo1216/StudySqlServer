-- 트랜잭션을 사용해야하는 이유
use tempdb
go

-- 통장테이블 생성
CREATE TABLE bankbook
( 
	uName NVARCHAR(10),
	uMoney INT,
	CONSTRAINT CK_MONEY CHECK(uMoney >= 0)
);

GO

INSERT INTO bankBook VALUES (N'구매자', 1000);
INSERT INTO bankBook VALUES (N'판매자', 0);


-------------------------------------------------------------------------------------

-- 구매자가 판매자에게 500원 송금
UPDATE bankbook SET uMoney = uMoney - 500 WHERE uName = '구매자';
UPDATE bankbook SET uMoney = uMoney + 500 WHERe uName = '판매자';


-- 위의 구문은 아래와 같이 자동으로 구성되어 실행되어있다.(BEGIN TRAN은 실행X)
BEGIN TRAN
	UPDATE bankbook SET umoney = umoney - 500 WHERE uNAme = '구매자';
COMMIT TRAN

BEGIN TRAN
	UPDATE bankbook SET umoney = umoney + 500 WHERE uNAme = '판매자';
COMMIT TRAN

-------------------------------------------------------------------------------------

-- 이번에는 구매자가 판매자에게 600원을 송금해보자.
UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '구매자';
UPDATE bankbook SET uMoney = uMoney + 600 WHERe uName = '판매자';

SELECT * FROM bankBook
/*
 위의 UPDATE문으로 500원을 주고받고한 후에, 다시 600원을 주고받으려니 CHECK 제약조건이 충돌했다고 오류가 뜬다.
 SELECT문으로 bankbook을 출력했을때 구매자의 잔액은 그대로인데 판매자의 잔액은 600원이 더해졌다.
 이는 은행에서는 대형사고이다.
*/

-- 이유는 아래와 같다.(BEGIN TRAN은 실행X)

BEGIN TRAN -- 1번 트랜잭션
	UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '구매자';
	-- 오류가 발생으로 수행 X(현재 트랜잭션인 1번 트랜잭션에 롤백이 일어날 것으로 예상됨)
COMMIT TRAN

BEGIN TRAN -- 2번 트랜잭션
	UPDATE bankbook SET uMoney = uMoney + 600 WHERE uName = '판매자';
	-- 정상적으로 수행됨
COMMIT TRAN

-- 구매자의 통장에서 돈이 빠지지 않았으므로, 판매자의 통장에도 입금이 되지않아야한다.
-- 그러나 1번 트랜잭션과 2번 트랜잭션은 서로 관계없이 독립적으로 수행되므로 이러한 논리적인 오류가 발생한 것이다.


-------------------------------------------------------------------------------------

-- 이러한 경우, 두 개의 UPDATE를 하나의 트랜잭션으로 묶어주어야한다.

-- 일단 판매자의 계좌를 원래대로 만들자.
UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '판매자';

-- 두 UPDATE문을 묶어서 실행해보자.
BEGIN TRAN
	UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '구매자';
	UPDATE bankbook SET uMoney = uMoney + 600 WHERe uName = '판매자';
COMMIT TRAN

SELECT * FROM bankbook

-- 또 오류가 발생했다.
-- 첫번째 UPDATE문에서 오류가 발생했으므로 전체가 롤백되어서 판매자의 통장에는 500원만 있어야하는데 판매자에게 600원이 입금되었다.

/*
그 이유는 ★★★ 제약조건(여기서는 CHECK)의 논리적 오류는 롤백되지 않기 때문이다. ★★★
그러므로, 제약 조건의 오류 발생시에는 강제로 롤백 시켜줘야한다.
즉, 첫번째 UPDATE에서 구매자 계좌에서 600원을 뺐을때, 오류가 발생되어 그 행만 실행안된것이고, 롤백이 수행된것은 아니다.
*/

-------------------------------------------------------------------------------------

-- 우선, 다시 판매자의 잔액을 원위치로 돌리자.
UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '판매자';

-- Try ~ catch 문을 사용해보자.

BEGIN TRY
	BEGIN TRAN
		UPDATE bankbook SET uMoney = uMoney - 600 WHERE uName = '구매자';
		UPDATE bankbook SET uMoney = uMoney + 600 WHERe uName = '판매자';
	COMMIT TRAN
END TRY

BEGIN CATCH
	ROLLBACK TRAN
ENd CATCH

SELECT * FROM bankbook

-- 첫번째 UPDATE에서 오류가 발생되었으므로 CATCH의 ROLLBACK TRAN이 실행되어서 전체 트랜잭션이 롤백된다.
-- 따라서 오류가 발생하더라도 롤백되어서 결과값이 바뀌지않는다.(= 우리가 원하던 결과)




