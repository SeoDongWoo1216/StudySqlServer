
use bookrentalshop
go

-------------------------------------------------------------------------------------------------

/*
SELECT * FROM BooksTBL
SELECT * FROM divtbl
SELECT * FROM membertbl
SELECT * FROM rentaltbl
*/

-------------------------------------------------------------------------------------------------

-- 1-1
SELECT LOWER(email) as email, mobile, names, addr
  FROM membertbl
order by names desc

-------------------------------------------------------------------------------------------------

-- 1-2
SELECT names, author, releaseDate, price
  FROM BooksTBL

-------------------------------------------------------------------------------------------------

-- 시스템 내장 함수 사용

-- 2-1
SELECT TOP 10
       concat(STUFF(NAMEs,1,1,''), ',' ,(STUFF(NAMEs,2,3,''))) as 변경이름
	 , levels
	 , left(addr, 2) as 도시
	 , LOWER(email) as 이메일
  FROM membertbl
  
-------------------------------------------------------------------------------------------------

-- 2-2
SELECT idx
	 , concat('제목 : ', Names) as Names
	 , concat('저자 > ', Author) as Author
	 , format(ReleaseDate, 'yyyy년 MM월 dd일') as 출판일
	 , ISBN
	 , concat(FORMAT(price, '#,0'), '원') as 가격
  FROM BooksTBL
  order by idx desc

-------------------------------------------------------------------------------------------------
  
-- 3-1 이너조인
SELECT b.Idx        as 번호
     , b.Division   as 장르번호
	 , d.Names      as 장르
     , b.Names      as 책제목
	 , b.Author     as 저자
  FROM dbo.bookstbl as b
 inner join divtbl  as d
    on b.division = d.division
 where d.Division = 'B002'

 -------------------------------------------------------------------------------------------------

-- 3-2 outer join (대여날짜 없는사람 : 대여안한사람)
SELECT m.Names
     , m.Levels
     , m.Addr
	 , r.rentalDate
  FROM dbo.membertbl       as m
 left outer join rentaltbl as r
    on m.idx = r.memberidx
 where rentaldate is null

-------------------------------------------------------------------------------------------------

-- INSERT, UPDATE

-- 4-1 (INSERT 넣기)
 SELECT * FROM divtbl

 begin tran

 INSERT into divtbl
 values('I002', '자기개발서')

 rollback
 commit

-------------------------------------------------------------------------------------------------

-- 4-2 (UPDATE문)
-- 성명건 주소 부산시 사하구 -> 부산시 해운대구
-- 성명건 전화번호 010-9999-9999 -> 010-6683-7732

begin tran

UPDATE membertbl
set mobile = '010-6683-7732', Addr = '부산시 해운대구'
where Names = '성명건'

rollback
commit

-------------------------------------------------------------------------------------------------

-- 집계쿼리, 통계쿼리
-- 모든 책들의 총 합계 금액은?

-- 5-1
select d.names, sum(price) as '총합계'
  from bookstbl     as b
 inner join divtbl  as d
    on b.Division = d.Division
 group by rollup(d.Names);


 -------------------------------------------------------------------------------------------------
 
 -- 번외
 -- 사람들이 빌려간 책들이 총 얼마치인지?

SELECT d.Names
    , count(*) as '장르별개수'
	, sum(b.price) as 가격
	, (count(*) * sum(b.price)) as '총 가격'
FROm rentaltbl as r
inner join bookstbl as b
on r.bookIdx = b.idx
inner join divtbl as d
on b.Division = d.Division
group by d.Names


