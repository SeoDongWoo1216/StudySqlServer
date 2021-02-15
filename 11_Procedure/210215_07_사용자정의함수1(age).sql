-- 스칼라 사용자 정의 함수(나이 구하기)
/*
use sqlDB
go

create or alter function ufn_getAge
(
	@birthYear int
)
returns int
as
	begin
		declare @age int;
		set @age = (year(getdate()) - @birthYear) + 1;
		return @age;
	end
go
*/

-- 사용자 정의 함수를 사용 안한 것
select *, year(getdate()) - birthYear + 1 as 나이
  from usertbl
 

-- 사용자 정의 함수 사용
select *, dbo.ufn_getAge(birthYear) as 나이
  from userTBL

