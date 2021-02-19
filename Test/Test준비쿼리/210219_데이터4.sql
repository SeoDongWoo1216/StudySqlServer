USE [bookrentalshop]
GO
SET IDENTITY_INSERT [dbo].[rentaltbl] ON 
GO
INSERT [dbo].[rentaltbl] ([Idx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (1, 22, 30, CAST(N'2021-01-03' AS Date), CAST(N'2021-01-15' AS Date))
,(2, 10, 10, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-12' AS Date))
,(3, 1, 12, CAST(N'2021-02-01' AS Date), CAST(N'2021-02-03' AS Date))
,(4, 25, 34, CAST(N'2021-02-02' AS Date), NULL)
,(5, 23, 22, CAST(N'2021-02-11' AS Date), CAST(N'2021-07-12' AS Date))
,(6, 7, 30, CAST(N'2021-02-14' AS Date), CAST(N'2021-07-13' AS Date))
,(7, 9, 31, CAST(N'2021-02-14' AS Date), CAST(N'2021-02-17' AS Date))
,(8, 21, 15, CAST(N'2021-02-18' AS Date), CAST(N'2021-02-18' AS Date))
,(9, 22, 17, CAST(N'2021-02-20' AS Date), CAST(N'2021-02-25' AS Date))
,(10, 14, 7, CAST(N'2021-02-26' AS Date), CAST(N'2021-02-28' AS Date))
,(11, 15, 9, CAST(N'2021-03-01' AS Date), CAST(N'2021-03-05' AS Date))
,(12, 19, 44, CAST(N'2021-03-02' AS Date), CAST(N'2021-03-20' AS Date))
,(13, 20, 59, CAST(N'2021-03-03' AS Date), CAST(N'2021-03-08' AS Date))
,(14, 24, 24, CAST(N'2021-03-08' AS Date), CAST(N'2021-03-11' AS Date))
,(15, 6, 16, CAST(N'2021-07-12' AS Date), CAST(N'2021-07-13' AS Date))
,(16, 5, 58, CAST(N'2021-03-03' AS Date), CAST(N'2021-03-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[rentaltbl] OFF
GO
