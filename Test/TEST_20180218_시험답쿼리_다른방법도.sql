use bookrentalshop
go

-- 1-1
select m.email, m.mobile, m.Names, m.Addr
  from membertbl as m 
 order by m.Names desc;

-- 1-2
select b.Names, b.author, b.ReleaseDate, b.price
  from bookstbl as b;

-- 2-1
select top(10)
	   concat(right(Names, 2), ',', left(names,1)) as 변경이름
	  , levels 
	  , left(Addr, 2) as 도시
	  , LOWER(email)  as 이메일
  from membertbl

-- 2-2
select idx
	 , concat('제목 : ', Names)  as Names
	 , concat('저자 > ', Author) as Author
	 , format(ReleaseDate, 'yyyy년 MM월 dd일') as 출판일
	 , ISBN
	 , format(price, '#.#원') as 가격
  from bookstbl
 order by idx desc


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

-- 3-1 inner join 약식1
select b.Idx      as 번호
     , b.Division as 장르번호
     , d.Names    as 장르
	 , b.Names    as 책제목
	 , b.Author   as 저자
  from bookstbl   as b
     , divtbl     as d
 where b.Division = d.Division
   and b.division = 'B002' 

-- 3-1 inner join 약식2 (조인을 쓰지않고 서브쿼리 사용)
SELECT b.Idx        as 번호
     , b.Division   as 장르번호
   --, d.Names      as 장르
     , (select Names from divtbl where Division = b.Division) as 장르
     , b.Names      as 책제목
	 , b.Author     as 저자
  FROM dbo.bookstbl as b
 where b.Division = 'B002'


-- 3-2
select m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate
  from membertbl as m
left outer join rentaltbl as r
    on m.idx = r.memberIdx

-- 3-2 다르게 풀기
select m.Names
     , m.Levels
	 , m.Addr
	 , null as 'rentalDate'
  from membertbl as m
 where m.Idx not in (select memberIdx from rentaltbl as r);



 /*
 -- 4-1
select * from divTbl;
insert into divTbl values ('I002', '자기개발서');

-- 4-2
update membertbl 
   set Addr = '부산시 해운대구',
       mobile = '010-6683-7732'
 where Idx = 26;
 */

-- 5
select d.Names, sum(b.price) as 합계
  from bookstbl as b
 inner join divtbl as d
    on b.Division = d.Division
 group by rollup(d.Names)

-- 5 다르게 풀기

select (select names from divtbl where Division = a.Division) as 'Names'
	, a.sum_price as '합계금액'
from
	(  
	   select division, sum(price) as 'sum_price'
	     from bookstbl
		group by division
	) as a
	 union all
	select null, sum(price)
	  from bookstbl