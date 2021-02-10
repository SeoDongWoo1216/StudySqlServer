/*
USE tempdb;
go
drop database tableDB;
go
create database tableDB;
*/

-- 마우스로만하던 테이블생성을 쿼리로 해보자.

use tableDB
go

DROP TABLE buyTBL
DROP TABLE userTBL
go

create table userTBL  -- 부모
(
	userID	   char(8)		not null	primary key,			-- 아이디
	userName   nvarchar(10) not null,							-- 이름
	birthYear  int          not null	default year(getdate()),-- 출생년도
	addr	   nchar(2)     not null	default '서울',			-- 지역
	mobile1    char(3)      null,								-- 휴대폰 국번
	mobile2    char(8)      null,								-- 휴대폰 번호
	height	   smallint     null,								-- 키
	email	   varchar(150) not null unique,					-- 이메일 추가 21_20_10 14:25
	mDate	   date         null								-- 회원 가입일
);
go

create table buyTBL  -- 자식
(
	num			int		   not null		identity(1,1) primary key,	-- 순번(PK)
	userID		char(8)	   not null
		foreign key references userTBL(userID), -- 아이디	
	prodName	nchar(6)   not null,			-- 품명
	groupName	nchar(4)   null,				-- 단가
	price		int		   not null,			-- 분류
	amount		smallint   not null				-- 수량
);
go

