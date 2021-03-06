USE [CodeTest]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15-08-2020 05:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 15-08-2020 05:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 15-08-2020 05:49:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[Id] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Electronics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Apparel')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'FootWear')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'MakeUp')
GO
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (1, 1, N'Top', N'Top Wear')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (2, 1, N'Skirt', N'BottomWear')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (3, 2, N'Mobile', N'Nokia Mobile')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (4, 2, N'Tablet', N'Samsung Tablet')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (5, 7, N'Slippers', N'Puma Slippers')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (6, 7, N'Shoes', N'Nike Shoes')
GO
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (1, 2, N'WomenClothes')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (2, 1, N'SmallAppliances')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (3, 1, N'LargeAppliances')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (4, 2, N'MensClothes')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (5, 2, N'KidsClothes')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (6, 3, N'WomenFootwear')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (7, 3, N'MensFootwear')
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_SubCategory]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
