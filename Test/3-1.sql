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