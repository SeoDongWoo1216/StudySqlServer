use BookRentalShopDB
go

-- 실제 회원정보 불러오기 레벨거꾸로, 이름순
SELECT memberName, memberID, password, levels, mobile, email
  FROM membertbl
 where levels <> 's'
order by levels asc, memberName;

---------------------------------------------------------------------------

-- 책 정보 비싼 순으로 보기 
SELECT cateidx, bookName, author, interpreter, company, price 
  FROM BooksTBL
  order by price desc;


select * from cateTBL

-- 시스템 함수 사용 쿼리
SELECT concat(right(memberName, 2), ', ', left(memberName, 1)) as 'Name', 
	   memberID, 
	   password, 
	   case levels
			when 'A' then '골드회원'
			when 'B' then '실버회원'
			when 'C' then '브론즈회원'
			when 'D' then '철회원'
			when 'S' then '관리자'
			else '비회원'
	   end as '회원등급', 
	   mobile, 
	   upper(email) as '이메일'
  FROM membertbl
 where levels <> 's'
order by levels asc, memberName;

---------------------------------------------------------------------------

-- 사용자 레벨 리턴 함수
create or alter function dbo.ufn_getlevel(@levels char(1))
	returns nvarchar(5)
as
begin
declare @result nvarchar(5); -- 골드회원, 실버회원, 브론즈회원, 철회원 등 변수
		set @result = case @levels
			when 'A' then '골드회원'
			when 'B' then '실버회원'
			when 'C' then '브론즈회원'
			when 'D' then '철회원'
			when 'S' then '관리자'
			else '비회원'
			
	   end;
	 return @result;
	END
	go

---------------------------------------------------------------------------

-- 사용자 정의 함수를 사용해서 SELECT 문 쿼리의 길이를 줄일 수 있다.
-- case문을 함수로 만들고, 그 자리에 함수선언만 해주면됨.

SELECT concat(right(memberName, 2), ', ', left(memberName, 1)) as 'Name', 
	   memberID,
	   dbo.ufn_getlevel(levels) as '회원레벨', 
	   mobile, 
	   upper(email) as '이메일'
  FROM membertbl
 where levels <> 's'
order by levels asc, memberName;

---------------------------------------------------------------------------

-- 책 정보, 시스템 함수, 포맷 함수 쿼리
SELECT bookidx
     , cateidx
     , concat(N'책 제목 > ', bookName) as 'BookName'
     , author
     , isnull(interpreter, '(역자없음)') as '번역가'  -- ★★★ isnull : null일때 값 삽입 ★★★
     , company
     , format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
     , format(price, '#,#원')as '가격'
  FROM BooksTBL

---------------------------------------------------------------------------

-- 책 정보 조인
SELECT b.bookidx
     --, b.cateidx
	 , c.cateName   -- 코드로 변환한 내용을 출력하는 것이 조인의 핵심
     , b.bookName
     , b.author
     , b.interpreter
     , b.company
  FROM dbo.BooksTBL as b
 inner join cateTBL as c
  on b.cateidx = c.cateidx

---------------------------------------------------------------------------

-- 대여된 책의 정보 쿼리 조인
-- 코드화되어있는 RentalTBL을 보기좋게 출력하는 것이 목표.
SELECT r.RentalIdx
     , r.memberIdx
     , r.bookIdx
     , r.rentalDt
     , r.returnDt
     , r.rentalState
  FROM dbo.RentalTBL as r


-- 렌탈상태 함수 생성
CREATE or ALTER function ufn_getState(@rentalState char(1))
returns nvarchar(5) 
as 
begin
	declare @result nvarchar(5);  -- 대여중, 반납, 연체중, 분실 을 담는 변수
	set @result = case @rentalState
				when '1' then '대여중'
				when '2' then '반납'
				when '3' then '연체중'
				when '4' then '분실'
				else '미정'
			      end;
	return @result;
end
go

---------------------------------------------------------------------------

-- memberidx, bookidx, rentalstate 코드화된것을 데이터로 출력
-- 이너조인을통해 코드화된 데이터 출력, 함수를 통해 데이터 출력
SELECT r.RentalIdx
   --, r.memberIdx
     , m.memberName
   --, r.bookIdx
     , b.bookName 
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
	 , format(r.returnDt, 'yyyy-MM-dd') as '반납일'
     , dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.RentalTBL as r
inner join bookstbl as b
	on r.bookIdx = b.bookidx
inner join memberTBL as m
	on r.memberidx = m.memberidx

---------------------------------------------------------------------------

-- 이너조인은 대여한 회원들
-- 아우터조인은 아무것도 안한 회원들 (반동분자를 찾는 것임)
-- 책을 빌리든말든 모든 회원 조회(기준을 멤버TBL로 잡고해보자)
SELECT r.RentalIdx
   --, r.memberIdx
     , m.memberName
   --, r.bookIdx
     , b.bookName 
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
	 , format(r.returnDt, 'yyyy-MM-dd') as '반납일'
     , dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.RentalTBL as r
left outer join bookstbl as b
	on r.bookIdx = b.bookidx
right outer join memberTBL as m
	on r.memberidx = m.memberidx

---------------------------------------------------------------------------

-- 책 안본사람만 조회
SELECT r.RentalIdx
   --, r.memberIdx
     , m.memberName
   --, r.bookIdx
     , b.bookName 
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
	 , format(r.returnDt, 'yyyy-MM-dd') as '반납일'
     , dbo.ufn_getState(r.rentalState)  as '대여상태'
  FROM dbo.RentalTBL as r
left outer join bookstbl as b
	on r.bookIdx = b.bookidx
right outer join memberTBL as m
	on r.memberidx = m.memberidx
 WHERE r.RentalIdx is null

 ---------------------------------------------------------------------------
 -- 우리 책 대여점에 없는 소설 장르(임시로 루팡의 딸을 N0005 -> N0001로 바꿈)

 select c.cateIdx
	  , c.cateName
	  , b.bookName
   from cateTBL as c
   left outer join booksTbl as b
     on c.cateidx = b.cateidx

