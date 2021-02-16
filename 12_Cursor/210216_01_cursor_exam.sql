use sqldB;
go
/*
-- global은 전역변수로 쓰겠다는 뜻임
Declare cur_userTbl cursor global 
	for select height from userTbl

open cur_userTbl

declare @height smallint;      -- 회원의 키담는 변수
declare @cnt int = 0;          -- 회원수(읽은 행수)
declare @totalheight int = 0;  -- 회원 키의 합계 변수

fetch next from cur_usertbl into @height;  -- 커서값 읽어서 @height 변수에 할당

-- 반복문 시작
while @@FETCH_STATUS = 0
begin 
	set @cnt +=1;
	set @totalheight += @height
	fetch next from cur_usertbl into @height;
end

print concat('회원 키 평균 = ', @totalheight / @cnt);
close cur_usertbl;
deallocate cur_usertbl
*/

------------------------------------------------------------------------------------

-- global은 전역변수로 쓰겠다는 뜻임
Declare cur_userTbl cursor global 
	for select username, height from userTbl

open cur_userTbl

declare @userName nchar(8);    -- 회원 이름
declare @height smallint;      -- 회원의 키담는 변수
declare @cnt int = 0;          -- 회원수(읽은 행수)
declare @totalheight int = 0;  -- 회원 키의 합계 변수

fetch next from cur_usertbl into @userName, @height;  -- 커서값 읽어서 @height 변수에 할당

-- 반복문 시작
while @@FETCH_STATUS = 0
begin 
	set @cnt +=1;
	set @totalheight += @height
	print concat('회원 : ', @userName, ' 키: ', @height);
	fetch next from cur_usertbl into @userName, @height;
end

print concat('회원 키 평균 = ', @totalheight / @cnt);
close cur_usertbl;
deallocate cur_usertbl
