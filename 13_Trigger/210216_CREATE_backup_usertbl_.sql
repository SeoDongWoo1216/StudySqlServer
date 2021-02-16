use sqlDB;
go

CREATE TABLE [dbo].[backup_userTbl](
	[userID] [char](8) NOT NULL primary key,
	[username] [nvarchar](10) NOT NULL,
	[birthYear] [int] NOT NULL,
	[addr] [nchar](2) NOT NULL,
	[mobile1] [char](3) NULL,
	[mobile2] [char](8) NULL,
	[height] [smallint] NULL,
	[mDate] [date] NULL,
	modType nchar(2),     -- ����� Ÿ�� '����', '����'
	modDate date,         -- ����� ��¥
	modUser nvarchar(200) -- ����� �����
)
GO


