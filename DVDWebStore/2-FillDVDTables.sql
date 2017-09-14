

USE [DVDdb]
GO
SET IDENTITY_INSERT [dbo].[DVDtable] ON
GO
INSERT INTO [DVDtable] ([DVDid],[DVDtitle],[DVDartist],[DVDrating],[DVDprice])VALUES(1,'Argo','Ben Afflict', 5, 19.99)
INSERT INTO [DVDtable] ([DVDid],[DVDtitle],[DVDartist],[DVDrating],[DVDprice])VALUES(2,'Life of Pi','Suraj Sharma', 4, 18.99)
INSERT INTO [DVDtable] ([DVDid],[DVDtitle],[DVDartist],[DVDrating],[DVDprice])VALUES(3,'Lincoln','Daniel Day-Lewis', 5, 16.99)
INSERT INTO [DVDtable] ([DVDid],[DVDtitle],[DVDartist],[DVDrating],[DVDprice])VALUES(4,'Beasts of the Southern Wild','Quvenzhané Wallis', 5, 16.50)
INSERT INTO [DVDtable] ([DVDid],[DVDtitle],[DVDartist],[DVDrating],[DVDprice])VALUES(5,'Les Miserables','Anne Hathaway', 5, 14.99)

GO
SET IDENTITY_INSERT [dbo].[DVDtable] OFF