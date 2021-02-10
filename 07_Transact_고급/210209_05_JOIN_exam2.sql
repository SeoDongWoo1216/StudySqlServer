SELECT * FROM stdTbl
SELECT * FROm clubTBL
SELECT * from clubregtbl


-- 표준 INNER JOIN(내부 조인)
SELECT s.id, s.stdName, c.clubName, c.bulidingNum
  FROM stdtbl as s
  inner join clubRegtbl as r
	on s.ID = r.std_ID
  INNER JOIN ClubTbl as c
	on r.Club_ID = c.ID;


-- iNNER JOIN 약식(위에꺼랑 결과는 똑같음) => T-SQL에서 사용하는 약식 방법
SELECT s.id, s.stdName, c.clubName, c.bulidingNum
	FROM stdtbl as s, clubRegtbl as r, ClubTbl as c
	WHERE s.id = r.std_id
	and r.club_id = c.id;


-- 이너조인은 내부 조인으로써, 1:1로 정확히 일치하는것만 출력
-- 가입안한 사람들도 보고 싶다고하면? (일치하지 않는 값도 출력하고 싶으면?)
-- 아우터 조인을 사용하면된다.

----------------------------------------------------------

-- OUTER JOIN(외부 조인)
SELECT s.id, s.stdName, c.clubName, c.bulidingNum
  FROM stdtbl as s
  LEFT outer join clubRegtbl as r
	on s.ID = r.std_ID
  LEFT OUTER JOIN ClubTbl as c
	on r.Club_ID = c.ID;


-- UserTbl / buyTbl
select u.username, u.addr, b.prodName, b.price, b.amount 
  from usertbl as u
  RIGHT OUTER join buytbl as b
  on u.userID = b.userID;

select u.username, u.addr, b.prodName, b.price, b.amount 
  from usertbl as u
  LEFT OUTER join buytbl as b
  on u.userID = b.userID;

select u.username, u.addr, b.prodName, b.price, b.amount 
  from usertbl as u
  FULL OUTER join buytbl as b
  on u.userID = b.userID;


----------------------------------------------------------

-- OUTER JOIN 테이블 3개
SELECT *
  FROM stdTbl as s
  Left outer join clubregtbl as r
    on s.id = r.std_id
  full outer join clubtbl as c
    on r.club_id = c.id;

SELECT *
  FROM ClubRegTbl as r
  RIGHT OUTER JOIN clubtbl as c
  on r.club_id = c.id


 -- LEFT 는 FROM이 기준 
 -- RIGHT는 OUTER JOIN 옆의 테이블이 기준

 ----------------------------------------------------------
 
 -- 상호조인 : PASS
 
 ----------------------------------------------------------

 -- SELF조인 : 자기자신과 조인함. 주로 조직도 등에서 많이 활용.

 ----------------------------------------------------------



