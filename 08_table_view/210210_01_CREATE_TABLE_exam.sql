/*
USE tempdb;
go
drop database tableDB;
go
create database tableDB;
*/

use tableDB
go

create table userTBL
(
	userID	   char(8),       -- 아이디
	userName   nvarchar(10),  -- 이름
	birthYear  int,			  -- 출생년도
	addr	   nchar(2),	  -- 지역
	mobile1    char(3),		  -- 휴대폰 국번
	mobile2    char(8),	      -- 휴대폰 번호
	height	   smallint,	  -- 키
	mDate	   date		      -- 회원 가입 일
);
go

create table buyTBL
(

);
go

