-- DB 변수의 사용 : DECLARE로 선언한 변수는 실행 후에 즉시 사라지므로, 한 문장씩 따로 실행하면 오류가 발생함.
use sqlDB;
DECLARE @myVar1 INT;
DECLARE @myVar2 SMALLINT;
DECLARE @myVar3 DECIMAL(5,2); -- 전체사이즈가 5, 소수점을 나타내는게 2 => 소수점 나타낼때 사용
DECLARE @myVar4 NCHAR(20);

SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 3.14;
SET @myVar4 = '가수 이름 ==>';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;
SELECT '100' + @myVar3;  -- DB에서는 문자열이더라도 숫자로 인식하면 계산해준다.
-- SELECT '한글' + @myVar3; -- 에러
SELECT @myVar4, userName AS '키가 180이상인 사람' FROM userTbl WHERE height > 180;


DECLARE @myVar5 tinyint;
set @myVar5 = 3;
SELECT top(@myVar5) userName, height from userTbl order by height desc;-- 키가 큰 사람(TOP사용)부터 정렬

---------------------------------------------------------------------------------

select * from buytbl;

-- 변환함수
SELECT avg(amount) as '평균구매개수' from buytbl;
SELECT avg(CAST(amount as float)) as '평균구매개수' from buytbl; -- 소수점까지 출력
SELECT avg(CONVERT(FLOAT, amount)) as '평균구매개수' from buytbl; -- 소수점까지 출력
SELECT avg(TRY_CONVERT(FLOAT, amount)) as '평균구매개수' from buytbl; -- 소수점까지 출력

SELECT price, amount, price/amount as '단가/수량' from buytbl
SELECT price, amount, CAST(CAST(price AS float)/amount as decimal(10,2)) as '단가/수량' from buytbl -- 소수점까지 출력

---------------------------------------------------------------------------------

-- PARSE : 문자열중에있는 숫자를 숫자형으로 바꿔준다.
SELECT '2021년 2월 9일'
SELECT PARSE('2021년 2월 39일' as date);     -- 에러
SELECT TRY_PARSE('2021년 2월 39일' as date); -- NULL(오류) 출력

SELECT parse('123.45' as int );              -- 에러
SELECT try_parse('123.45' as int );          -- null(오류) 출력
SELECT parse('123.45' as decimal(5,2));      -- 맞는 코드
SELECT try_parse('123.45' as decimal(5,2));  -- 맞는 코드
-- parse와 try_parse 의 차이를 기억하자.

---------------------------------------------------------------------------------

-- 스칼라함수(단일 리턴 함수)

-- 수치 연산 함수
select GETDATE()		as '현재 날짜';
SELECT year(GETDATE())	as '금년';
SELECT month(GETDATE()) as '이번달';
SELECT day(GETDATE())   as '오늘일';

SELECT abs(-100) as '절대값';
SELECT round(3.1415, 3) as '반올림';
select round(1234.5678, -1);  -- -1 을 하게되면 1의자리에서 반올림하게된다.

select rand();
select cast((rand() * 100)as int);  -- 사용할때 대충 이렇게 사용

select iif(20 > 10, '참', '거짓')  -- 삼항연산자 iif(조건, 참일때 출력, 거짓일때 출력)


-- 문자열 함수
SELECT ascii('a'), ascii('A');
SELECT char(98), char(66);

SELECT unicode('나');
select nchar(45909);


-- ★★ 진짜 많이쓰는 문자열 함수 ★★

-- 문자열 결합
select concat('Microsoft', 'SQL ', 'Server ', 2019); 

-- 문자열 시작 위치 반환(맨 처음이 1부터 시작)
SELECT charindex('Server', 'SQL Server 2019')

-- LEFT, RIGHT : 각 지정 위치로부터 지정한 수 만큼 반환
SELECT LEFT('SQL Server 2019', 3), RIGHT('SQL Server 2019', 4); 

-- substring : 지정한 위치부터 지정한 개수의 문자를 반환(모든 언어에 전부 있는 함수임)
SELECT SUBSTRING('Hello wolrd!', 7, 5); -- 7번째부터 5개 글자를 출력
SELECT SUBSTRING('안녕하세요, SQL서버입니다!', 11, 2); -- 11번째부터 2개 글자 출력

-- LEN : 문자열의 길이 출력(공백은 무시)
SELECT LEN('안녕하세요'), LEN('Hello World!');
SELECT LEN('Hello World!'),     -- 12 출력
	   LEN('Hello World!   '),  -- 12 출력
	   LEN('   Hello World!');  -- 15 출력

-- LOWER, UPPER : 각각 소문자, 대문자로 변환해준다
SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH');

-- LTRIM, RTRIM : 왼쪽 및 오른쪽 공백을 제거해준다.
SELECT LTRIM('  Hello Wolrd!  '), 
	   RTRIM('  Hello Wolrd!  '),
	   TRIM ('  Hello Wolrd!  ');

-- REPLACE() : 문자열의 내용을 지정한 것으로 찾아서 바꿔줌
SELECT REPLACE('SQL Server 2016', 'Server', '서버');
SELECT REPLACE('(2016년 발표) SQL Server 2016', '2016', '2019');

--  format() : 지정된 형식으로 출력(주로 날짜를 사용), ★★★★★★진짜 많이씀★★★★★★
SELECT getdate()
SELECT format(getdate(), '');    -- 기본
SELECT format(getdate(), 'dd/MM/yyyy');  
SELECT format(getdate(), 'yyyy/MM/dd hh:mm:ss:ms');  -- 한국사람이 제일 많이씀(ms빼고)
SELECT format(getdate(), 'yyyy/MM/dd');
SELECT format(getdate(), 'hh:mm:ss');  


-- 따로 연습하기 (이 함수들을 실제 DB에 적용할 수 있어야한다!)
SELECT SUBSTRING('운동화', 1, 2) FROM buytbl WHERE prodName = '운동화'

SELECT * FROM userTbl
SELECT userID, username, REPLACE('경기','경기','서울') AS 주소 FROM userTbl WHERE addr = '경기'
SELECT STUFF('경기', 1, 2, '서울') FROM userTbl WHERE addr = '경기' -- 1번째부터 2번째까지 삭제하고 서울 삽입


----------------------------------------------------------------



