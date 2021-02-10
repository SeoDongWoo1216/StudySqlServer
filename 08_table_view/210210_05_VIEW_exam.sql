-- 뷰
use sqlDB
go

-- 뷰 생성 쿼리
create view uv_userTBL
AS
	SELECT userid, username, addr FROM userTbl
GO

SELECT * FROM uv_userTbl;


-- 예제(복잡한 쿼리를 줄여줄 수 있는 장점)
use sqlDB
go

create view uv_stdclubTBL
as
SELECT s.id, s.stdName, c.clubName, c.bulidingNum
  FROM stdtbl as s
  inner join clubRegtbl as r
	on s.ID = r.std_ID
  INNER JOIN ClubTbl as c
	on r.Club_ID = c.ID;
go

SELECT * FROM uv_stdclubTBL WHERE stdName = '은지원'