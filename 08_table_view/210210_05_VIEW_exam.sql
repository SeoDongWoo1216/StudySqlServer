-- ��
use sqlDB
go

-- �� ���� ����
create view uv_userTBL
AS
	SELECT userid, username, addr FROM userTbl
GO

SELECT * FROM uv_userTbl;


-- ����(������ ������ �ٿ��� �� �ִ� ����)
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

SELECT * FROM uv_stdclubTBL WHERE stdName = '������'