USE [master]
GO
/****** Object:  Database [Dixoteka]    Script Date: 6/17/2021 8:46:10 PM ******/
CREATE DATABASE [Dixoteka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dixoteka', FILENAME = N'E:\baze pdc\MSSQL14.SQLEXPRESS\MSSQL\DATA\Dixoteka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dixoteka_log', FILENAME = N'E:\baze pdc\MSSQL14.SQLEXPRESS\MSSQL\DATA\Dixoteka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Dixoteka] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dixoteka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dixoteka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dixoteka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dixoteka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dixoteka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dixoteka] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dixoteka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dixoteka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dixoteka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dixoteka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dixoteka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dixoteka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dixoteka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dixoteka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dixoteka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dixoteka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dixoteka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dixoteka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dixoteka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dixoteka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dixoteka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dixoteka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dixoteka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dixoteka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Dixoteka] SET  MULTI_USER 
GO
ALTER DATABASE [Dixoteka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dixoteka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dixoteka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dixoteka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dixoteka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Dixoteka] SET QUERY_STORE = OFF
GO
USE [Dixoteka]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2021 8:46:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 6/17/2021 8:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[Actor] [nvarchar](max) NULL,
	[UseCaseName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 6/17/2021 8:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductId] [int] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/17/2021 8:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 6/17/2021 8:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductId] [int] NULL,
	[OrderId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/17/2021 8:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[ZIPCode] [nvarchar](max) NULL,
	[IsGift] [bit] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[DeliverDate] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/17/2021 8:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsNew] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2021 8:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](450) NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/17/2021 8:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UseCaseId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210611175907_initial_migration', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210615181535_updated-database', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210616172659_updated-userusecase-table', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[AuditLogs] ON 

INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (1, CAST(N'2021-06-15T21:02:00.3011052' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (2, CAST(N'2021-06-15T21:17:44.8676442' AS DateTime2), N'{"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (3, CAST(N'2021-06-15T21:19:57.4705834' AS DateTime2), N'{"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (4, CAST(N'2021-06-15T21:22:57.5246084' AS DateTime2), N'{"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (5, CAST(N'2021-06-16T11:02:36.0177111' AS DateTime2), N'{"Name":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get categories query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (6, CAST(N'2021-06-16T11:11:49.9994737' AS DateTime2), N'{"DateFrom":"0001-01-01T00:00:00","DateTo":"0001-01-01T00:00:00","UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (7, CAST(N'2021-06-16T11:18:40.7291639' AS DateTime2), N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (8, CAST(N'2021-06-16T11:19:33.6813447' AS DateTime2), N'{"DateFrom":null,"DateTo":"2021-06-15","UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (9, CAST(N'2021-06-16T11:21:11.7397698' AS DateTime2), N'{"DateFrom":null,"DateTo":"2021-06-15","UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (10, CAST(N'2021-06-16T11:21:30.6540389' AS DateTime2), N'{"DateFrom":null,"DateTo":"2021-06-15?page=2","UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (11, CAST(N'2021-06-16T11:22:13.8440657' AS DateTime2), N'{"DateFrom":null,"DateTo":"2021-06-15","UseCaseName":null,"Actor":null,"PerPage":1,"Page":2}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (12, CAST(N'2021-06-16T12:21:25.4960115' AS DateTime2), N'1', NULL, N'Anonymus', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (13, CAST(N'2021-06-16T12:25:01.9058602' AS DateTime2), N'{"Id":0,"Quantity":7,"Price":0.0,"ProductId":5,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (14, CAST(N'2021-06-16T12:30:33.8146177' AS DateTime2), N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (15, CAST(N'2021-06-16T12:30:54.4454181' AS DateTime2), N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Actor":null,"PerPage":20,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (16, CAST(N'2021-06-16T12:31:34.6985256' AS DateTime2), N'{"DateFrom":null,"DateTo":"2021-06-15","UseCaseName":null,"Actor":null,"PerPage":20,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (17, CAST(N'2021-06-16T12:31:48.2618850' AS DateTime2), N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (18, CAST(N'2021-06-16T12:32:03.3795967' AS DateTime2), N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Actor":null,"PerPage":1,"Page":18}', NULL, N'Anonymus', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (19, CAST(N'2021-06-16T13:24:47.2162041' AS DateTime2), N'{"Id":0,"Quantity":7,"Price":0.0,"ProductId":5,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (20, CAST(N'2021-06-16T13:28:23.1714528' AS DateTime2), N'{"Id":0,"Name":"imaproizvod","Description":"sa slikom","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"36hld1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"36hld1.jpg\""],"Content-Type":["image/jpeg"]},"Length":60621,"Name":"UploadedImage","FileName":"36hld1.jpg"},"Image":"0a3dbb91-14a2-4df5-af85-364b572877ba.jpg","Price":4000.0,"IsNew":true,"CategoryId":3,"Quantity":250}', NULL, N'Anonymus', N'create product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (21, CAST(N'2021-06-16T13:28:59.7619965' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (22, CAST(N'2021-06-16T13:29:06.5454822' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":6}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (23, CAST(N'2021-06-16T13:29:52.7205476' AS DateTime2), N'{"Id":0,"Quantity":7,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (24, CAST(N'2021-06-16T13:30:00.2636308' AS DateTime2), N'1', NULL, N'Anonymus', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (25, CAST(N'2021-06-16T13:31:53.0763956' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"nedje u blizini","City":"selo","ZIPCode":"011","IsGift":true,"Note":"dobro je","DeliverDate":"2021-06-15T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (26, CAST(N'2021-06-16T13:32:31.7522254' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"nedje u blizini","City":"selo","ZIPCode":"011","IsGift":true,"Note":"dobro je","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (27, CAST(N'2021-06-16T13:34:37.2651443' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"nedje u blizini","City":"selo","ZIPCode":"011","IsGift":true,"Note":"dobro je","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (28, CAST(N'2021-06-16T13:35:06.7982667' AS DateTime2), N'1', NULL, N'Anonymus', N'get order query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (29, CAST(N'2021-06-16T13:35:20.9815978' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (30, CAST(N'2021-06-16T13:35:25.5785618' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":6}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (31, CAST(N'2021-06-16T13:35:47.6746735' AS DateTime2), N'1', NULL, N'Anonymus', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (32, CAST(N'2021-06-16T13:35:56.0589905' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":6}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (33, CAST(N'2021-06-16T13:37:10.2806074' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":6}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (34, CAST(N'2021-06-16T13:43:21.2258887' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":6}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (35, CAST(N'2021-06-16T13:43:31.5198855' AS DateTime2), N'7', NULL, N'Anonymus', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (36, CAST(N'2021-06-16T14:04:38.2834940' AS DateTime2), N'1004', NULL, N'Anonymus', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (37, CAST(N'2021-06-16T14:05:02.5465183' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (38, CAST(N'2021-06-16T14:22:32.4714032' AS DateTime2), N'{"Id":0,"Quantity":7,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (39, CAST(N'2021-06-16T14:22:43.7760764' AS DateTime2), N'1', NULL, N'Anonymus', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (40, CAST(N'2021-06-16T14:22:56.0992813' AS DateTime2), N'7', NULL, N'Anonymus', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (41, CAST(N'2021-06-16T14:27:16.1689578' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"opet","City":"selo","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (42, CAST(N'2021-06-16T14:29:53.7482428' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"opet","City":"selo","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (43, CAST(N'2021-06-16T14:30:18.1322236' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (44, CAST(N'2021-06-16T14:30:25.9004437' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":7}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (45, CAST(N'2021-06-16T14:30:40.8004112' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":6}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (46, CAST(N'2021-06-16T14:31:00.3601129' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":7}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (47, CAST(N'2021-06-16T14:32:27.6549457' AS DateTime2), N'{"Id":0,"Quantity":10,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (48, CAST(N'2021-06-16T14:33:04.9314420' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"selo","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (49, CAST(N'2021-06-16T14:37:40.1875202' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (50, CAST(N'2021-06-16T14:37:54.2864337' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"selo","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (51, CAST(N'2021-06-16T14:39:05.9797760' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (52, CAST(N'2021-06-16T14:39:14.8138379' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"selo","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (53, CAST(N'2021-06-16T14:39:21.3107670' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (54, CAST(N'2021-06-16T14:39:26.9941880' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":10}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (55, CAST(N'2021-06-16T14:39:36.4196242' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":9}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (56, CAST(N'2021-06-16T15:14:00.4791603' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (57, CAST(N'2021-06-16T15:14:35.3940246' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (58, CAST(N'2021-06-16T15:19:38.3780463' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (59, CAST(N'2021-06-16T15:19:49.7330344' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (60, CAST(N'2021-06-16T15:22:36.0791156' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (61, CAST(N'2021-06-16T15:22:53.1607135' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (62, CAST(N'2021-06-16T16:18:49.9306350' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (63, CAST(N'2021-06-16T16:19:09.2102435' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (64, CAST(N'2021-06-16T16:20:30.4129643' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (65, CAST(N'2021-06-16T16:20:40.5678958' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (66, CAST(N'2021-06-16T16:20:53.6025948' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (67, CAST(N'2021-06-16T16:21:06.5913006' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":15}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (68, CAST(N'2021-06-16T17:44:44.3685362' AS DateTime2), N'{"Id":0,"Username":"dixyadmin","FirstName":"Dixy","LastName":"Admin","Password":"admin","Email":"dixy@gmail.kom","AllowedUseCases":[11,12,5,20,21,22,23,24,1,9,4,35]}', NULL, N'Anonymus', N'Create user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (69, CAST(N'2021-06-16T17:46:16.7089766' AS DateTime2), N'{"Id":0,"Username":"dixyadmin","FirstName":"Dixy","LastName":"Admin","Password":"admindixy","Email":"dixy@gmail.kom","AllowedUseCases":[11,12,5,20,21,22,23,24,1,9,4,35]}', NULL, N'Anonymus', N'Create user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (70, CAST(N'2021-06-16T17:46:24.5912220' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (71, CAST(N'2021-06-16T17:46:33.3392240' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":4}', NULL, N'Anonymus', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (72, CAST(N'2021-06-16T17:51:06.2508895' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":4}', NULL, N'Anonymus', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (73, CAST(N'2021-06-16T17:51:25.5121500' AS DateTime2), N'1005', NULL, N'Anonymus', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (74, CAST(N'2021-06-16T17:52:34.5353628' AS DateTime2), N'1005', NULL, N'Anonymus', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (75, CAST(N'2021-06-16T18:42:13.9360390' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (76, CAST(N'2021-06-16T18:42:37.8859015' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (77, CAST(N'2021-06-16T18:42:43.4150813' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (78, CAST(N'2021-06-16T18:45:35.4272303' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (79, CAST(N'2021-06-16T18:45:54.4310966' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (80, CAST(N'2021-06-16T18:52:08.7051054' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (81, CAST(N'2021-06-16T18:52:27.7851681' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (82, CAST(N'2021-06-16T19:27:16.6165281' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (83, CAST(N'2021-06-16T19:33:56.8385969' AS DateTime2), N'{"Id":1005,"Username":"dixyadmin","FirstName":"Dixy","LastName":"Admin","Password":"admindixy","Email":"dixy@gmail.kom","AllowedUseCases":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]}', NULL, N'Anonymus', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (84, CAST(N'2021-06-16T19:40:19.0232932' AS DateTime2), N'{"Id":1005,"Username":"dixyadmin","FirstName":"Dixy","LastName":"Admin","Password":"admindixy","Email":"dixy@gmail.kom","AllowedUseCases":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]}', NULL, N'Anonymus', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (85, CAST(N'2021-06-16T19:41:12.1270223' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (86, CAST(N'2021-06-16T19:42:59.1680055' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (87, CAST(N'2021-06-16T19:43:17.4600338' AS DateTime2), N'{"Id":1005,"Username":"dixyadmin","FirstName":"Dixy","LastName":"Admin","Password":"admindixy","Email":"dixy@gmail.kom","AllowedUseCases":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]}', NULL, N'Anonymus', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (88, CAST(N'2021-06-16T19:51:31.1685694' AS DateTime2), N'{"Id":1005,"Username":"dixyadmin","FirstName":"Dixy","LastName":"Admin","Password":"admindixy","Email":"dixy@gmail.kom","AllowedUseCases":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]}', NULL, N'Anonymus', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (89, CAST(N'2021-06-17T10:38:49.8665536' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"sta sad","City":"jok ti si (tyci) ahaha tuci","ZIPCode":"011","IsGift":true,"Note":"ja","DeliverDate":"2021-06-25T17:16:40","UserId":1,"Items":[]}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (90, CAST(N'2021-06-17T10:39:52.3863215' AS DateTime2), N'7', NULL, N'Anonymus', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (91, CAST(N'2021-06-17T10:40:25.7561114' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (92, CAST(N'2021-06-17T10:40:36.5093561' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":3,"Page":1}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (93, CAST(N'2021-06-17T10:40:42.4804324' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":3,"Page":2}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (94, CAST(N'2021-06-17T10:40:55.1779015' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (95, CAST(N'2021-06-17T10:42:11.5503188' AS DateTime2), N'{"Id":0,"Quantity":1,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":1}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (96, CAST(N'2021-06-17T10:43:03.8346773' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (97, CAST(N'2021-06-17T10:43:55.1809181' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":3,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (98, CAST(N'2021-06-17T10:44:02.2260621' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (99, CAST(N'2021-06-17T10:45:34.1490631' AS DateTime2), N'{"Name":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get categories query')
GO
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (100, CAST(N'2021-06-17T10:45:56.5870060' AS DateTime2), N'{"Name":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get categories query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (101, CAST(N'2021-06-17T10:46:12.2137668' AS DateTime2), N'{"Name":null,"PerPage":20,"Page":1}', NULL, N'dixyadmin', N'get categories query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (102, CAST(N'2021-06-17T10:46:27.0613451' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (103, CAST(N'2021-06-17T10:46:43.3434523' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (104, CAST(N'2021-06-17T10:47:49.7062534' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T17:16:40","UserId":0,"Items":[]}', NULL, N'dixyadmin', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (105, CAST(N'2021-06-17T10:48:26.4897697' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T17:16:40","UserId":0,"Items":[]}', NULL, N'dixyadmin', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (106, CAST(N'2021-06-17T11:00:43.5667992' AS DateTime2), N'1005', NULL, N'Anonymus', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (107, CAST(N'2021-06-17T11:01:54.8772970' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (108, CAST(N'2021-06-17T11:02:16.1334965' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T17:16:40","UserId":0,"Items":[]}', NULL, N'dixyadmin', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (109, CAST(N'2021-06-17T11:03:11.2686850' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T17:16:40","UserId":0,"Items":[]}', NULL, N'dixyadmin', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (110, CAST(N'2021-06-17T11:03:30.6355662' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (111, CAST(N'2021-06-17T11:03:39.8100268' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":19}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (112, CAST(N'2021-06-17T11:04:03.0194090' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (113, CAST(N'2021-06-17T11:04:44.7731512' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":5,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (114, CAST(N'2021-06-17T11:04:49.2317311' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (115, CAST(N'2021-06-17T11:05:22.4180634' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (116, CAST(N'2021-06-17T11:05:28.1701479' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (117, CAST(N'2021-06-17T11:06:20.6166361' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (118, CAST(N'2021-06-17T11:07:25.5582245' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (119, CAST(N'2021-06-17T11:08:05.2898288' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T17:16:40","UserId":0,"Items":[]}', NULL, N'dixyadmin', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (120, CAST(N'2021-06-17T11:08:13.6186065' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (121, CAST(N'2021-06-17T11:08:17.8305408' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":20}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (122, CAST(N'2021-06-17T11:20:50.8802633' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (123, CAST(N'2021-06-17T11:21:34.0429234' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (124, CAST(N'2021-06-17T11:21:36.4458482' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (125, CAST(N'2021-06-17T11:21:37.7616795' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (126, CAST(N'2021-06-17T11:21:38.9442916' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (127, CAST(N'2021-06-17T11:21:44.9751530' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (128, CAST(N'2021-06-17T11:24:12.3815180' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (129, CAST(N'2021-06-17T11:24:20.4041337' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (130, CAST(N'2021-06-17T11:24:21.5704169' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (131, CAST(N'2021-06-17T11:54:22.2598867' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'Anonymus', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (132, CAST(N'2021-06-17T11:55:08.9304369' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (133, CAST(N'2021-06-17T11:56:01.1081475' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (134, CAST(N'2021-06-17T11:56:29.7672768' AS DateTime2), N'{"Id":0,"Quantity":5,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (135, CAST(N'2021-06-17T11:56:41.0759942' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (136, CAST(N'2021-06-17T11:56:51.5821768' AS DateTime2), N'26', NULL, N'dixyadmin', N'delete cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (137, CAST(N'2021-06-17T11:56:59.9782933' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (138, CAST(N'2021-06-17T11:57:17.4582370' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":3,"Page":2}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (139, CAST(N'2021-06-17T11:57:34.9887220' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":3,"Page":1}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (140, CAST(N'2021-06-17T11:58:21.0026606' AS DateTime2), N'{"Id":0,"Quantity":-15,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (141, CAST(N'2021-06-17T11:58:36.1510079' AS DateTime2), N'{"Id":0,"Quantity":15,"Price":0.0,"ProductId":44,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (142, CAST(N'2021-06-17T11:58:43.3791519' AS DateTime2), N'{"Id":0,"Quantity":15,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (143, CAST(N'2021-06-17T11:58:46.1003496' AS DateTime2), N'{"Id":0,"Quantity":15,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (144, CAST(N'2021-06-17T11:58:47.6276755' AS DateTime2), N'{"Id":0,"Quantity":15,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (145, CAST(N'2021-06-17T11:59:02.3742560' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":3,"Page":1}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (146, CAST(N'2021-06-17T11:59:31.2834900' AS DateTime2), N'{"Id":0,"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T17:16:40","UserId":0,"Items":[]}', NULL, N'dixyadmin', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (147, CAST(N'2021-06-17T11:59:42.0731458' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":20}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (148, CAST(N'2021-06-17T11:59:44.8824770' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":21}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (149, CAST(N'2021-06-17T11:59:58.8747390' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":3,"Page":1}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (150, CAST(N'2021-06-17T12:00:12.6101933' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (151, CAST(N'2021-06-17T12:04:09.0195011' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (152, CAST(N'2021-06-17T12:04:22.0974867' AS DateTime2), N'1005', NULL, N'Anonymus', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (153, CAST(N'2021-06-17T12:12:18.0286786' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,11,35,2]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (154, CAST(N'2021-06-17T12:13:07.1547093' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (155, CAST(N'2021-06-17T12:14:10.8421697' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (156, CAST(N'2021-06-17T12:18:57.3856943' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (157, CAST(N'2021-06-17T12:42:24.1039375' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2,11]}', NULL, N'Anonymus', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (158, CAST(N'2021-06-17T12:43:52.8861849' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2,11]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (159, CAST(N'2021-06-17T12:46:09.9381839' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2,11]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (160, CAST(N'2021-06-17T12:57:35.5562053' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2,11]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (161, CAST(N'2021-06-17T12:59:45.5083993' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2,11]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (162, CAST(N'2021-06-17T13:00:39.4579906' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,24,25,12,35,2,11]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (163, CAST(N'2021-06-17T13:05:11.9465866' AS DateTime2), N'{"Id":1004,"Username":"adminsejeja","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[11,12,20,21,22,23,24,9,35]}', NULL, N'Anonymus', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (164, CAST(N'2021-06-17T13:06:03.3986239' AS DateTime2), N'{"Id":1004,"Username":"adminsejeja","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[11,12,20,21,22,23,24,9,35]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (165, CAST(N'2021-06-17T13:06:57.5311693' AS DateTime2), N'{"Id":1004,"Username":"adminsam","FirstName":"Admin","LastName":"Adminic","Password":"admince","Email":"adma@gmail.kom","AllowedUseCases":[3,24,10,1,6,13,8,7,14,9,4,5,30,25,12,35,2,11]}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (166, CAST(N'2021-06-17T13:23:27.8945094' AS DateTime2), N'1005', NULL, N'Anonymus', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (167, CAST(N'2021-06-17T13:23:48.4525073' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (168, CAST(N'2021-06-17T13:24:00.2364835' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (169, CAST(N'2021-06-17T13:24:06.8595495' AS DateTime2), N'{"Id":0,"Quantity":15,"Price":0.0,"ProductId":4,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (170, CAST(N'2021-06-17T13:24:29.0641443' AS DateTime2), N'{"Id":0,"Quantity":15,"Price":0.0,"ProductId":7,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (171, CAST(N'2021-06-17T13:24:41.4727205' AS DateTime2), N'{"Id":0,"Quantity":17,"Price":0.0,"ProductId":1,"ProductName":null,"UserId":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (172, CAST(N'2021-06-17T13:24:47.1376853' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (173, CAST(N'2021-06-17T13:43:51.2016537' AS DateTime2), N'{"Name":"imaproizvod","Description":"sa slikom","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"230-2303898_dark-night-moon.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"230-2303898_dark-night-moon.jpg\""],"Content-Type":["image/jpeg"]},"Length":126530,"Name":"UploadedImage","FileName":"230-2303898_dark-night-moon.jpg"},"Image":"d18ffc58-5d03-486f-968c-ce9eeac41a41.jpg","Price":4000.0,"IsNew":true,"CategoryId":3,"Quantity":250,"Id":0}', NULL, N'dixyadmin', N'update product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (174, CAST(N'2021-06-17T13:45:30.8603124' AS DateTime2), N'{"Name":"imaproizvod","Description":"sa slikom","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"230-2303898_dark-night-moon.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"230-2303898_dark-night-moon.jpg\""],"Content-Type":["image/jpeg"]},"Length":126530,"Name":"UploadedImage","FileName":"230-2303898_dark-night-moon.jpg"},"Image":"3d7cea36-e716-42e8-8e56-dfebc7d75871.jpg","Price":4000.0,"IsNew":true,"CategoryId":3,"Quantity":250,"Id":1}', NULL, N'dixyadmin', N'update product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (175, CAST(N'2021-06-17T13:45:43.0938239' AS DateTime2), N'1', NULL, N'dixyadmin', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (176, CAST(N'2021-06-17T13:48:27.3117676' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (177, CAST(N'2021-06-17T13:48:36.1238193' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":6}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (178, CAST(N'2021-06-17T13:51:22.9339314' AS DateTime2), N'{"Name":null,"Description":"sa slikom","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"230-2303898_dark-night-moon.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"230-2303898_dark-night-moon.jpg\""],"Content-Type":["image/jpeg"]},"Length":126530,"Name":"UploadedImage","FileName":"230-2303898_dark-night-moon.jpg"},"Image":"935b0153-3e6f-4ef9-8990-621fdc14b3f1.jpg","Price":0.0,"IsNew":true,"CategoryId":3,"Quantity":250,"Id":0}', NULL, N'dixyadmin', N'create product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (179, CAST(N'2021-06-17T13:51:46.7352305' AS DateTime2), N'{"Name":"imaproizvod","Description":"sa slikom","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"230-2303898_dark-night-moon.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"230-2303898_dark-night-moon.jpg\""],"Content-Type":["image/jpeg"]},"Length":126530,"Name":"UploadedImage","FileName":"230-2303898_dark-night-moon.jpg"},"Image":"946cb9a9-e00e-4ebf-9ef0-54c908cb5816.jpg","Price":4000.0,"IsNew":true,"CategoryId":3,"Quantity":250,"Id":0}', NULL, N'dixyadmin', N'create product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (180, CAST(N'2021-06-17T13:51:51.5847390' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (181, CAST(N'2021-06-17T13:51:55.8226129' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":7}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (182, CAST(N'2021-06-17T13:52:19.4587415' AS DateTime2), N'{"Name":"imaproizvod","Description":"sa slikom","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\""],"Content-Type":["image/jpeg"]},"Length":679056,"Name":"UploadedImage","FileName":"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg"},"Image":"4dd3c680-f01b-45be-9e10-654f4c0a3e6b.jpg","Price":4000.0,"IsNew":true,"CategoryId":3,"Quantity":250,"Id":8}', NULL, N'dixyadmin', N'update product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (183, CAST(N'2021-06-17T13:52:25.7380907' AS DateTime2), N'8', NULL, N'dixyadmin', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (184, CAST(N'2021-06-17T13:54:37.6819233' AS DateTime2), N'{"Name":"sanovomslikom","Description":"sa slikom","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\""],"Content-Type":["image/jpeg"]},"Length":679056,"Name":"UploadedImage","FileName":"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg"},"Image":"f439503c-a687-4943-933c-5646b73e446a.jpg","Price":4000.0,"IsNew":true,"CategoryId":3,"Quantity":250,"Id":8}', NULL, N'dixyadmin', N'update product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (185, CAST(N'2021-06-17T13:54:48.7362542' AS DateTime2), N'8', NULL, N'dixyadmin', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (186, CAST(N'2021-06-17T13:56:16.1643880' AS DateTime2), N'8', NULL, N'dixyadmin', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (187, CAST(N'2021-06-17T13:56:26.2363708' AS DateTime2), N'{"Name":"sanovomslikom","Description":"sa slikom","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\""],"Content-Type":["image/jpeg"]},"Length":679056,"Name":"UploadedImage","FileName":"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg"},"Image":"790b70a9-5e73-4a17-a91a-32c3d6d3dced.jpg","Price":4000.0,"IsNew":true,"CategoryId":3,"Quantity":250,"Id":8}', NULL, N'dixyadmin', N'update product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (188, CAST(N'2021-06-17T13:56:30.8610674' AS DateTime2), N'8', NULL, N'dixyadmin', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (189, CAST(N'2021-06-17T14:05:01.1718554' AS DateTime2), N'{"Name":"Kronat borovnica","Description":"Ovo je pravi izbor kad se dvoumiš da li želiš čokoladni ili voćni kronat. Duplo punjenje šumskog voća i lešnik krema u kronatu – kombinacija kroasana i krofne, iznutra mekano puterasto testo, a spolja crunchy cimet i smeđi šećer.","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\""],"Content-Type":["image/jpeg"]},"Length":679056,"Name":"UploadedImage","FileName":"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg"},"Image":"784b75f8-6525-45cd-902d-5ae0f965c51e.jpg","Price":140.0,"IsNew":false,"CategoryId":3,"Quantity":250,"Id":0}', NULL, N'dixyadmin', N'create product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (190, CAST(N'2021-06-17T14:05:22.5170219' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (191, CAST(N'2021-06-17T14:05:28.5021866' AS DateTime2), N'9', NULL, N'dixyadmin', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (192, CAST(N'2021-06-17T14:15:57.1855758' AS DateTime2), N'{"Username":"nikakokoko","FirstName":"Banovan","LastName":"Korisnik","Password":"nevaljaovaj","Email":"ode@gmail.kom","AllowedUseCases":[11,12,20,21,22,23,24,9,35],"Id":0}', NULL, N'Anonymus', N'Create user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (193, CAST(N'2021-06-17T14:16:09.0840745' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (194, CAST(N'2021-06-17T14:16:51.3256538' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (195, CAST(N'2021-06-17T14:16:56.5678135' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":5}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (196, CAST(N'2021-06-17T14:17:55.1369481' AS DateTime2), N'{"Username":"nikakokdsaldaoko","FirstName":"BaOpetnovan","LastName":"Izmenjen","Password":"nevaljaovajdas","Email":"ode@gmail.sda","AllowedUseCases":[11,12,20,21,22,23,24,9,35],"Id":1006}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (197, CAST(N'2021-06-17T14:17:59.1183977' AS DateTime2), N'1006', NULL, N'dixyadmin', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (198, CAST(N'2021-06-17T14:19:38.6124013' AS DateTime2), N'1006', NULL, N'dixyadmin', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (199, CAST(N'2021-06-17T14:20:47.5421596' AS DateTime2), N'1006', NULL, N'dixyadmin', N'get category query')
GO
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (200, CAST(N'2021-06-17T14:22:42.5011658' AS DateTime2), N'1006', NULL, N'dixyadmin', N'get user query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (201, CAST(N'2021-06-17T14:23:13.5136636' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (202, CAST(N'2021-06-17T14:23:25.9289048' AS DateTime2), N'1', NULL, N'dixyadmin', N'get user query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (203, CAST(N'2021-06-17T14:25:52.4497883' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":6}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (204, CAST(N'2021-06-17T14:25:56.8419268' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":5}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (205, CAST(N'2021-06-17T14:26:12.1612301' AS DateTime2), N'{"Username":"nikakokdsaldaoko","FirstName":"BaOpetnovan","LastName":"Izmenjen","Password":"nevaljaovajdas","Email":"ode@gmail.sda","AllowedUseCases":[11,12,20,21,22,23,24,9,35],"Id":1006}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (206, CAST(N'2021-06-17T14:26:21.1574984' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":5}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (207, CAST(N'2021-06-17T14:27:26.9051050' AS DateTime2), N'{"Username":"nikakokdsaldaoko","FirstName":"BaOpetnovan","LastName":"Izmenjen","Password":"nevaljaovajdas","Email":"ode@gmail.sda","AllowedUseCases":[11,12,20,21,22,23,24,9,35],"Id":1006}', NULL, N'dixyadmin', N'update user command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (208, CAST(N'2021-06-17T14:28:03.6071973' AS DateTime2), N'1006', NULL, N'dixyadmin', N'get user query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (209, CAST(N'2021-06-17T14:28:11.8228623' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (210, CAST(N'2021-06-17T14:28:15.5769339' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":5}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (211, CAST(N'2021-06-17T14:28:42.3090239' AS DateTime2), N'{"Name":"Kronat borovnica","Description":"Ovo je pravi izbor kad se dvoumiš da li želiš čokoladni ili voćni kronat. Duplo punjenje šumskog voća i lešnik krema u kronatu – kombinacija kroasana i krofne, iznutra mekano puterasto testo, a spolja crunchy cimet i smeđi šećer.","UploadedImage":{"ContentDisposition":"form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"UploadedImage\"; filename=\"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg\""],"Content-Type":["image/jpeg"]},"Length":679056,"Name":"UploadedImage","FileName":"519152-nature-backgrounds-hd-1920x1080-for-ipad-pro.jpg"},"Image":"51c5245e-61af-43fd-8aef-1344bb9bdd5f.jpg","Price":140.0,"IsNew":false,"CategoryId":3,"Quantity":255,"Id":9}', NULL, N'dixyadmin', N'update product command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (212, CAST(N'2021-06-17T14:28:46.9024197' AS DateTime2), N'9', NULL, N'dixyadmin', N'get product query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (213, CAST(N'2021-06-17T14:28:59.6976102' AS DateTime2), N'1005', NULL, N'Anonymus', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (214, CAST(N'2021-06-17T14:29:38.1472825' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (215, CAST(N'2021-06-17T14:30:26.1964518' AS DateTime2), N'{"Quantity":7,"Price":0.0,"ProductId":1,"ProductName":null,"UserId":0,"Id":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (216, CAST(N'2021-06-17T14:30:32.5695852' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (217, CAST(N'2021-06-17T14:37:52.5139440' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (218, CAST(N'2021-06-17T14:39:13.2773289' AS DateTime2), N'{"Quantity":127,"Price":0.0,"ProductId":1,"ProductName":null,"UserId":0,"Id":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (219, CAST(N'2021-06-17T14:39:25.1607958' AS DateTime2), N'{"Quantity":12,"Price":0.0,"ProductId":1,"ProductName":null,"UserId":0,"Id":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (220, CAST(N'2021-06-17T14:39:28.7270456' AS DateTime2), N'{"Quantity":12,"Price":0.0,"ProductId":1,"ProductName":null,"UserId":0,"Id":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (221, CAST(N'2021-06-17T14:39:53.2506678' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (222, CAST(N'2021-06-17T14:40:07.3243621' AS DateTime2), N'29', NULL, N'dixyadmin', N'delete cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (223, CAST(N'2021-06-17T14:40:16.9976864' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (224, CAST(N'2021-06-17T14:40:35.2328527' AS DateTime2), N'{"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T17:16:40","UserId":0,"Items":[],"Id":0}', NULL, N'Anonymus', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (225, CAST(N'2021-06-17T14:40:52.2361447' AS DateTime2), N'{"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T17:16:40","UserId":0,"Items":[],"Id":0}', NULL, N'dixyadmin', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (226, CAST(N'2021-06-17T14:41:02.9949011' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (227, CAST(N'2021-06-17T14:41:07.0614039' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":22}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (228, CAST(N'2021-06-17T15:08:17.1175678' AS DateTime2), N'1005', NULL, N'dixyadmin', N'get cart')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (229, CAST(N'2021-06-17T15:08:46.7096432' AS DateTime2), N'{"Quantity":2,"Price":0.0,"ProductId":1,"ProductName":null,"UserId":0,"Id":0}', NULL, N'dixyadmin', N'create cart command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (230, CAST(N'2021-06-17T15:09:23.8295151' AS DateTime2), N'{"Phone":"064564564","Address":"kod mene","City":"ovde","ZIPCode":"011","IsGift":true,"Note":"eo","DeliverDate":"2021-06-25T07:06:40","UserId":0,"Items":[],"Id":0}', NULL, N'dixyadmin', N'create order command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (231, CAST(N'2021-06-17T15:11:53.0958712' AS DateTime2), N'{"Name":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get categories query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (232, CAST(N'2021-06-17T15:12:21.8393758' AS DateTime2), N'{"Name":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get categories query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (233, CAST(N'2021-06-17T15:12:31.9222889' AS DateTime2), N'{"Name":null,"PerPage":1,"Page":3}', NULL, N'dixyadmin', N'get categories query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (234, CAST(N'2021-06-17T15:13:25.2553696' AS DateTime2), N'{"Name":"Krofnice","Id":4}', NULL, N'dixyadmin', N'update category command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (235, CAST(N'2021-06-17T15:13:37.6617246' AS DateTime2), N'{"Name":"TORte (s'' cekicem:)","Id":4}', NULL, N'dixyadmin', N'update category command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (236, CAST(N'2021-06-17T15:13:42.7826880' AS DateTime2), N'4', NULL, N'dixyadmin', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (237, CAST(N'2021-06-17T15:18:20.3124919' AS DateTime2), N'{"Name":"TORte (s'' cekicem:)","Id":4}', NULL, N'dixyadmin', N'update category command')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (238, CAST(N'2021-06-17T15:18:44.4263892' AS DateTime2), N'4', NULL, N'dixyadmin', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (239, CAST(N'2021-06-17T15:18:59.3973480' AS DateTime2), N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Actor":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get audit logs query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (240, CAST(N'2021-06-17T15:19:24.4434846' AS DateTime2), N'{"Name":"kr","PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get categories query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (241, CAST(N'2021-06-17T15:19:40.7581900' AS DateTime2), N'{"Keyword":"kod","IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (242, CAST(N'2021-06-17T15:19:55.9781496' AS DateTime2), N'{"Keyword":"ban","IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (243, CAST(N'2021-06-17T15:20:16.0116585' AS DateTime2), N'{"Keyword":"ban","MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (244, CAST(N'2021-06-17T15:20:23.1291077' AS DateTime2), N'{"Keyword":"kr","MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (245, CAST(N'2021-06-17T15:20:31.6389435' AS DateTime2), N'{"Keyword":"krofn","MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (246, CAST(N'2021-06-17T15:20:34.0646029' AS DateTime2), N'{"Keyword":"krofnice","MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (247, CAST(N'2021-06-17T15:20:48.2578843' AS DateTime2), N'{"Keyword":":)","MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (248, CAST(N'2021-06-17T15:21:31.8996411' AS DateTime2), N'4', NULL, N'dixyadmin', N'get category query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (249, CAST(N'2021-06-17T15:21:53.5273315' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":4,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (250, CAST(N'2021-06-17T15:22:06.2346980' AS DateTime2), N'{"Username":null,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (251, CAST(N'2021-06-17T15:22:20.5425838' AS DateTime2), N'{"Username":"opet","PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (252, CAST(N'2021-06-17T15:22:25.5244865' AS DateTime2), N'{"Username":"admi","PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get users query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (253, CAST(N'2021-06-17T16:21:24.2279064' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":1,"Page":1}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (254, CAST(N'2021-06-17T16:22:01.3209580' AS DateTime2), N'{"Keyword":null,"IsGift":false,"DeliverDate":"0001-01-01T00:00:00","UserId":0,"PerPage":50,"Page":1}', NULL, N'dixyadmin', N'get orders query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (255, CAST(N'2021-06-17T16:38:14.3308090' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":null,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get products query')
INSERT [dbo].[AuditLogs] ([Id], [Date], [Data], [UserId], [Actor], [UseCaseName]) VALUES (256, CAST(N'2021-06-17T16:41:38.7720295' AS DateTime2), N'{"Keyword":null,"MinPrice":null,"MaxPrice":null,"CategoryId":4,"IsNew":null,"PerPage":1,"Page":1}', NULL, N'Anonymus', N'get products query')
SET IDENTITY_INSERT [dbo].[AuditLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [Quantity], [ProductId], [UserId]) VALUES (30, 2, 1, 1005)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Krofnice', CAST(N'2021-06-14T16:57:56.7472536' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Kronati', CAST(N'2021-06-14T19:55:43.0986795' AS DateTime2), CAST(N'2021-06-14T20:05:35.7878537' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'TORte (s'' cekicem:)', CAST(N'2021-06-15T12:57:41.6949883' AS DateTime2), CAST(N'2021-06-17T17:18:35.7617339' AS DateTime2), 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLines] ON 

INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'Bandži', CAST(170.00 AS Decimal(18, 2)), 1, 7, 1, CAST(N'2021-06-17T13:03:16.4306615' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'Uno Dixoteka', CAST(150.00 AS Decimal(18, 2)), 5, 3, 3, CAST(N'2021-06-17T13:03:16.4306661' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'Hippo', CAST(255.00 AS Decimal(18, 2)), 5, 5, 2, CAST(N'2021-06-17T13:08:05.3385879' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'Dos Dixotekas', CAST(200.00 AS Decimal(18, 2)), 10, 4, 4, CAST(N'2021-06-17T13:08:05.3385887' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'Dos Dixotekas', CAST(200.00 AS Decimal(18, 2)), 30, 4, 5, CAST(N'2021-06-17T13:59:31.5879753' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'Bandži', CAST(170.00 AS Decimal(18, 2)), 15, 7, 6, CAST(N'2021-06-17T16:40:52.6952174' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[OrderLines] ([Id], [Name], [Price], [Quantity], [ProductId], [OrderId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (7, N'Hippo', CAST(255.00 AS Decimal(18, 2)), 5, 5, 6, CAST(N'2021-06-17T16:40:52.6952174' AS DateTime2), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[OrderLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Phone], [Address], [City], [ZIPCode], [IsGift], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'064564564', N'jove ilica 1', N'Bg', N'011', 1, N'please be carefull', CAST(N'2021-06-15T17:16:40.0000000' AS DateTime2), 1, CAST(N'2021-06-15T11:37:05.0950528' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [Phone], [Address], [City], [ZIPCode], [IsGift], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'064564564', N'jove ilica 10', N'Bg', N'011', 0, N'its a birthday gift', CAST(N'2021-06-15T17:16:40.0000000' AS DateTime2), 1, CAST(N'2021-06-15T11:40:13.9978206' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [Phone], [Address], [City], [ZIPCode], [IsGift], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (3, N'064564564', N'vojvode stepe 10', N'Bg', N'011', 0, N'thank you', CAST(N'2021-06-15T17:16:40.0000000' AS DateTime2), 2, CAST(N'2021-06-15T11:49:11.7560067' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [Phone], [Address], [City], [ZIPCode], [IsGift], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (4, N'064564564', N'vojvode misica 10', N'Bg', N'011', 1, N'i want this to be as soon as possible delivered', CAST(N'2021-06-15T17:16:40.0000000' AS DateTime2), 2, CAST(N'2021-06-15T13:00:00.9050226' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [Phone], [Address], [City], [ZIPCode], [IsGift], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (5, N'064564564', N'vojvode milenka', N'NS', N'011', 1, N'lomljivo', CAST(N'2021-06-15T17:16:40.0000000' AS DateTime2), 1003, CAST(N'2021-06-15T15:19:15.0983047' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Orders] ([Id], [Phone], [Address], [City], [ZIPCode], [IsGift], [Note], [DeliverDate], [UserId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (6, N'064564564', N'nedje u blizini', N'NS', N'011', 1, N'nemojte reci od koga je xD', CAST(N'2021-06-25T17:16:40.0000000' AS DateTime2), 1, CAST(N'2021-06-16T15:32:32.3245125' AS DateTime2), NULL, 0, NULL, 1)

SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Image], [Price], [IsNew], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (1, N'Čoko gold jaje', N'Čokoladno jaje napravljeno od fine, mlečne čokolade koje krije rošer čokoladne kuglice i jaja od bele mlečne čokolade punjena nugat lešnik kremom. Preliveno mlečnom čokoladom i ukrašeno 23-karatnim zlatom.  Lako se razbija, dovoljno je stisnuti sredinu jaja i čokolada će se pretvoriti u puno slatkih zalogaja. Upakovano u premum kutiju sa zlatnim detaljima i satenskom trakom i zlatotiskom Slatkoteka logotipa. Jaje je težine 600g, a visine 16 cm.', N'1.jpg', CAST(2790.00 AS Decimal(18, 2)), 0, 1, CAST(N'2021-06-14T22:12:15.8060628' AS DateTime2), CAST(N'2021-06-17T17:08:47.9409177' AS DateTime2), 0, NULL, 1, 168)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Image], [Price], [IsNew], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (3, N'Uno Dixoteka', N'Vazdušasto testo smo prelili finom belom čokoladom. U središte najfinijeg zalogaja smestili smo kinder jaje ispunjeno kremastim kinder filom i dodali sočnu jagodu prošaranu mlečnom čokoladom kako bismo zaokružili priču. Na kraju smo naše malo remek delo uokvirili mlevenom plazmom i smestili ga u vitrinu, učinivši proleće u Slatkoteci još slađim.', N'1.jpg', CAST(150.00 AS Decimal(18, 2)), 1, 1, CAST(N'2021-06-14T22:14:53.7037829' AS DateTime2), CAST(N'2021-06-17T13:03:16.4306688' AS DateTime2), 0, NULL, 1, 355)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Image], [Price], [IsNew], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (4, N'Dos Dixotekas', N'A onda se pojavila ona. Odevena u mlečnu čokoladu, nosila je ogrlicu od karamelizovanog kikirikija. Kruna od čoko jajeta je bila ispunjena slatkim nugatom i svežim malinama. Kako nam je falila tačka na I, dodali smo joj čokoladni ukras posut jestivim zlatom. I tako je nastala kraljevska krofna, treća dama u ediciji Slatkotekinih krofni.', N'1.jpg', CAST(200.00 AS Decimal(18, 2)), 1, 1, CAST(N'2021-06-15T11:12:45.0270259' AS DateTime2), CAST(N'2021-06-17T13:58:46.1451621' AS DateTime2), 0, NULL, 1, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Image], [Price], [IsNew], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (5, N'Hippo', N'Ne možete odoleti hrskavoj Hippo čokoladici i kremastom nugat filu? Ukrašena kit-kat mrvljenim omotačem, stiže pravo u carstvo najboljih krofni', N'2.jpg', CAST(255.00 AS Decimal(18, 2)), 1, 1, CAST(N'2021-06-15T13:03:43.1787617' AS DateTime2), CAST(N'2021-06-17T13:08:05.3385898' AS DateTime2), 0, NULL, 1, 42)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Image], [Price], [IsNew], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (6, N'Cinnamon rolls
', N'Neodoljiva kombinacija cimeta, smeđeg šećera, šećera u prahu i lešnika sa novim i neobičnim oblikom, ali i originalnim testom za krofne!', N'bb787c94-189e-47c3-a274-756fab1cc658.jpg', CAST(150.00 AS Decimal(18, 2)), 1, 1, CAST(N'2021-06-15T22:55:28.2160301' AS DateTime2), NULL, 0, NULL, 1, 33)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Image], [Price], [IsNew], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (7, N'Bandži', N'Ne možete odoleti palačinkama sa nutelom i bananom? Onda imamo krofnu za vas. Svratite u Slatkoteku i isprobajte najnoviji miks banane, plazme i kremaste nutele. Jer proverene kombinacije ukusa ne treba menjati.', N'0a3dbb91-14a2-4df5-af85-364b572877ba.jpg', CAST(170.00 AS Decimal(18, 2)), 1, 1, CAST(N'2021-06-16T15:28:42.0562916' AS DateTime2), CAST(N'2021-06-17T15:24:29.2007485' AS DateTime2), 0, NULL, 1, 200)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Image], [Price], [IsNew], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (8, N'Cheesecake iznenađenje malina
', N'Cheesecake iznenađenja u obliku kruga od bele mlečne čokolade sa ivicama od plazme i kit-kat čokoladice ispunjeno je kremastim belim kinder filom i mascarpone sirom, korom od plazme, a ukrašena svežim malinama, seckanim pistaćima, giotto kuglicama i macarons kolačićima sa ukusom maline. Prečnik torte je 20cm, težina 1,5kg, a moguće je iseći tortu na 5-7 porcija nakon razbijanja torte. Upakovana je u premium papir u kutiji zlatne boje u kojoj se nalazi i čekić zlatne boje za razbijanje.', N'790b70a9-5e73-4a17-a91a-32c3d6d3dced.jpg', CAST(4000.00 AS Decimal(18, 2)), 1, 4, CAST(N'2021-06-17T15:51:47.1676139' AS DateTime2), CAST(N'2021-06-17T15:56:26.6294233' AS DateTime2), 0, NULL, 1, 250)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Image], [Price], [IsNew], [CategoryId], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive], [Quantity]) VALUES (9, N'Kronat borovnica', N'Ovo je pravi izbor kad se dvoumiš da li želiš čokoladni ili voćni kronat. Duplo punjenje šumskog voća i lešnik krema u kronatu – kombinacija kroasana i krofne, iznutra mekano puterasto testo, a spolja crunchy cimet i smeđi šećer.', N'51c5245e-61af-43fd-8aef-1344bb9bdd5f.jpg', CAST(140.00 AS Decimal(18, 2)), 0, 3, CAST(N'2021-06-17T16:05:15.2089798' AS DateTime2), CAST(N'2021-06-17T16:28:42.5864652' AS DateTime2), 0, NULL, 1, 255)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [Email], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1, N'dijanica', N'Dijana', N'Lazic', N'dixylazic', N'dixy@gmail.com', CAST(N'2021-06-13T14:43:50.8663792' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [Email], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (2, N'deki', N'Deki', N'Lazic', N'deckylazic', N'jashim@gmail.com', CAST(N'2021-06-13T16:06:32.3708790' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [Email], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1003, N'cikitabanana', N'Ana', N'Lazic', N'anitalazic', N'mamasita@gmail.com', CAST(N'2021-06-15T13:10:37.7180883' AS DateTime2), CAST(N'2021-06-15T13:12:08.7769407' AS DateTime2), 1, CAST(N'2021-06-15T11:12:08.7765714' AS DateTime2), 1)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [Email], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1004, N'adminsam', N'Admin', N'Adminic', N'admince', N'adma@gmail.vuhu', CAST(N'2021-06-15T13:41:18.4712227' AS DateTime2), CAST(N'2021-06-15T21:03:30.9701627' AS DateTime2), 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [Email], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1005, N'dixyadmin', N'Dixy', N'Admin', N'admindixy', N'dixy@gmail.kom', CAST(N'2021-06-16T19:46:17.7841565' AS DateTime2), NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password], [Email], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [IsActive]) VALUES (1006, N'korisnik123', N'Korisnik', N'Proba', N'sifradugacka1', N'korisnik@gmail.com', CAST(N'2021-06-17T16:16:02.3187032' AS DateTime2), CAST(N'2021-06-17T16:27:32.6112971' AS DateTime2), 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1003, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 14)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 30)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1004, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 3)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 14)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 28)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 29)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1005, 35)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1006, 35)
GO
/****** Object:  Index [IX_AuditLogs_UserId]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_AuditLogs_UserId] ON [dbo].[AuditLogs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_ProductId]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_ProductId] ON [dbo].[Carts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_OrderId]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_OrderId] ON [dbo].[OrderLines]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_ProductId]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_ProductId] ON [dbo].[OrderLines]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)
WHERE ([Username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 6/17/2021 8:46:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[AuditLogs]  WITH CHECK ADD  CONSTRAINT [FK_AuditLogs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[AuditLogs] CHECK CONSTRAINT [FK_AuditLogs_Users_UserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products_ProductId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users_UserId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [Dixoteka] SET  READ_WRITE 
GO
