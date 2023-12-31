USE [master]
GO
/****** Object:  Database [ShopFlower]    Script Date: 7/17/2023 6:09:26 PM ******/
CREATE DATABASE [ShopFlower]
 CONTAINMENT = PARTIAL
 ON  PRIMARY 
( NAME = N'ShopFlower', FILENAME = N'D:\SQLdownloads\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopFlower.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopFlower_log', FILENAME = N'D:\SQLdownloads\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopFlower_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShopFlower] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopFlower].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopFlower] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopFlower] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopFlower] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopFlower] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopFlower] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopFlower] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopFlower] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopFlower] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopFlower] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopFlower] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopFlower] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopFlower] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopFlower] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopFlower] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopFlower] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopFlower] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopFlower] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopFlower] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopFlower] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopFlower] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopFlower] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopFlower] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopFlower] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopFlower] SET  MULTI_USER 
GO
ALTER DATABASE [ShopFlower] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopFlower] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopFlower] SET DEFAULT_FULLTEXT_LANGUAGE = 1033 
GO
ALTER DATABASE [ShopFlower] SET DEFAULT_LANGUAGE = 1033 
GO
ALTER DATABASE [ShopFlower] SET NESTED_TRIGGERS = ON 
GO
ALTER DATABASE [ShopFlower] SET TRANSFORM_NOISE_WORDS = OFF 
GO
ALTER DATABASE [ShopFlower] SET TWO_DIGIT_YEAR_CUTOFF = 2049 
GO
ALTER DATABASE [ShopFlower] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopFlower] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopFlower] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopFlower] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopFlower', N'ON'
GO
ALTER DATABASE [ShopFlower] SET QUERY_STORE = OFF
GO
USE [ShopFlower]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buy]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GreenHouseID] [int] NULL,
	[SalesPersonID] [int] NULL,
	[TotalPeyment] [int] NULL,
	[BuyDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colour]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colour](
	[ColorID] [int] IDENTITY(100,1) NOT NULL,
	[ColorName] [nvarchar](20) NULL,
	[HexCode] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(100,1) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Addess] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[BirthDate] [date] NULL,
	[Gender] [varchar](8) NULL,
	[TotalPurchase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flower]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flower](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FlowerName] [nvarchar](30) NULL,
	[Price] [int] NULL,
	[FlowerColorID] [int] NULL,
	[GreenHouseID] [int] NULL,
	[LastingTime] [int] NULL,
	[Number] [int] NULL,
	[TypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GreenHouse]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GreenHouse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Manager] [nvarchar](20) NULL,
	[Owner] [nvarchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[ManagerPhone] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Occasion]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NULL,
	[OccasionDescription] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[CustomerName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[ProductBuy] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[FlowerName] [nvarchar](255) NULL,
	[Linkimage] [varchar](255) NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPerson]    Script Date: 7/17/2023 6:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPerson](
	[PersonID] [int] NOT NULL,
	[first_name] [nvarchar](20) NULL,
	[last_name] [nvarchar](20) NULL,
	[Salary] [int] NULL,
	[Birthdate] [date] NULL,
	[Gender] [varchar](8) NULL,
	[Hiring_date] [date] NULL,
	[Mobile_number] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([name], [email], [password]) VALUES (N'nguyen kieu', N'nguyen123@gmail.com', N'27ff2ffe376b2edcc7c2de309173f0d8')
INSERT [dbo].[Account] ([name], [email], [password]) VALUES (N'Hoang Phuc', N'PhucPHCE171653@fpt.edu.vn', N'886d057a091559e2f5dff95d1d01360b')
INSERT [dbo].[Account] ([name], [email], [password]) VALUES (N'Hung Hoang', N'hunghpce170046@fpt.edu.vn', N'546cb004524c792856b4bbba7192456b')
INSERT [dbo].[Account] ([name], [email], [password]) VALUES (N'Thắng Trương', N'thang123@gmail.com', N'6e0c130ca8cf53a2473bd88044b83da9')
GO
SET IDENTITY_INSERT [dbo].[Buy] ON 

INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (1, 1, 93789932, 1900000, CAST(N'2022-06-02' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (2, 2, 94739555, 2900000, CAST(N'2022-06-02' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (3, 3, 96789922, 1100000, CAST(N'2023-06-02' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (4, 1, 93789932, 900000, CAST(N'2023-06-03' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (5, 2, 94739555, 500000, CAST(N'2023-06-03' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (6, 3, 96789922, 1000000, CAST(N'2023-06-03' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (7, 1, 93789932, 1900000, CAST(N'2023-06-04' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (8, 2, 94739555, 2900000, CAST(N'2023-06-04' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (9, 3, 96789922, 1100000, CAST(N'2023-06-04' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (10, 1, 93789932, 900000, CAST(N'2023-06-05' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (11, 2, 94739555, 500000, CAST(N'2023-06-05' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (12, 3, 96789922, 1000000, CAST(N'2023-06-05' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (13, 1, 93789932, 900000, CAST(N'2023-06-06' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (14, 2, 94739555, 500000, CAST(N'2023-06-06' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (15, 3, 96789922, 600000, CAST(N'2023-06-06' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (16, 1, 93789932, 900000, CAST(N'2023-06-07' AS Date))
INSERT [dbo].[Buy] ([ID], [GreenHouseID], [SalesPersonID], [TotalPeyment], [BuyDate]) VALUES (17, 2, 94739555, 500000, CAST(N'2023-06-07' AS Date))
SET IDENTITY_INSERT [dbo].[Buy] OFF
GO
SET IDENTITY_INSERT [dbo].[Colour] ON 

INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (100, N'Red', N'#FF0000')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (101, N'Maroon', N'#800000')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (102, N'DarkRed', N'#8B0000')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (103, N'Pink', N'#FFC0CB')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (104, N'MediumVioletRed', N'#C71585')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (105, N'PaleVioletRed', N'#DB7093')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (106, N'LightSalmon', N'#FFA07A')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (107, N'Orange', N'#FFA500')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (108, N'Yellow', N'#FFFF00')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (109, N'LemonChiffon', N'#FFFACD')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (110, N'Lavender', N'#E6E6FA')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (111, N'Purple', N'#800080')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (112, N'RebeccaPurple', N'#663399')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (113, N'LimeGreen', N'#32CD32')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (114, N'SeaGreen', N'#2E8B57')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (115, N'Olive', N'#808000')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (116, N'Teal', N'#008080')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (117, N'SkyBlue', N'#87CEEB')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (118, N'Navy', N'#000080')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (119, N'BlanchedAlmond', N'#FFEBCD')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (120, N'Sienna', N'#A0522D')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (121, N'White', N'#FFFFFF')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (122, N'Snow', N'#FFFAFA')
INSERT [dbo].[Colour] ([ColorID], [ColorName], [HexCode]) VALUES (123, N'Gold', N'#FFD700')
SET IDENTITY_INSERT [dbo].[Colour] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Addess], [Phone], [BirthDate], [Gender], [TotalPurchase]) VALUES (100, N'Nguyen Nhu', N'Ngoc', N'01 Hoa Binh, Ninh Kieu, Can Tho', N'0979247331', CAST(N'1989-09-30' AS Date), N'Female', NULL)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Addess], [Phone], [BirthDate], [Gender], [TotalPurchase]) VALUES (101, N'Nguyen Thanh', N'Truc', N'Khu Bai boi Song Hong, Ninh Kieu, Can Tho', N'0786779955', CAST(N'1087-11-03' AS Date), N'Female', NULL)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Addess], [Phone], [BirthDate], [Gender], [TotalPurchase]) VALUES (102, N'Tran Van', N'Quy', N'duong Hai Ba Trung, Ninh Kieu, Can Tho', N'079269996', CAST(N'1999-12-03' AS Date), N'Male', NULL)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Addess], [Phone], [BirthDate], [Gender], [TotalPurchase]) VALUES (103, N'Hoang Xuan', N'Vinh', N'389R duong Nguyen Van CU Noi Dai', N'0798185555', CAST(N'1989-01-13' AS Date), N'Male', NULL)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Addess], [Phone], [BirthDate], [Gender], [TotalPurchase]) VALUES (104, N'Nguyen Bao', N'Tran', N'Tran Nam Phu, Ninh Kieu, Can Tho', N'0973869657', CAST(N'1998-11-03' AS Date), N'Female', NULL)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Addess], [Phone], [BirthDate], [Gender], [TotalPurchase]) VALUES (105, N'Nguyen Huyen', N'Tran', N'phuong An Binh, Cai Rang, Can Tho', N'0903845764', CAST(N'1997-08-03' AS Date), N'Female', NULL)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Addess], [Phone], [BirthDate], [Gender], [TotalPurchase]) VALUES (106, N'Tran Van', N'Khoa', N'Long Tuyen, Binh Thuy, Can Tho', N'094623857', CAST(N'1980-09-30' AS Date), N'Male', NULL)
INSERT [dbo].[Customer] ([ID], [FirstName], [LastName], [Addess], [Phone], [BirthDate], [Gender], [TotalPurchase]) VALUES (107, N'Hoang Vu', N'Thai', N'Le Hong Phong, Binh Thuy, Can Tho', N'0963857623', CAST(N'1998-11-03' AS Date), N'Male', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Flower] ON 

INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (1, N'Hoa Hồng', 8000, 102, NULL, 3, 220, 2)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (2, N'Hoa Hồng', 8000, 100, NULL, 3, 200, 2)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (3, N'Hoa Hồng', 8000, 103, NULL, 3, 200, 2)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (4, N'Hoa Hồng', 8000, 122, NULL, 3, 100, 2)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (5, N'Hoa Tulip', 19000, 111, NULL, 3, 180, 3)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (6, N'Hoa Tulip', 21000, 122, NULL, 3, 180, 3)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (7, N'Hoa Hướng Dương', 80000, 111, NULL, 3, 100, 3)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (8, N'Hoa Hướng Dương', 40000, 107, NULL, 14, 20, 6)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (10, N'Hoa Tulip', 60000, 106, NULL, 14, 20, 6)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (11, N'Hoa Hướng Dương', 30000, 108, NULL, 14, 10, 6)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (12, N'Hoa Hướng Dương', 30000, 122, NULL, 14, 10, 6)
INSERT [dbo].[Flower] ([ID], [FlowerName], [Price], [FlowerColorID], [GreenHouseID], [LastingTime], [Number], [TypeID]) VALUES (13, N'Hoa Hướng Dương', 50000, 100, NULL, 14, 10, 6)
SET IDENTITY_INSERT [dbo].[Flower] OFF
GO
SET IDENTITY_INSERT [dbo].[GreenHouse] ON 

INSERT [dbo].[GreenHouse] ([ID], [Name], [Manager], [Owner], [Address], [ManagerPhone]) VALUES (1, N'Sadec flower village', N'Raha Ahmadi', N'Narges Taghados', N'Dong Thap', 317788559)
INSERT [dbo].[GreenHouse] ([ID], [Name], [Manager], [Owner], [Address], [ManagerPhone]) VALUES (2, N'Dalat market', N'Ghazale Zehtab', N'Ghazale Zehtab', N'Esfahan,Dalat', 313378897)
INSERT [dbo].[GreenHouse] ([ID], [Name], [Manager], [Owner], [Address], [ManagerPhone]) VALUES (3, N'Vinh Long market', N'Farimah Ataie', N'Nasim Zareie', N'Esfahan,Vinh Long', 316677665)
SET IDENTITY_INSERT [dbo].[GreenHouse] OFF
GO
SET IDENTITY_INSERT [dbo].[Occasion] ON 

INSERT [dbo].[Occasion] ([ID], [Title], [OccasionDescription]) VALUES (1, N'Sinh Nhật', NULL)
INSERT [dbo].[Occasion] ([ID], [Title], [OccasionDescription]) VALUES (2, N'Valentine', NULL)
INSERT [dbo].[Occasion] ([ID], [Title], [OccasionDescription]) VALUES (3, N'Chúc Mừng', NULL)
INSERT [dbo].[Occasion] ([ID], [Title], [OccasionDescription]) VALUES (4, N'Other', NULL)
SET IDENTITY_INSERT [dbo].[Occasion] OFF
GO
INSERT [dbo].[Order] ([CustomerName], [Address], [Phone], [ProductBuy], [Quantity], [Price], [Total]) VALUES (N'hung', N'vinhlong', N'0944592256', N'Hoa Hồng Đỏ', 2, 200000, 400000)
INSERT [dbo].[Order] ([CustomerName], [Address], [Phone], [ProductBuy], [Quantity], [Price], [Total]) VALUES (N'thang', N'can tho', N'0919837463', N'Hoa Hồng Trắng', 1, 150000, 150000)
INSERT [dbo].[Order] ([CustomerName], [Address], [Phone], [ProductBuy], [Quantity], [Price], [Total]) VALUES (N'phuc phan', N'camau', N'0832247620', N'Hoa Tulip', 1, 100000, 100000)
INSERT [dbo].[Order] ([CustomerName], [Address], [Phone], [ProductBuy], [Quantity], [Price], [Total]) VALUES (N'aimi', N'SocTrang', N'0947265483', N'Hoa Hồng Trắng Sinh Nhật', 1, 1000000, 1000000)
INSERT [dbo].[Order] ([CustomerName], [Address], [Phone], [ProductBuy], [Quantity], [Price], [Total]) VALUES (N'hung hoang', N'12 nguyen van cu', N'0938472623', N'Hoa Sáp Huớng Dương', 1, 700000, 700000)
INSERT [dbo].[Order] ([CustomerName], [Address], [Phone], [ProductBuy], [Quantity], [Price], [Total]) VALUES (N'hoang phuc', N'cantho', N'0829017831', N'Hoa Giỏ Hồng Trắng', 5, 800000, 800000)
INSERT [dbo].[Order] ([CustomerName], [Address], [Phone], [ProductBuy], [Quantity], [Price], [Total]) VALUES (N'Trương Văn Thắng', N'123, Bình Thủy', N'0923574746', N'Hoa Giỏ Hướng Dương', 2, 200000, 200000)
GO
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (1, N'Hoa Hồng Trắng Sinh Nhật', N'https://i.pinimg.com/236x/94/78/4a/94784acb3df49842a7fb9c1e916a7905.jpg', 20, 1000000, N'Hoa hồng trắng được dành cho các dịp đặt biệt như sinh nhật, Valentine ')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (2, N'Hoa Giỏ Hồng Trắng', N'https://i.pinimg.com/236x/e8/cd/03/e8cd035b991be253f315ef5880725400.jpg', 12, 800000, N'Thích hợp cho các văn phòng và các shop trưng bày')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (3, N'Hoa Giỏ Hồng Đỏ', N'https://i.pinimg.com/236x/90/c1/24/90c1241b968172304bcbb67e329e928c.jpg', 20, 700000, N'Thích hợp cho các văn phòng và các shop trưng bày')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (4, N'Hoa Giỏ Đỏ Trắng', N'https://i.pinimg.com/236x/90/3b/b2/903bb2fda61345b43a02117c62718bc4.jpg', 20, 700000, N'Thích hợp cho các văn phòng và các shop trưng bày')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (5, N'Hoa Sáp Hướng Dương', N'https://i.pinimg.com/564x/ac/92/46/ac9246e8514e81e69c35a3f318ea18ae.jpg', 20, 700000, N'Thích hợp cho các văn phòng và các shop trưng bày')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (6, N'Hoa Bó Hồng Trắng', N'https://i.pinimg.com/236x/50/35/db/5035dba69717060804c674990887831b.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, lễ trưởng thành')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (7, N'Hoa Giỏ Hướng Dương', N'https://i.pinimg.com/236x/98/ae/c0/98aec09e04e3ae86b36e7d4f96e3b05c.jpg', 20, 200000, N'Thích hợp cho các văn phòng và các shop trưng bày')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (8, N'Hoa Hồng Vàng', N'https://i.pinimg.com/236x/e2/b3/22/e2b322e555f4477cfe69cd186bc3297b.jpg', 12, 300000, N'Thích hợp cho các văn phòng và các shop trưng bày')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (9, N'Hoa Cẩm Tú Cầu', N'https://i.pinimg.com/236x/91/09/d1/9109d13348d2b879f5ff7a1e3ef40341.jpg', 20, 150000, N'Thích hợp cho các văn phòng và các shop trưng bày')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (10, N'Hoa Hồng Trắng', N'https://i.pinimg.com/236x/72/7a/f0/727af0214c11454b4795c66a6cca596a.jpg', 20, 150000, N'Hoa hồng trắng được dành cho các dịp đặt biệt như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (11, N'Hoa Tulip', N'https://i.pinimg.com/236x/d0/35/6b/d0356bf6a816bc15ac598b13a59a49e0.jpg', 20, 100000, N'Thích hợp cho các văn phòng và các shop trưng bày')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (12, N'Hoa Hồng Trắng Valentine', N'https://i.pinimg.com/564x/bd/a0/3f/bda03f3e6f7f8de3b4fb97312340bb4c.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (13, N'Hoa Hồng Bó', N'https://i.pinimg.com/564x/f0/79/66/f07966dbf3bdcc30b9571fd77042ed6a.jpg', 20, 3000000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (14, N'Hoa Tulip Hồng', N'https://i.pinimg.com/236x/49/5e/69/495e6963c1bd78193ee3fe793621b28b.jpg', 20, 150000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (15, N'Hoa Hồng Trắng ', N'https://i.pinimg.com/236x/ac/7c/e2/ac7ce2b5cee4270dbc65d576d2046851.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (16, N'Hoa Hồng-Tulip', N'https://i.pinimg.com/236x/5e/af/7e/5eaf7e0e88e92eed0ed2785375cd6eed.jpg', 20, 200000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (17, N'Hoa Bó', N'https://i.pinimg.com/236x/05/8c/6a/058c6a667943cdec755a9b8c9e7b67bf.jpg', 20, 200000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (18, N'Hoa Hồng Tulip', N'https://i.pinimg.com/564x/f5/1a/7d/f51a7d759fb6515cf6152ac9663a061c.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (19, N'Hoa Tulip', N'https://i.pinimg.com/236x/45/81/48/458148a1380d7a1a603b0d8b3220c1da.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (20, N'Hoa Hướng Dương', N'https://i.pinimg.com/236x/21/e7/0a/21e70aa8ff10b3c6600a2278f6a99694.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (21, N'Hoa Tulip Xanh', N'https://i.pinimg.com/236x/76/9c/69/769c69340d517ac06309ca8342681220.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (22, N'Hoa Hồng Tím', N'https://i.pinimg.com/736x/03/42/f7/0342f7d7fc8044c8bab369e144f77cef.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (23, N'Hoa Tulip Hồng', N'https://i.pinimg.com/236x/52/03/52/520352ab41a498338792e0e64f86f5b5.jpg', 20, 150000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (24, N'Cẩm Tú Cầu', N'https://i.pinimg.com/736x/b6/75/ef/b675ef9b5e733da269cba2585a520509.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (25, N'Hoa Hồng Trắng', N'https://i.pinimg.com/236x/4c/08/76/4c087655172639d82a4f8108c8de9056.jpg', 20, 150000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (26, N'Hoa Hồng Tím', N'https://i.pinimg.com/236x/35/c0/6d/35c06dcecbdc43b60066c86299c72d0f.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (27, N'Hoa Hồng Giỏ', N'https://i.pinimg.com/236x/79/a5/46/79a5466f2dd099a78a05608b9df6360f.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (28, N'Hoa Hồng Trắng Sinh Nhật', N'https://i.pinimg.com/236x/96/85/53/968553e64ea1af1aa930920ab6158488.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (29, N'Hoa Hướng Duong Giỏ', N'	https://i.pinimg.com/236x/d9/0d/23/d90d232c93186e0c5dfbc079c23931fc.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (30, N'Hoa Hồng Bó', N'https://i.pinimg.com/236x/ed/9a/44/ed9a44cb8016531ec915c30ea6cfdb15.jpg', 20, 150000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (31, N'Hoa Giỏ Trắng', N'https://i.pinimg.com/236x/96/5f/d8/965fd8b1f0a55bdbaec91cb3b227426b.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (32, N'Hoa Hồng Sinh Nhật', N'https://i.pinimg.com/236x/74/54/80/745480e382741f0b856bd058158e03fa.jpg', 20, 300000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (33, N'Hoa Hồng Bó', N'https://i.pinimg.com/236x/aa/4c/d5/aa4cd5e52d796586a1413914f9ac9871.jpg', 20, 200000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (34, N'Hoa Hồng Tím', N'https://i.pinimg.com/236x/f9/e9/0c/f9e90c10f0555e028d0396ea68ac61bb.jpg', 20, 350000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (35, N'Hoa Tulip Đỏ', N'https://i.pinimg.com/236x/90/34/6e/90346e61a1afb41ea312eaa827e0ea83.jpg', 20, 300000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (36, N'Hoa Hồng Trắng', N'https://i.pinimg.com/564x/70/2b/37/702b371ab41703167d7aa6b501a8291f.jpg', 20, 150000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (37, N'Hoa Tulip Tím', N'https://i.pinimg.com/236x/e9/40/b6/e940b67682e9804b131e18a4df85f2e3.jpg', 20, 150000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (38, N'Hoa Hồng', N'https://i.pinimg.com/564x/0d/1e/c5/0d1ec58d49c05d364dbbbbb29bdf1466.jpg', 20, 300000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (39, N'Hoa Hồng Đỏ', N'https://i.pinimg.com/564x/0d/1e/c5/0d1ec58d49c05d364dbbbbb29bdf1466.jpg', 20, 250000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (40, N'Hoa Hồng Trái Tym', N'https://i.pinimg.com/236x/25/35/18/253518412081b6f7c92136f2b25d1dd6.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (41, N'Hoa Hồng Giỏ', N'https://i.pinimg.com/236x/b4/0b/f0/b40bf0708f5645c004071e68a64c3885.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (42, N'Hoa Giỏ Sinh Nhật', N'https://i.pinimg.com/236x/13/ac/e2/13ace2309ee4019b038b88cb00567f10.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (43, N'Hoa Giỏ Tulip', N'https://i.pinimg.com/236x/4f/7c/31/4f7c319aba934c0878d8663236b2fa82.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (44, N'Hoa Hướng Dương Giỏ', N'https://i.pinimg.com/236x/a8/62/52/a862527e2398d207f8947b6ba1297651.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (45, N'Hoa Bó Hướng Dương', N'https://i.pinimg.com/236x/43/98/84/4398844b49f5dbc0567615f823f21f59.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (46, N'Hoa Hướng Dương Bó', N'https://i.pinimg.com/236x/d9/d1/8a/d9d18aa58b6fb3d6c66722f0974a7a33.jpg', 20, 70000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (47, N'Hoa Hồng Sáp', N'https://i.pinimg.com/236x/62/2d/f3/622df35b8f4de4d4b7a5c407fc6e78c3.jpg', 20, 100000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (48, N'Hoa Hồng sáp Xanh', N'https://i.pinimg.com/236x/92/60/f5/9260f57dce256087d9b2d4c2c76d4804.jpg', 20, 300000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (49, N'Hoa Hồng sáp', N'https://i.pinimg.com/736x/ab/f5/2b/abf52ba3b91edbe3d39511dbb9df7f88.jpg', 20, 150000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (50, N'Hoa Mẫu đơn', N'https://i.pinimg.com/236x/62/2d/f3/622df35b8f4de4d4b7a5c407fc6e78c3.jpg', 20, 200000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (51, N'Hoa Mẫu Đơn Bó', N'https://i.pinimg.com/564x/31/5f/20/315f201ce82c2f59b340e4fd8fce185b.jpg', 20, 300000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (52, N'Hoa Mẫu Đơn Xanh', N'https://i.pinimg.com/236x/ce/9c/16/ce9c166cb34c4483676ee86cc0517094.jpg', 20, 200000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (53, N'Hoa Mẫu đơn Tím', N'https://i.pinimg.com/236x/9e/8d/4e/9e8d4e60520882551a694c3152c47d07.jpg', 20, 200000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (54, N'Hoa Mẫu Đơn Giỏ', N'https://i.pinimg.com/236x/84/9a/63/849a63e749cbacc55be6db0ac2b1a4d7.jpg', 20, 300000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (55, N'Hoa Mẫu Đơn Hồng', N'https://i.pinimg.com/236x/a8/be/7e/a8be7e3d80be43fb8fb19435d02fb0f7.jpg', 20, 200000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
INSERT [dbo].[Product] ([ID], [FlowerName], [Linkimage], [Quantity], [Price], [Description]) VALUES (56, N'Hoa Hồng', N'https://i.pinimg.com/236x/ac/17/f7/ac17f7037329c770ccd446069403d5e1.jpg', 20, 200000, N'Hoa phù hợp cho các dịp như sinh nhật, Valentine')
GO
INSERT [dbo].[SalesPerson] ([PersonID], [first_name], [last_name], [Salary], [Birthdate], [Gender], [Hiring_date], [Mobile_number]) VALUES (1, N'Nguyen Hoang', N'Nam', 5400000, CAST(N'1988-12-21' AS Date), N'Male', CAST(N'2020-07-12' AS Date), N'0931174477')
INSERT [dbo].[SalesPerson] ([PersonID], [first_name], [last_name], [Salary], [Birthdate], [Gender], [Hiring_date], [Mobile_number]) VALUES (2, N'Nguyen Trong', N'Hieu', 5300000, CAST(N'1993-09-11' AS Date), N'Male', CAST(N'2020-10-01' AS Date), N'0931165444')
INSERT [dbo].[SalesPerson] ([PersonID], [first_name], [last_name], [Salary], [Birthdate], [Gender], [Hiring_date], [Mobile_number]) VALUES (3, N'Truong My', N'Linh', 5000000, CAST(N'1996-02-11' AS Date), N'Female', CAST(N'2020-02-01' AS Date), N'0932681144')
GO
ALTER TABLE [dbo].[Buy]  WITH CHECK ADD FOREIGN KEY([GreenHouseID])
REFERENCES [dbo].[GreenHouse] ([ID])
GO
ALTER TABLE [dbo].[Flower]  WITH CHECK ADD FOREIGN KEY([FlowerColorID])
REFERENCES [dbo].[Colour] ([ColorID])
GO
ALTER TABLE [dbo].[Flower]  WITH CHECK ADD FOREIGN KEY([GreenHouseID])
REFERENCES [dbo].[GreenHouse] ([ID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([Gender]='Male' OR [Gender]='Female'))
GO
ALTER TABLE [dbo].[Occasion]  WITH CHECK ADD CHECK  (([Title]='Other' OR [Title]='Chúc Mừng' OR [Title]='Valentine' OR [Title]='Sinh Nhật'))
GO
ALTER TABLE [dbo].[SalesPerson]  WITH CHECK ADD CHECK  (([gender]='Male' OR [gender]='Female'))
GO
USE [master]
GO
ALTER DATABASE [ShopFlower] SET  READ_WRITE 
GO
