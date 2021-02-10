-- case 문
declare @point  int;
declare @credit char;

set @point = 99;
set @credit = 
 case
  when(@point >= 90) then 'A'
  when(@point >= 80) then 'B'
  when(@point >= 70) then 'C'
  when(@point >= 60) then 'D'
  ELSE 'F'
 END

 print concat('취득점수 ==> ', @point);
 print concat('학점    ==> ', @credit);

 -----------------------------------------------------

-- case문 예제

/*
buytbl에서 구매액(price * amount)이 1500원 이상이면 '최우수 고객', 1000원 이상이면 '우수고객',
1원 이상인 고객은 '일반고객', 구매실적이 전혀없으면 '유령고객'

*/
use sqlDB
go

SELECT * FROM buytbl
SELECT * FROM userTbl

-- 두 테이블 조인
SELECT u.userid, u.username, IIF(SUM(price * amount) is null, 0, SUM(price * amount)) as '총 구매금액'
FROM buyTbl as b
RIGHT JOIN usertbl as u
on u.userID = b.userID
group by u.userid, u.username
order by  SUM(price * amount) desc


-- 제어문을 통해 고객 등급 추가
SELECT u.userid, 
       u.username, 
       IIF(SUM(price * amount) is null, 0, SUM(price * amount)) as '총 구매금액',
	   case
		   when (SUM(price * amount) >= 1500) then 'VVIP'
		   when (SUM(price * amount) >= 1000) then 'VIP'
		   when (SUM(price * amount) >= 1   ) then 'Person'
		   ELSE 'Ghost'
	   END as '고객 등급'
  FROM buyTbl as b
  RIGHT JOIN usertbl as u
     on u.userID = b.userID
  group by u.userid, u.username
  order by  SUM(price * amount) desc
