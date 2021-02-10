DECLARE @var1 int;  -- 변수 선언
set @var1 = 100;    -- 변수 값대입

if @var1 = 100
  BEGIN
	SELECT '@var1은 100입니다.';
  END

else
  BEGIN
	SELECT '@var1은 100이 아닙니다.';
  END

-----------------------------------------------

declare @year int;  -- 년도 변수
set @year = 1980;   -- 값 1980 대입

if @year >= 1980
  begin
	select * from userTbl where birthYear >= @year;
  end

else
  begin
	print '검색을 할 수 없습니다.';
  end
