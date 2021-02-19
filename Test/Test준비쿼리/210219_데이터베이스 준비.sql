USE tempdb;
GO

CREATE DATABASE bookrentalshop;
GO


USE bookrentalshop;
GO

CREATE TABLE divtbl (
	Division varchar(8) NOT NULL PRIMARY KEY,
	Names nvarchar(45) NULL
);
GO

CREATE TABLE bookstbl (
	Idx int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Author nvarchar(50) NULL,
	Division varchar(8) NOT NULL
		FOREIGN KEY REFERENCES divtbl(Division),
	Names nvarchar(100) NULL,
	ReleaseDate date NULL,
	ISBN varchar(200) NULL,
	Price decimal(10, 0) NULL,
	Descriptions nvarchar(max) NULL
);
GO

CREATE TABLE membertbl (
	Idx int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Names nvarchar(50) NOT NULL,
	Levels char(1) NULL,
	Addr nvarchar(100) NULL,
	Mobile varchar(13) NULL,
	Email varchar(50) NULL,
	userID varchar(20) NOT NULL UNIQUE,
	passwords varchar(max) NOT NULL,
	lastLoginDt datetime NULL,
	loginIpAddr varchar(30) NULL,
);
GO

CREATE TABLE rentaltbl(
	Idx int IDENTITY(1,1) NOT NULL,
	memberIdx int NULL
		FOREIGN KEY REFERENCES membertbl(Idx),
	bookIdx int NULL
		FOREIGN KEY REFERENCES bookstbl(Idx),
	rentalDate date NULL,
	returnDate date NULL,
);
GO
