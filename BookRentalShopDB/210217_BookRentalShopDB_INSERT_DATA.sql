USE [BookRentalShopDB22]
GO

INSERT INTO [dbo].[cateTBL] ([cateidx],[cateName])
     VALUES ('N0001','공포/스릴러'),
			('N0002','로맨스'),
			('N0003','무협'),
			('N0004','전쟁/역사'), 
			('N0005','추리'), 
			('N0006','SF/판타지');
GO

INSERT INTO [dbo].[BooksTBL]
           ([cateidx],[bookName],[author],[interpreter],[company],[releaseDate],[ISBN],[price])
     VALUES	('N0001', '잔혹한 어머니의 날 1', '넬레 노이하우스', '김진아', '북로드', '2019-10-07', '9791158791179', '12800'),
			('N0003', '마도조사 2', '묵향동후', '이현아', '디앤씨미디어', '2019-09-03','9791127852122', '14000'),
			('N0006', '월드 오브 워크래프트 팝업북 한정판', '블리자드 엔터테인먼트, 매튜 라인하트', '유미지', '제우미디어', '2019-10-21', '9788959527779', '58000')
   
GO


