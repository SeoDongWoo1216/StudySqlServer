-- 2-1
SELECT TOP 10
       concat(STUFF(NAMEs,1,1,''), ',' ,(STUFF(NAMEs,2,3,''))) as 변경이름
	 , levels
	 , left(addr, 2) as 도시
	 , LOWER(email) as 이메일
  FROM membertbl