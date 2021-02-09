-- 순위함수 : 순번 또는 순위(등수)를 매기는 함수

SELECT ROW_NUMBER() over(order by height asc) as '키 작은순', userName, addr, height
from userTbl

SELECT ROW_NUMBER() over(order by height desc) as '키 큰순', userName, addr, height
from userTbl


-- 근데 키가 똑같은 사람들을 처리해줘야한다.


-- 키는 똑같으면 똑같은 사람끼리 이름 오름차순출력
SELECT ROW_NUMBER() over(order by height desc, username asc) as '키 큰순', userName, addr, height
from userTbl


-- 분쟁을 없애기위해 공동 2위 처리
SELECT RANK() over(order by height desc) as '키 큰순',        -- 공동 2등 다음 4등
	   userName, addr, height
from userTbl

SELECT DENSE_RANK() over(order by height desc) as '키 큰순',  -- 공동 2등 다음 3등
	   userName, addr, height
from userTbl


 -- 같은 지역 내에서 키 큰 순위매기기
SELECT RANK() over(partition by addr order by height desc) as '키 큰순', 
	   userName, addr, height
from userTbl
-- order by는 순위를 매기기위한 기준, partition by은 구분을 매길때 사용


-----------------------------------------------------------------------------

-- 분석 함수 : PASS

-----------------------------------------------------------------------------

-- PIVOT/UNPIVOT : 한 열에 포함된 여러 값을 출력하고, 이를 여러가지 열로 반환하여 테이블 반환 식을 회전하고 필요하면 집계까지 수행
/*
PiVOT(집계함수(열)
  FOR 새로운 열로 변경할 열 이름
  IN (열 목록) AS 피벗 이름)
*/

-- PIVOT
/*
CREATE table pivotTBL
(
	userName nvarchar(10),
	season   nvarchar(2),
	amount   int,
);

insert into pivotTBL values ('김범수', '겨울', 10),
							('윤종신', '여름', 15),
							('김범수', '가을', 25),
							('김범수', '봄',    3),
							('김범수', '봄',   37),
							('윤종신', '겨울', 40),
							('김범수', '여름', 14),
							('김범수', '겨울', 22),
							('윤종신', '여름', 64);
go
*/

SELECT * FROM pivotTBL;

SELECT * FROM pivotTBL  -- 세로로 쌓이는 데이터를 가로로 쌓게해줌
  pivot(sum(amount)
      for season
      in([봄],[여름],[가을],[겨울])) as resultpivot;


-----------------------------------------------------------------------------
/*
JSON(JavaScript Object Notation) 현대의 웹과 모바일 응용프로그램 등과 데이터를 
교환하기 위한 개방형 표준 포맷을 말하는데, 속성(Key)와 값(Value)로 쌍을 이루며 구성되어있다.
*/

SELECT userID, userName, addr, height	
  from userTbl
  where height >= 180
  for json auto;


-----------------------------------------------------------------------------

