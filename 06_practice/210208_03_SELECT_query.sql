use sqlDB;
go

-- 이름이 '김경호'인 데이터 조회
SELECT * FROM userTbl
WHERE username = '김경호'


-- 1970년 이후 출생이고, 키 182 이상인 데이터의 아이디, 이름 조회
SELECT userID, username, birthYear, height
  FROM userTbl
 WHERE birthYear >= 1970 AND height >= 182

 -- 1970년 이후 출생이거나, 키 182 이상인 데이터의 아이디, 이름 조회
 SELECT userID, username, birthYear, height
  FROM userTbl
 WHERE birthYear >= 1970 OR height >= 182


 -- 키가 180~183 사이인 사람만 조회
 SELECT userID, username, height
  FROM userTbl
 WHERE  height >= 180 and height <=183;

 -- 위 조건문을 between A and B 로 사용
 SELECT userID, username, height
  FROM  userTbl
 WHERE  height between 180 and 183;


 -- 지역이 경남, 전남, 경북 인 데이터 조회
 SELECT userID, username, addr
  FROM  userTbl
 WHERE addr = '경남' or addr = '전남' or addr = '경북';

 -- 위 조건문을 IN 으로 사용
 SELECT userID, username, addr
  FROM  userTbl
 WHERE addr IN ('경남', '전남', '경북');

 
 -- 성이 '김'씨인 사람 조회(LIKE 사용)  
 SELECT userID, username, addr
  FROM  userTbl
 WHERE username like '김%';  -- '%'는 무엇이든 허용한다는 의미이다.

 SELECT userID, username, addr
  FROM  userTbl
 WHERE username like '_종신'; -- '_'는 아무거나 한 글자가 와도 되다는 의미

 /*
  '%'는 몇글자가와도 상관없고, '_'는 아무거나 한 글자가 온다는 뜻
  _용% 로 예를 들면, 맨 앞에 아무 한글자가 오고, 두번째는 용, 세번째부터는 뭐가와도 상관없다는 뜻.
  조용, 조용필, 조용한 사람, 이용해줘서 감사합니다. 등으로 사용가능
  */


  -- SubQuery
SELECT username, height
 FROM  userTbl
WHERE  height > 177;


SELECT username, height
 FROM  userTbl
WHERE  height > 
		(SELECT height from userTbl where username = '김경호'); -- 김경호와 키(177)가 같은
	 -- (SELECT username, height from userTbl where username = '김경호');
	 -- 서브쿼리에서는 WHERE와 똑같은 비교할 값만 사용해야한다.

	 -- (SELECT height from userTbl where username = '김%');
	 -- 서브 쿼리에서는 값이 두개 이상 반환되면 에러(딱 하나만 반환되어야한다)


-- 실무에서는 딱히 많이 사용하지는 않음
-- any 사용(서브쿼리 결과 중에 하나만 만족해도됨)
SELECT username, height
 FROM  userTbl
WHERE  height >= any
		(SELECT height from userTbl where addr = '경남');


-- all 사용(서브 쿼리 결과 중 모두 만족시켜야한다.)
SELECT username, height
 FROM  userTbl
WHERE  height >= all
		(SELECT height from userTbl where addr = '경남');

-- IN 사용( '= any' 와 같음)
SELECT username, height
 FROM  userTbl
WHERE  height in
		(SELECT height from userTbl where addr = '경남');

SELECT username, height
 FROM  userTbl
WHERE  height = any
		(SELECT height from userTbl where addr = '경남');



-- ORDER BY 정렬(결과물에 대해 영향을 미치지는 않지만. 결과가 출력되는 순서를 조절할 수 있다)
SELECT username, mDate
  from userTbl
--ORDER BY mDate desc;  -- DESC 내림차순
  ORDER BY mDate asc;   -- asc 오름차순

  SELECT *
  from userTbl
  order by userID asc;

  -- distinct : 중복 제거
  SELECT distinct addr
  from userTbl

 -- TOP 
  SELECT TOP(5) * 
  from userTbl
  ORDER BY mDate desc;   -- asc 는 오름차순

  -- offset 앞선 개수만큼 뛰어 넘은 후 조회
  SELECT userID, username, birthYear
  FROM userTbl
  order by birthYear
  offset 4 rows

  -- SELECT INTO : 테이블을 복사해서 사용(PK, FK등의 제약 조건은 복사되지는 않음)
  SELECT * INTO buytbl2 from buytbl				    -- 테이블 복사
  SELECT userID, prodName INTO buytbl3 from buytbl  -- 일부 열만 복사할 수도 있음

  select * from buytbl2;

-- GROUP BY : 그룹으로 묶어주는 역할을 함. 
-- 그대로 select를하면 구매한 데이터가 각각 출력되는데, 집계함수를이용해 더 깔끔하게 출력할 수 있다.
 SELECT userID, amount
   FROM buytbl
 order by userID;

-- 구매한 개수를 sum을 이용해 출력(집계함수는 숫자만 가능)
select userID, sum(amount) AS '구매 합계'  -- AS [] 또는 AS '' 로 열 이름을 정해줄 수 있다.
from buytbl
group by userID;

-- min, max
select min(height) AS '최소키'
 from userTbl

 select max(height) AS '최대키'
 from userTbl

 -- 위 2구문 합치기
 select min(height) AS '최소키',  max(height) AS '최대키'
 from userTbl

 -- 다른 컬럼을 넣기(집계함수 + 다른 컬럼은 group by를 사용해야한다.)
  select userID, userName, min(height) AS '최소키',  max(height) AS '최대키'
 from userTbl
 group by userID, userName
 -- 이렇게하면 원하는 조회가 되지않으므로 where을 통한 서브쿼리를 이용해야함

 -- 우리가 원하는 출력문
 select userName, height
 from userTbl
 where height = (select min(height) from userTbl) 
	or height = (select max(height) from usertbl);

-- 총 데이터 개수(count)  -> 컬럼 개수
select count(*) as '회원수' from userTbl;    -- 10
select count(*) as '구매내역수' from buytbl; -- 12


