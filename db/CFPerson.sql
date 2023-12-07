USE [CFPerson]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[photo] [varchar](50) NULL,
	[activated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cf_Tables]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cf_Tables](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[status] [int] NOT NULL,
	[description] [varchar](255) NULL,
	[createdate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[username] [varchar](50) NULL,
	[createDate] [date] NULL,
	[address] [nvarchar](100) NULL,
	[cf_table] [int] NULL,
	[using_table] [bit] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[productId] [int] NULL,
	[categoryId] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[price] [float] NULL,
	[createDate] [date] NULL,
	[available] [bit] NULL,
	[brandId] [varchar](10) NULL,
	[images] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_category]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_category](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
	[qty] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_cost]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_cost](
	[date] [datetime2](7) NOT NULL,
	[cost] [float] NULL,
	[sum_order] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_product]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_product](
	[id] [bigint] NOT NULL,
	[count] [bigint] NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleDetails]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleDetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[accountId] [varchar](50) NULL,
	[roleId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/12/2023 2:45:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role] [varchar](10) NOT NULL,
	[description] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'admin', N'123', N'Admin', N'admin@gmail.com', N'admin.jpg', 1)
GO
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BA', N'Cà Phê', N'CF_den.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BTC', N'Nước ép', N'duahau.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'ETH', N'Trà sữa', N'chantrauden.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'KE', N'Mocha', N'')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM01', N'Cà Phê')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM02', N'Nước ép')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM03', N'Trà sữa')
GO
SET IDENTITY_INSERT [dbo].[Cf_Tables] ON 

INSERT [dbo].[Cf_Tables] ([ID], [name], [status], [description], [createdate]) VALUES (1, N'Bàn A', 1, NULL, CAST(N'2022-06-08' AS Date))
INSERT [dbo].[Cf_Tables] ([ID], [name], [status], [description], [createdate]) VALUES (2, N'Bàn B', 1, NULL, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[Cf_Tables] ([ID], [name], [status], [description], [createdate]) VALUES (3, N'Bàn C', 1, NULL, CAST(N'2023-12-03' AS Date))
INSERT [dbo].[Cf_Tables] ([ID], [name], [status], [description], [createdate]) VALUES (4, N'66', 0, NULL, CAST(N'2023-12-05' AS Date))
SET IDENTITY_INSERT [dbo].[Cf_Tables] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (0, 8, 2, 190000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (1, 9, 1, 350000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (2, 10, 13, 318000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (3, 18, 0, 210000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (4, 18, 1, 700000, 2)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (5, 19, 0, 210000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (6, 19, 1, 350000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (7, 20, 0, 210000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (8, 21, 1, 350000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (9, 21, 2, 190000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (10, 21, 3, 350000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (11, 22, 14, 1335000, 3)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (12, 23, 14, 4450000, 10)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (13, 24, 0, 1260000, 6)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (16, 21, 0, 1050000, 5)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (17, 21, 4, 2550000, 3)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (18, 25, 4, 850000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (19, 25, 0, 630000, 3)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (20, 26, 0, 210000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (21, 27, 0, 420000, 2)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (22, 27, 1, 350000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (23, 28, 0, 210000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (24, 29, 11, 1400000, 4)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (25, 29, 12, 370000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (26, 29, 13, 318000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (27, 30, 0, 420000, 2)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (28, 30, 1, 350000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (8, N'admin', CAST(N'2022-06-08' AS Date), N'169 Đinh Bộ Lĩnh', 1, 0, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (18, NULL, CAST(N'2023-12-02' AS Date), N'', NULL, 0, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (19, NULL, CAST(N'2023-12-02' AS Date), N'', 1, 1, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (20, NULL, CAST(N'2023-12-02' AS Date), N'', 1, 1, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (21, NULL, CAST(N'2023-12-02' AS Date), N'', 1, 1, 0)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (22, NULL, CAST(N'2023-12-02' AS Date), N'', NULL, 0, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (23, NULL, CAST(N'2023-12-02' AS Date), N'', NULL, 0, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (24, NULL, CAST(N'2023-12-02' AS Date), N'', NULL, 0, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (25, NULL, CAST(N'2023-12-02' AS Date), N'', 1, 1, 0)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (26, NULL, CAST(N'2023-12-03' AS Date), N'', NULL, 0, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (27, NULL, CAST(N'2023-12-03' AS Date), N'', NULL, 0, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (28, NULL, CAST(N'2023-12-03' AS Date), N'', 1, 0, 1)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (29, NULL, CAST(N'2023-12-05' AS Date), N'', 4, 1, 0)
INSERT [dbo].[Orders] ([id], [username], [createDate], [address], [cf_table], [using_table], [status]) VALUES (30, NULL, CAST(N'2023-12-05' AS Date), N'', 2, 1, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (6, 3, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (7, 4, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (10, 6, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (40, 1, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (41, 5, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (50, 8, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (52, 7, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (57, 0, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (58, 0, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (59, 1, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (60, 1, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (61, 6, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (62, 9, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (63, 10, N'DM02')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (0, N'Bạc Xỉu', 210000, CAST(N'2021-04-15' AS Date), 1, N'BA', N'["Bacxiu.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (1, N'Cà phê EspressoConPanna', 350000, CAST(N'2021-04-15' AS Date), 1, N'BA', N'["CF_ EspressoConPanna.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (2, N'Cà phê Americano', 190000, CAST(N'2021-03-20' AS Date), 1, N'BA', N'["CF_Americano.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (3, N'Cà phê Cappuccino', 350000, CAST(N'2021-03-20' AS Date), 1, N'BA', N'["CF_Cappuccino.jpg"')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (4, N'Cà phê CappuccinoViennese', 850000, CAST(N'2021-03-20' AS Date), 1, N'BA', N'["CF_CappuccinoViennese.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (5, N'Cà phê Cốt dừa', 37000, CAST(N'2021-03-22' AS Date), 1, N'BA', N'["CF_cotdua.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (6, N'Cà phê Đen', 322000, CAST(N'2022-04-10' AS Date), 1, N'BA', N'["CF_den.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (7, N'Cà phê Espresso', 218000, CAST(N'2021-04-15' AS Date), 1, N'BA', N'["CF_Espresso.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (8, N'Cà phê EspressoConPanna1', 650000, CAST(N'2021-04-15' AS Date), 1, N'BA', N'["CF_EspressoConPanna1.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (9, N'Cà phê Latte', 1458000, CAST(N'2022-04-12' AS Date), 1, N'BA', N'["CF_Latte.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (10, N'Cà phê LatteMacchiato', 189000, CAST(N'2022-04-12' AS Date), 1, N'BA', N'["CF_LatteMacchiato.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (11, N'Cà phê Mocha', 350000, CAST(N'2022-04-13' AS Date), 1, N'BA', N'["CF_Mocha.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (12, N'Cà phê Mocha1', 370000, CAST(N'2022-04-13' AS Date), 1, N'BA', N'["CF_Mocha1.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (13, N'Cà phê Sữa', 318000, CAST(N'2022-04-14' AS Date), 1, N'BA', N'["CF_Sua.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (14, N'Cà phê Trứng', 445000, CAST(N'2022-03-15' AS Date), 1, N'BA', N'["CF_Trung.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (15, N'Cà phê Trứng Muối', 350000, CAST(N'2022-03-15' AS Date), 1, N'BA', N'["CF_trungmuoi.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (16, N'Nước ép Cà Rốt', 350000, CAST(N'2022-03-15' AS Date), 1, N'BTC', N'["carot.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (17, N'Nước ép Chanh Dây', 350000, CAST(N'2022-03-15' AS Date), 1, N'BTC', N'["chanhday.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (18, N'Nước ép Dưa Hấu', 350000, CAST(N'2022-03-15' AS Date), 1, N'BTC', N'["duahau.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (19, N'Nước ép Cam ', 350000, CAST(N'2022-03-15' AS Date), 1, N'BTC', N'["nuoccam.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (20, N'Nước ép Chanh', 350000, CAST(N'2022-03-15' AS Date), 1, N'BTC', N'["nuocchanh.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (21, N'Trà Chanh', 350000, CAST(N'2022-03-15' AS Date), 1, N'KE', N'["trachanh.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (22, N'Trà Đào', 350000, CAST(N'2022-03-15' AS Date), 1, N'KE', N'["tradao.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (23, N'Trà Dâu', 350000, CAST(N'2022-03-15' AS Date), 1, N'KE', N'["tradau.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (24, N'Trà Táo', 350000, CAST(N'2022-03-15' AS Date), 1, N'KE', N'["tratao.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (25, N'Trà Việt Quất', 350000, CAST(N'2022-03-15' AS Date), 1, N'KE', N'["travietquat''.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (26, N'Trà sữa Trân Châu Đen', 350000, CAST(N'2022-03-15' AS Date), 1, NULL, N'["chantrauden.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (27, N'Trà sữa Đăc Biệt', 350000, CAST(N'2022-03-15' AS Date), 1, NULL, N'["dacbiet.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (28, N'Trà sữa Matcha', 350000, CAST(N'2022-03-15' AS Date), 1, NULL, N'["matcha.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (29, N'Trà sữa Socola', 350000, CAST(N'2022-03-15' AS Date), 1, NULL, N'["socola.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (30, N'Trà sữa Dâu', 350000, CAST(N'2022-03-15' AS Date), 1, NULL, N'["socola.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (31, NULL, NULL, NULL, NULL, NULL, N'["socola.jpg"]')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleDetails] ON 

INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (0, N'admin', N'director')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (4, N'thanhtung', N'staff')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (6, N'minhnhat', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (7, N'minhhieu', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (8, N'0373926165', N'staff')
SET IDENTITY_INSERT [dbo].[RoleDetails] OFF
GO
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'director', N'director')
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'staff', N'staff')
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'user', N'user')
GO
ALTER TABLE [dbo].[Cf_Tables] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [using_table]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cf_table])
REFERENCES [dbo].[Cf_Tables] ([ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cf_table])
REFERENCES [dbo].[Cf_Tables] ([ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK742sy9wrvs8ivg1wn23bncaa9] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK742sy9wrvs8ivg1wn23bncaa9]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FKlt9fqcoyhngtu4sjpanlwtd62] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FKlt9fqcoyhngtu4sjpanlwtd62]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK5dt69eq7frjuknk502wdsboje] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK5dt69eq7frjuknk502wdsboje]
GO
ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([role])
GO
ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([role])
GO
ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD  CONSTRAINT [FKmrry0i8jf03vmfut4y1ia2q7n] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([role])
GO
ALTER TABLE [dbo].[RoleDetails] CHECK CONSTRAINT [FKmrry0i8jf03vmfut4y1ia2q7n]
GO
