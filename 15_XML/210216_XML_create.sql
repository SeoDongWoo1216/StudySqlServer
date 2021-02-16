use sqlDB;
go

insert into xmltbl values('Hello World');

select * from xmltbl

insert into xmltbl values('<html><body><p>Sample</p></body></html>');


------------------------------------------------------------------------------------------------

SELECT u.userID, u.userName, u.birthYear, u.addr, u.height, b.prodName, b.price
  FROM usertbl as u
  inner join buytbl as b
  on u.userid = b.userid
 where u.height > 170
 for json auto;