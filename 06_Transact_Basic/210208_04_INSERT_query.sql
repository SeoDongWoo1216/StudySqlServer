-- TestTBL insert
use sqlDB
go

-- DML 중 SELECT
select * from TestTbl1

-- DML 중 INSERT
INSERT INTO TestTbl1					  VALUES(1,'홍길동',15); -- 필드를 명시하지않으면 전부 써야함
INSERT INTO TestTbl1 (id, userName)		  VALUES(2,'설현');      -- 필드를 명시했으면 명시한 값만 넣어야함
INSERT INTO TestTbl1 (userName, age, id)  VALUES('초아',17, 3);  -- 순서대로 안적어도되지만 VALUES에도 순서에 맞춰 나열해야함
INSERT INTO TestTbl1					  VALUES('홍길동',15);	 -- 에러(열 개수와 맞춰야함)
INSERT INTO TestTbl1 (age, userName)      VALUES(15, '홍길동');  -- 에러(기본키 없음)		


-- IDENTITY 추가했을때  => id가 저절로 1씩 증가해서 저장된다
INSERT INTO Testtbl1 values('성시경', 44);

-- 현재 테이블의 IDENTITY값이 얼마인지 출력
select IDENT_CURRENT('testTbl1');
SELECT @@IDENTITY;


-- sale.order_items 테이블 복사
CREATE TABLE [sales_order_items](
			 [order_id] [int] NOT NULL,
			 [item_id] [int] NOT NULL,
			 [product_id] [int] NOT NULL,
			 [quantity] [int] NOT NULL,
			 [list_price] [decimal](10, 2) NOT NULL,
			 [discount] [decimal](4, 2) NOT NULL
			 )

--  BikeStores.sales.order_items에 있는 데이터 복사하고 삽입
INSERT INTO sales_order_items
select * FROM BikeStores.sales.order_items;

-- SELECT INTO와 INSERT INTO SELECT FROM 이랑 구분해야함.





SELECT * FROM testtbl1;

-- DML 중 update
update testTbl1
   set age  = 30, userName = '성수경'
   WHERE id = '4'
-- 조건없으면 모든 데이터가 바뀌기때문에 꼭!!!! WHERE을 해야한다.


-- DML 중 DELETE
DELETE from testTbl1
 WHERE id = 9
-- 이거도 조건없으면 모든 데이터가 삭제되기때문에 꼭 WHERE을 해야함.


