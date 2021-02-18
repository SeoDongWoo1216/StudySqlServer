-- 3-2 outer join (대여날짜 없는사람 : 대여안한사람)
SELECT m.Names
     , m.Levels
     , m.Addr
	 , r.rentalDate
  FROM dbo.membertbl       as m
 left outer join rentaltbl as r
    on m.idx = r.memberidx
 where rentaldate is null