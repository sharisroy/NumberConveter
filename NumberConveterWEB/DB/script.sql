USE [master]
GO
/****** Object:  Database [NumberConversion]    Script Date: 5/24/2019 12:07:21 PM ******/
CREATE DATABASE [NumberConversion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NumberConversion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NumberConversion.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NumberConversion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NumberConversion_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NumberConversion] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NumberConversion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NumberConversion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NumberConversion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NumberConversion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NumberConversion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NumberConversion] SET ARITHABORT OFF 
GO
ALTER DATABASE [NumberConversion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NumberConversion] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NumberConversion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NumberConversion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NumberConversion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NumberConversion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NumberConversion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NumberConversion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NumberConversion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NumberConversion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NumberConversion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NumberConversion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NumberConversion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NumberConversion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NumberConversion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NumberConversion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NumberConversion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NumberConversion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NumberConversion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NumberConversion] SET  MULTI_USER 
GO
ALTER DATABASE [NumberConversion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NumberConversion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NumberConversion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NumberConversion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NumberConversion]
GO
/****** Object:  Table [dbo].[History]    Script Date: 5/24/2019 12:07:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[ID] [int] NOT NULL,
	[Binary] [varchar](50) NULL,
	[Decimal] [varchar](50) NULL,
	[Octal] [varchar](50) NULL,
	[HexaDecimal] [varchar](50) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (1, N'1010001', N'81', N'121', N'51')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (2, N'1010001010', N'650', N'1212', N'28A')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (3, N'1010001010001', N'5201', N'12121', N'1451')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (4, N'100101', N'37', N'45', N'25')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (5, N'1010001010001001', N'41609', N'121211', N'A289')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (6, N'1010001010001001010', N'332874', N'1212112', N'5144A')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (7, N'1010001010001001010001', N'2662993', N'12121121', N'28A251')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (8, N'1010001010001001010001001', N'21303945', N'121211211', N'1451289')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (9, N'1010001010001001010001001010', N'170431562', N'1212112112', N'A28944A')
INSERT [dbo].[History] ([ID], [Binary], [Decimal], [Octal], [HexaDecimal]) VALUES (10, N'1010001010001001010001001010001', N'1363452497', N'12121121121', N'5144A251')
USE [master]
GO
ALTER DATABASE [NumberConversion] SET  READ_WRITE 
GO
