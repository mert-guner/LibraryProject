USE [Omicron_db]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 21.10.2023 23:44:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](255) NULL,
	[ISBN] [nvarchar](255) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 21.10.2023 23:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[SurName] [nvarchar](50) NULL,
	[TC] [nvarchar](20) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 21.10.2023 23:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
	[BookID] [int] NULL,
	[PurchaseDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (17, N'Sol Ayağım', N'123-123-111-123')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (18, N'Kürk Mantolu Madonna', N'111-123-456-789')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (19, N'Şeker Portakalı', N'22-455-789-111')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (20, N'Kızıl Veba', N'233-456-159-753')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (21, N'Suç ve Ceza', N'456-423-157-4589')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (22, N'Simyacı', N'123-471-258-963')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (23, N'Masumiyet Müzesi', N'456-1247-896-55')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (24, N'İnsanlığımı Kaybedişim', N'22-456-789-1258')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (25, N'Beyaz Gemi', N'456-785-2214-885')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (26, N'Kalp Muhafizi Ciltli', N'111-2457-63285-525')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (27, N'Uçurtma Avcısı', N'1458-5654-487-55')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (28, N'Seyir Piraye', N'412-478-542-33')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (29, N'Bir Ask Masali', N'12-12-123-145')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (30, N'Otomatik Portakal', N'145-248-247-23')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (31, N'sol ayağım', N'123-123-111-123')
INSERT [dbo].[Book] ([ID], [BookName], [ISBN]) VALUES (32, N'Şeker Portakalı', N'22-455-789-111')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (9, N'Mert', N'Güner', N'12345678910')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (10, N'Kadir', N'Yıldız', N'12345678911')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (11, N'Şevket', N'Yıldız', N'45678912311')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (12, N'Gökhan', N'Tepe', N'45612375315')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (13, N'Serdar', N'Ortaç', N'15975328511')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (14, N'Serdar', N'Dursun', N'45624789631')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (15, N'Emanuel', N'Emenike', N'41278965412')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (16, N'İsmail', N'Dursun', N'45672349756')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (17, N'Hande', N'Ünsal', N'45678914785')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (18, N'İlayda', N'kaya', N'14782589632')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (19, N'Muzaffer', N'Kaya', N'12478596547')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (20, N'Zafer', N'Erol', N'12354698521')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (21, N'İrfan Can', N'Kahveci', N'45632012031')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (22, N'Sezer', N'Şahin', N'41236578912')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (23, N'Nihat', N'Güner', N'12548796541')
INSERT [dbo].[Person] ([ID], [Name], [SurName], [TC]) VALUES (24, N'Tekin', N'Metin', N'136547852142')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (1, 9, 17, CAST(N'2023-10-11T22:54:43.000' AS DateTime), CAST(N'2023-10-21T22:54:43.710' AS DateTime), 1)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (2, 10, 18, CAST(N'2023-10-11T23:36:01.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (3, 11, 19, CAST(N'2023-10-13T22:54:48.000' AS DateTime), CAST(N'2023-10-21T22:54:48.637' AS DateTime), 1)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (4, 12, 20, CAST(N'2023-10-15T22:46:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (5, 13, 21, CAST(N'2023-10-18T23:18:15.000' AS DateTime), CAST(N'2023-10-21T23:18:15.573' AS DateTime), 1)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (6, 14, 22, CAST(N'2023-10-20T22:48:58.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (7, 15, 23, CAST(N'2023-10-20T22:37:26.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (8, 16, 24, CAST(N'2023-10-20T22:53:07.000' AS DateTime), CAST(N'2023-10-21T22:53:07.120' AS DateTime), 1)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (9, 17, 25, CAST(N'2023-10-20T22:49:09.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (10, 18, 26, CAST(N'2023-10-20T22:49:24.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (11, 19, 27, CAST(N'2023-10-12T22:50:15.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (12, 20, 28, CAST(N'2023-10-18T22:51:01.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (13, 21, 29, CAST(N'2023-10-10T22:52:02.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (14, 22, 30, CAST(N'2023-10-13T22:52:40.000' AS DateTime), NULL, 0)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (15, 23, 31, CAST(N'2023-10-17T23:01:13.000' AS DateTime), CAST(N'2023-10-21T23:01:13.267' AS DateTime), 1)
INSERT [dbo].[Reservation] ([ID], [PersonID], [BookID], [PurchaseDate], [DeliveryDate], [Status]) VALUES (16, 24, 32, CAST(N'2023-10-17T23:38:37.000' AS DateTime), CAST(N'2023-10-21T23:38:37.883' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Book]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Person]
GO
