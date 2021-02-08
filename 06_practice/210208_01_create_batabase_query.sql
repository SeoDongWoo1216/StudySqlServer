use tempdb;
go

-- DB 생성
CREATE database sqlDB;
go

-- 테이블 생성
use sqlDB;
go

CREATE TABLE userTbl -- 회원테이블
(
	userID	  CHAR(8)      NOT NULL PRIMARY KEY, -- 사용자 아이디
	username  NVARCHAR(10) NOT NULL, -- 이름
	birthYear INT		   NOT NULL, -- 출생년도
	addr	  NCHAR(2)     NOT NULL, -- 지역(서울, 경기처럼 2글자로만 입력)
	mobile1	  CHAR(3)			   , -- 폰 국번(011, 010 등)
	mobile2   CHAR(8)			   , -- 폰 나머지 번호(- 제외)
	height	  SMALLINT			   , -- 키(신장)
	mDate     DATE				     -- 회원가입일
);
GO

CREATE TABLE buytbl
(
	num		  INT IDENTITY NOT NULL PRIMARY KEY, -- 순번(PK)
	userID    CHAR(8)      NOT NULL  -- 아이디(FK)
	FOREIGN KEY REFERENCES usertbl(userID),
	prodName  NVARCHAR(20) NOT NULL, -- 물품명
	groupName NCHAR(4)			   , -- 분류
	price	  INT		   NOT NULL, -- 단가
	amount    SMALLINT     NOT NULL  -- 수량
);
Go




