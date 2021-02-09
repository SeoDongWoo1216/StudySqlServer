SELECT * FROM stdTbl
SELECT * FROm clubTBL
SELECT * from clubregtbl


-- ǥ�� INNER JOIN(���� ����)
SELECT s.id, s.stdName, c.clubName, c.bulidingNum
  FROM stdtbl as s
  inner join clubRegtbl as r
	on s.ID = r.std_ID
  INNER JOIN ClubTbl as c
	on r.Club_ID = c.ID;


-- iNNER JOIN ���(�������� ����� �Ȱ���) => T-SQL���� ����ϴ� ��� ���
SELECT s.id, s.stdName, c.clubName, c.bulidingNum
	FROM stdtbl as s, clubRegtbl as r, ClubTbl as c
	WHERE s.id = r.std_id
	and r.club_id = c.id;


-- �̳������� ���� �������ν�, 1:1�� ��Ȯ�� ��ġ�ϴ°͸� ���
-- ���Ծ��� ����鵵 ���� �ʹٰ��ϸ�? (��ġ���� �ʴ� ���� ����ϰ� ������?)
-- �ƿ��� ������ ����ϸ�ȴ�.

----------------------------------------------------------

-- OUTER JOIN(�ܺ� ����)
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

-- OUTER JOIN ���̺� 3��
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


 -- LEFT �� FROM�� ���� 
 -- RIGHT�� OUTER JOIN ���� ���̺��� ����

 ----------------------------------------------------------
 
 -- ��ȣ���� : PASS
 
 ----------------------------------------------------------

 -- SELF���� : �ڱ��ڽŰ� ������. �ַ� ������ ��� ���� Ȱ��.

 ----------------------------------------------------------



