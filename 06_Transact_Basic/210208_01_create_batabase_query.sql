use tempdb;
go

-- DB ����
CREATE database sqlDB;
go

-- ���̺� ����
use sqlDB;
go

CREATE TABLE userTbl -- ȸ�����̺�
(
	userID	  CHAR(8)      NOT NULL PRIMARY KEY, -- ����� ���̵�
	username  NVARCHAR(10) NOT NULL, -- �̸�
	birthYear INT		   NOT NULL, -- ����⵵
	addr	  NCHAR(2)     NOT NULL, -- ����(����, ���ó�� 2���ڷθ� �Է�)
	mobile1	  CHAR(3)			   , -- �� ����(011, 010 ��)
	mobile2   CHAR(8)			   , -- �� ������ ��ȣ(- ����)
	height	  SMALLINT			   , -- Ű(����)
	mDate     DATE				     -- ȸ��������
);
GO

CREATE TABLE buytbl
(
	num		  INT IDENTITY NOT NULL PRIMARY KEY, -- ����(PK)
	userID    CHAR(8)      NOT NULL  -- ���̵�(FK)
	FOREIGN KEY REFERENCES usertbl(userID),
	prodName  NVARCHAR(20) NOT NULL, -- ��ǰ��
	groupName NCHAR(4)			   , -- �з�
	price	  INT		   NOT NULL, -- �ܰ�
	amount    SMALLINT     NOT NULL  -- ����
);
Go




