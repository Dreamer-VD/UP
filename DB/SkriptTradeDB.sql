CREATE DATABASE [TradeDB]
GO
USE [TradeDB]
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL
)
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRoleId] [int] NOT NULL,
	FOREIGN KEY ([UserRoleId]) REFERENCES [Role] (Id)
)
GO
CREATE TABLE [dbo].[ProductСategory](
	[Id] [int] PRIMARY KEY NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ProductArticleNumber] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	FOREIGN KEY ([ProductCategoryId]) REFERENCES [ProductСategory] (Id)
)
GO
CREATE TABLE [dbo].[OrderPickupPoint](
	[Id] [int] PRIMARY KEY NOT NULL,
	[Index] [int] NOT NULL,
	[Street] [nvarchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] PRIMARY KEY NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderPickupPointId] [int] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[UserId] [int] NULL,
	[Amount] [int] NOT NULL,
	FOREIGN KEY ([OrderStatusId]) REFERENCES [OrderStatus] (Id),
	FOREIGN KEY ([OrderPickupPointId]) REFERENCES [OrderPickupPoint] (Id),
	FOREIGN KEY ([UserId]) REFERENCES [User] (Id)
	)
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	PRIMARY KEY ([OrderId],[ProductId]),
	FOREIGN KEY ([OrderId]) REFERENCES [Order] (Id),
	FOREIGN KEY ([ProductId]) REFERENCES [Product] (Id)
)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (1, N'Басова', N'Амина', N'Кирилловна', N'klh7pi4rcbtz@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (2, N'Михайлов', N'Андрей', N'Денисович', N'gn0354mbiork@outlook.com', N'uzWC67', 1)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (3, N'Сидоров', N'Егор', N'Александрович', N'1o4l05k8dwpv@yahoo.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (4, N'Аксенова', N'Ульяна', N'Ивановна', N'hsqixl2vebuz@mail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (5, N'Васильева', N'Камила', N'Ивановна', N'towkse0hf26b@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (6, N'Ильин', N'Артём', N'Родионович', N'khx0ncdwz4uj@gmail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (7, N'Васильева', N'Василиса', N'Фёдоровна', N'01zji3wfuq7h@outlook.com', N'LdNyos', 3)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (8, N'Кудрявцева', N'Василиса', N'Матвеевна', N'am65k18q7bwp@mail.com', N'gynQMT', 3)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (9, N'Кириллова', N'Николь', N'Святославовна', N'wt9q8i6ypx47@outlook.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([Id], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleId]) VALUES (10, N'Андреева', N'Полина', N'Артёмовна', N'4o72gufv3xlz@tutanota.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[ProductСategory] ([Id], [CategoryName]) VALUES (1, N'Общестроительные материалы
')
INSERT [dbo].[ProductСategory] ([Id], [CategoryName]) VALUES (2, N'Стеновые и фасадные материалы
')
INSERT [dbo].[ProductСategory] ([Id], [CategoryName]) VALUES (3, N'Сухие строительные смеси и гидроизоляция
')
INSERT [dbo].[ProductСategory] ([Id], [CategoryName]) VALUES (4, N'Ручной инструмент
')
INSERT [dbo].[ProductСategory] ([Id], [CategoryName]) VALUES (5, N'Защита лица, глаз, головы
')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (32, N'PMEZMH', N'Цемент', N'Цемент Евроцемент М500 Д0 ЦЕМ I 42,5 50 кг', 1, NULL, N'М500', CAST(440.0000 AS Decimal(19, 4)), 10, 34)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (33, N'BPV4MM', N'Пленка техническая', N'Пленка техническая полиэтиленовая Изостронг 60 мк 3 м рукав 1,5 м, пог.м', 1, NULL, N'Изостронг', CAST(8.0000 AS Decimal(19, 4)), 13, 2)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (34, N'JVL42J', N'Пленка техническая', N'Пленка техническая полиэтиленовая Изостронг 100 мк 3 м рукав 1,5 м, пог.м', 1, NULL, N'Изостронг', CAST(13.0000 AS Decimal(19, 4)), 1, 34)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (35, N'F895RB', N'Песок строительный', N'Песок строительный 50 кг', 1, NULL, N'Knauf', CAST(102.0000 AS Decimal(19, 4)), 17, 7)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (36, N'3XBOTN', N'Керамзит фракция', N'Керамзит фракция 10-20 мм 0,05 куб.м', 1, NULL, N'MixMaster', CAST(110.0000 AS Decimal(19, 4)), 14, 21)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (37, N'3L7RCZ', N'Газобетон', N'Газобетон ЛСР 100х250х625 мм D400', 2, NULL, N'ЛСР', CAST(7400.0000 AS Decimal(19, 4)), 7, 20)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (38, N'S72AM3', N'Пазогребневая плита ', N'Пазогребневая плита ВОЛМА Гидро 667х500х80 мм полнотелая', 2, NULL, N'ВОЛМА', CAST(500.0000 AS Decimal(19, 4)), 9, 35)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (39, N'2G3280', N'Угол наружный', N'Угол наружный Vinylon 3050 мм серо-голубой', 2, NULL, N'Vinylon', CAST(795.0000 AS Decimal(19, 4)), 16, 20)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (40, N'MIO8YV', N'Кирпич', N'Кирпич рядовой Боровичи полнотелый М150 250х120х65 мм 1NF', 2, NULL, N'ВОЛМА', CAST(30.0000 AS Decimal(19, 4)), 9, 31)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (41, N'UER2QD', N'Скоба для пазогребневой плиты', N'Скоба для пазогребневой плиты Knauf С1 120х100 мм', 2, NULL, N'Knauf', CAST(25.0000 AS Decimal(19, 4)), 20, 27)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (42, N'ZR70B4', N'Кирпич', N'Кирпич рядовой силикатный Павловский завод полнотелый М200 250х120х65 мм 1NF', 2, NULL, N'Павловский завод ', CAST(16.0000 AS Decimal(19, 4)), 3, 26)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (43, N'LPDDM4', N'Штукатурка гипсовая', N'Штукатурка гипсовая Knauf Ротбанд 30 кг', 3, NULL, N'Knauf', CAST(500.0000 AS Decimal(19, 4)), 17, 38)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (44, N'LQ48MW', N'Штукатурка гипсовая', N'Штукатурка гипсовая Knauf МП-75 машинная 30 кг', 3, NULL, N'Weber', CAST(462.0000 AS Decimal(19, 4)), 16, 33)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (45, N'O43COU', N'Шпаклевка', N'Шпаклевка полимерная Weber.vetonit LR + для сухих помещений белая 20 кг', 3, NULL, N'ВОЛМА', CAST(750.0000 AS Decimal(19, 4)), 9, 16)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (46, N'M26EXW', N'Клей для плитки, керамогранита и камня', N'Клей для плитки, керамогранита и камня Крепс Усиленный серый (класс С1) 25 кг', 3, NULL, N'Knauf', CAST(340.0000 AS Decimal(19, 4)), 8, 2)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (47, N'K0YACK', N'Смесь цементно-песчаная', N'Смесь цементно-песчаная (ЦПС) 300 по ТУ MixMaster Универсал 25 кг', 3, NULL, N'MixMaster', CAST(160.0000 AS Decimal(19, 4)), 9, 19)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (48, N'ASPXSG', N'Ровнитель', N'Ровнитель (наливной пол) финишный Weber.vetonit 4100 самовыравнивающийся высокопрочный 20 кг', 3, NULL, N'Weber', CAST(711.0000 AS Decimal(19, 4)), 17, 20)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (49, N'ZKQ5FF', N'Лезвие для ножа ', N'Лезвие для ножа Hesler 18 мм прямое (10 шт.)', 4, NULL, N'Hesler', CAST(65.0000 AS Decimal(19, 4)), 13, 6)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (50, N'4WZEOT', N'Лезвие для ножа ', N'Лезвие для ножа Armero 18 мм прямое (10 шт.)', 4, NULL, N'Armero', CAST(110.0000 AS Decimal(19, 4)), 2, 17)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (51, N'4JR1HN', N'Шпатель', N'Шпатель малярный 100 мм с пластиковой ручкой', 4, NULL, N'Hesler', CAST(26.0000 AS Decimal(19, 4)), 3, 7)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (52, N'Z3XFSP', N'Нож строительный ', N'Нож строительный Hesler 18 мм с ломающимся лезвием пластиковый корпус', 4, NULL, N'Hesler', CAST(63.0000 AS Decimal(19, 4)), 19, 5)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (53, N'I6MH89', N'Валик', N'Валик Wenzo Roma полиакрил 250 мм ворс 18 мм для красок грунтов и антисептиков на водной основе с рукояткой', 4, NULL, N'Wenzo Roma', CAST(326.0000 AS Decimal(19, 4)), 12, 3)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (54, N'83M5ME', N'Кисть', N'Кисть плоская смешанная щетина 100х12 мм для красок и антисептиков на водной основе', 4, NULL, N'Armero', CAST(122.0000 AS Decimal(19, 4)), 16, 26)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (55, N'61PGH3', N'Очки защитные', N'Очки защитные Delta Plus KILIMANDJARO (KILIMGRIN) открытые с прозрачными линзами', 5, NULL, N'KILIMGRIN', CAST(184.0000 AS Decimal(19, 4)), 2, 25)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (56, N'GN6ICZ', N'Каска защитная ', N'Каска защитная Исток (КАС001О) оранжевая', 5, NULL, N'Исток', CAST(154.0000 AS Decimal(19, 4)), 10, 8)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (57, N'Z3LO0U', N'Очки защитные ', N'Очки защитные Delta Plus RUIZ (RUIZ1VI) закрытые с прозрачными линзами', 5, NULL, N'RUIZ', CAST(228.0000 AS Decimal(19, 4)), 19, 11)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (58, N'QHNOKR', N'Маска защитная', N'Маска защитная Исток (ЩИТ001) ударопрочная и термостойкая', 5, NULL, N'Исток', CAST(251.0000 AS Decimal(19, 4)), 6, 22)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (59, N'EQ6RKO', N'Подшлемник', N'Подшлемник для каски одноразовый', 5, NULL, N'Husqvarna', CAST(36.0000 AS Decimal(19, 4)), 17, 22)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (60, N'81F1WG', N'Каска защитная', N'Каска защитная Delta Plus BASEBALL DIAMOND V UP (DIAM5UPBCFLBS) белая', 5, NULL, N'Delta', CAST(1500.0000 AS Decimal(19, 4)), 1, 13)
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategoryId], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (61, N'0YGHZ7', N'Очки защитные ', N'Очки защитные Husqvarna Clear (5449638-01) открытые с прозрачными линзами', 5, NULL, N'Husqvarna', CAST(700.0000 AS Decimal(19, 4)), 9, 36)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (1, 344288, N' ул. Чехова 1')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (2, 614164, N'  ул. Степная 30')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (3, 394242, N' ул. Коммунистическая 43')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (4, 660540, N' ул. Солнечная 25')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (5, 125837, N' ул. Шоссейная 40')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (6, 125703, N' ул. Партизанская 49')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (7, 625283, N' ул. Победы 46')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (8, 614611, N' ул. Молодежная 50')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (9, 454311, N' ул. Новая 19')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (10, 660007, N' ул. Октябрьская 19')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (11, 603036, N' ул. Садовая 4')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (12, 450983, N' ул. Комсомольская 26')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (13, 394782, N' ул. Чехова 3')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (14, 603002, N' ул. Дзержинского 28')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (15, 450558, N' ул. Набережная 30')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (16, 394060, N' ул. Фрунзе 43')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (17, 410661, N' ул. Школьная 50')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (18, 625590, N' ул. Коммунистическая 20')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (19, 625683, N' ул. 8 Марта')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (20, 400562, N' ул. Зеленая 32')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (21, 614510, N' ул. Маяковского 47')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (22, 410542, N' ул. Светлая 46')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (23, 620839, N' ул. Цветочная 8')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (24, 443890, N' ул. Коммунистическая 1')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (25, 603379, N' ул. Спортивная 46')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (26, 603721, N' ул. Гоголя 41')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (27, 410172, N' ул. Северная 13')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (28, 420151, N' ул. Вишневая 32')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (29, 125061, N' ул. Подгорная 8')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (30, 630370, N' ул. Шоссейная 24')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (31, 614753, N' ул. Полевая 35')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (32, 426030, N' ул. Маяковского 44')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (33, 450375, N'ул. Клубная 44')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (34, 625560, N' ул. Некрасова 12')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (35, 630201, N' ул. Комсомольская 17')
INSERT [dbo].[OrderPickupPoint] ([Id], [Index], [Street]) VALUES (36, 190949, N' ул. Мичурина 26')
GO
INSERT [dbo].[OrderStatus] ([Id], [StatusName]) VALUES (1, N'Новый')
INSERT [dbo].[OrderStatus] ([Id], [StatusName]) VALUES (2, N'Завершён')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (21, 2, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 18, CAST(N'2022-05-21T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (22, 2, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 18, CAST(N'2022-05-21T00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (23, 1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 14, CAST(N'2022-05-22T00:00:00.000' AS DateTime), NULL, 15)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (24, 1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 14, CAST(N'2022-05-22T00:00:00.000' AS DateTime), NULL, 15)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (25, 2, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 22, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 9, 13)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (26, 2, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 22, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 9, 17)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (27, 1, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 22, CAST(N'2022-05-23T00:00:00.000' AS DateTime), NULL, 40)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (28, 1, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 22, CAST(N'2022-05-23T00:00:00.000' AS DateTime), NULL, 100)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (29, 2, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 26, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 8, 100)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (30, 2, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 26, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 8, 100)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (31, 1, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 28, CAST(N'2022-05-26T00:00:00.000' AS DateTime), NULL, 20)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (32, 1, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 28, CAST(N'2022-05-26T00:00:00.000' AS DateTime), NULL, 20)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (33, 2, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 28, CAST(N'2022-05-28T00:00:00.000' AS DateTime), 10, 50)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (34, 2, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 28, CAST(N'2022-05-28T00:00:00.000' AS DateTime), 10, 50)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (35, 1, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 32, CAST(N'2022-05-28T00:00:00.000' AS DateTime), NULL, 40)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (36, 1, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 32, CAST(N'2022-05-28T00:00:00.000' AS DateTime), NULL, 40)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (37, 2, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 36, CAST(N'2022-05-29T00:00:00.000' AS DateTime), NULL, 10)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (38, 2, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 36, CAST(N'2022-05-29T00:00:00.000' AS DateTime), NULL, 10)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (39, 2, CAST(N'2022-05-24T00:00:00.000' AS DateTime), 36, CAST(N'2022-05-30T00:00:00.000' AS DateTime), 7, 1)
INSERT [dbo].[Order] ([Id], [OrderStatusId], [OrderDate], [OrderPickupPointId], [OrderDeliveryDate], [UserId], [Amount]) VALUES (40, 2, CAST(N'2022-05-24T00:00:00.000' AS DateTime), 36, CAST(N'2022-05-30T00:00:00.000' AS DateTime), 7, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (21, 32)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (22, 33)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (23, 34)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (24, 35)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (25, 36)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (26, 37)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (27, 39)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (28, 40)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (29, 41)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (30, 42)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (31, 43)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (32, 44)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (33, 45)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (34, 46)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (35, 47)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (36, 48)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (37, 50)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (38, 51)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (39, 58)
INSERT [dbo].[OrderProduct] ([OrderId], [ProductId]) VALUES (40, 59)
ALTER DATABASE [TradeDB] SET  READ_WRITE 
GO
