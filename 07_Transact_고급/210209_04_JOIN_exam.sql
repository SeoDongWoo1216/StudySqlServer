SELECT * FROM userTBL;
SELECT * FROM buytbl;

-- 보통 조회 쿼리문
SELECT * FROM userTbl where userID = 'JYP';
SELECT * FROM buytbl  WHERE USERID = 'JYP';

SELECT * FROM buyTbl where userID = 'BBK';


-- ★★★ INNER JOIN ★★★
SELECT u.userName, u.addr, 
       concat(u.mobile1, '-', left(u.mobile2, 4), '-', right(u.mobile2, 4)) as mobile,
	   b.prodName, b.price, b.amount
FROM buytbl as b
INNER JOIN userTbl as u
on b.userID = u.userID
WHERE b.userID = 'JYP'





