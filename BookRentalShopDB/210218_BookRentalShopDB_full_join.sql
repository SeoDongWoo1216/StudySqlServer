-- outer join 쿼리
--컨트롤 쉬프트 U : 모두 대문자로
--컨트롤 쉬프트 L : 모두 소문자로

select r.rentalidx
  -- , r.memberidx
	 , m.memberName
  -- , r.bookidx
     , c.cateName
	 , b.bookName
	 , b.author
     , format(r.rentaldt, 'yyyy-MM-dd') as 렌탈DT
     , format(r.returndt, 'yyyy-MM-dd') as 리턴DT
	 , dbo.ufn_getState(r.rentalState) as 대여상태
  from rentaltbl as r
 right outer join memberTBL as m
    on r.memberIdx = m.memberidx
  left outer join BooksTBL as b
    on r.bookIdx = b.bookidx
  left outer join cateTBL as c
  on b.cateidx = c.cateidx
 where r.RentalIdx is null

