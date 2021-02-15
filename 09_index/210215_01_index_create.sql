-- 인덱스

use sqlDB
go

-- 인덱스 테이블 생성 (기본키에 클러스터형 생성)
create table indexTbl(
	a int not null primary key,
	b int unique,
	c int not null unique,
	d int
);

-- 인덱스 테이블 생성2 (논클러스터형만 생성된다)
create table indexTbl2(
	a int not null unique,
	b int unique,
	c int not null unique,
	d int
);


