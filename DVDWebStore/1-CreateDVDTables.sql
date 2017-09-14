CREATE DATABASE [DVDdb]

GO

USE [DVDdb]

GO

CREATE TABLE [DVDtable](

	[DVDID] [int] IDENTITY(1,1) NOT NULL,

	[DVDtitle] [nvarchar](50) NOT NULL,

	[DVDartist] [nvarchar](50) NOT NULL,

	[DVDprice] [money] Not NULL,

	[DVDrating] [int] NOT NULL,

 CONSTRAINT [PK_DVDtable] PRIMARY KEY CLUSTERED
 
(

	[DVDID] ASC

)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO


CREATE TABLE [Customers](

	[CustomerID] [int] IDENTITY(1,1) NOT NULL,

	[FirstName] [nvarchar](50) NOT NULL,

	[LastName] [nvarchar](50) NOT NULL,

 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED
 
(

	[CustomerID] ASC

)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

CREATE TABLE [Orders](

	[OrderID] [int] IDENTITY(1,1) NOT NULL,

	[CustomerID] [int] NOT NULL,

 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED
 
(

	[OrderID] ASC

)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO


CREATE TABLE [DVDsOrdered](

	[DVDsOrderedID] [int] IDENTITY(1,1) NOT NULL,

	[OrderID] [int] NOT NULL,

	[DVDID] [int] NOT NULL,

 CONSTRAINT [PK_DVDsOrdered] PRIMARY KEY CLUSTERED
 
(

	[DVDsOrderedID] ASC

)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



