USE [master]
GO
/****** Object:  Database [DHC]    Script Date: 7/13/2020 10:42:07 PM ******/
CREATE DATABASE [DHC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DHC_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DHC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DHC_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DHC.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DHC] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DHC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DHC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DHC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DHC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DHC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DHC] SET ARITHABORT OFF 
GO
ALTER DATABASE [DHC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DHC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DHC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DHC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DHC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DHC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DHC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DHC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DHC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DHC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DHC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DHC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DHC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DHC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DHC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DHC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DHC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DHC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DHC] SET  MULTI_USER 
GO
ALTER DATABASE [DHC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DHC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DHC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DHC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DHC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DHC] SET QUERY_STORE = OFF
GO
USE [DHC]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [varchar](10) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocBlock]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocBlock](
	[Time] [smalldatetime] NOT NULL,
	[DocId] [varchar](10) NOT NULL,
	[BlockDay] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocBook]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocBook](
	[BookId] [varchar](20) NOT NULL,
	[Time] [smalldatetime] NOT NULL,
	[PatId] [varchar](10) NOT NULL,
	[DocId] [varchar](10) NOT NULL,
	[Paid] [bit] NULL,
	[RegTime] [smalldatetime] NOT NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_BookingDoc] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocPay]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocPay](
	[PayId] [varchar](20) NOT NULL,
	[Amount] [int] NOT NULL,
	[Method] [varchar](10) NOT NULL,
	[PatId] [varchar](10) NOT NULL,
	[DocId] [varchar](10) NOT NULL,
	[ACNo] [varchar](20) NOT NULL,
	[BID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [varchar](10) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Age] [tinyint] NOT NULL,
	[Qualifications] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Dept] [varchar](50) NOT NULL,
	[AddressLn] [varchar](50) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[WeekStart] [varchar](10) NOT NULL,
	[WeekEnd] [varchar](10) NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[CloseTime] [time](0) NOT NULL,
	[Fee] [int] NOT NULL,
	[SlotMin] [tinyint] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[Id] [varchar](10) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[AddressLn] [varchar](50) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[WeekStart] [varchar](10) NOT NULL,
	[WeekEnd] [varchar](10) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[CloseTime] [time](7) NOT NULL,
 CONSTRAINT [PK_DiagnosticCenter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HpBlock]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HpBlock](
	[Time] [date] NOT NULL,
	[HpId] [varchar](10) NOT NULL,
	[TestId] [varchar](10) NULL,
	[BlockDay] [bit] NULL,
	[Morning] [bit] NULL,
	[Afternoon] [bit] NULL,
	[Night] [bit] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HpBook]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HpBook](
	[BookId] [varchar](20) NOT NULL,
	[Time] [date] NOT NULL,
	[PatId] [varchar](10) NOT NULL,
	[HpId] [varchar](10) NOT NULL,
	[Paid] [bit] NULL,
	[TestId] [varchar](10) NOT NULL,
	[Slot] [varchar](2) NOT NULL,
 CONSTRAINT [PK_BookingHp] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HpPay]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HpPay](
	[PayId] [varchar](20) NOT NULL,
	[Amount] [int] NOT NULL,
	[Method] [varchar](10) NOT NULL,
	[PatId] [varchar](10) NOT NULL,
	[HpId] [varchar](10) NOT NULL,
	[ACNo] [varchar](20) NOT NULL,
	[BIH] [varchar](20) NOT NULL,
 CONSTRAINT [PK_HpPay] PRIMARY KEY CLUSTERED 
(
	[PayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HpTest]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HpTest](
	[TestId] [varchar](10) NOT NULL,
	[TestName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HpTest] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [varchar](10) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Age] [tinyint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[BloodGroup] [varchar](4) NOT NULL,
	[Address] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[PresId] [int] IDENTITY(1,1) NOT NULL,
	[Details] [varchar](1000) NOT NULL,
	[Time] [smalldatetime] NULL,
	[DocId] [varchar](10) NOT NULL,
	[PatId] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[PresId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[RepId] [int] IDENTITY(1,1) NOT NULL,
	[Details] [varchar](1000) NOT NULL,
	[Time] [smalldatetime] NULL,
	[HpId] [varchar](10) NOT NULL,
	[PatId] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[RepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_Hp]    Script Date: 7/13/2020 10:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Hp](
	[HpId] [varchar](10) NOT NULL,
	[TestId] [varchar](10) NOT NULL,
	[TestCharge] [int] NOT NULL,
	[Morning] [smallint] NOT NULL,
	[Afternoon] [smallint] NOT NULL,
	[Night] [smallint] NOT NULL,
 CONSTRAINT [PK_Test_Hp_1] PRIMARY KEY CLUSTERED 
(
	[HpId] ASC,
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([Id], [Password], [Name]) VALUES (N'Adm-01', N'aA11!!', N'Mike Chester')
INSERT [dbo].[Admin] ([Id], [Password], [Name]) VALUES (N'Adm-02', N'aA11!!', N'Brad Delson')
INSERT [dbo].[DocBook] ([BookId], [Time], [PatId], [DocId], [Paid], [RegTime], [Valid]) VALUES (N'Bid-01', CAST(N'2019-06-16T23:00:00' AS SmallDateTime), N'pat-01', N'Doc-01', 1, CAST(N'2019-06-16T22:56:00' AS SmallDateTime), 1)
INSERT [dbo].[DocBook] ([BookId], [Time], [PatId], [DocId], [Paid], [RegTime], [Valid]) VALUES (N'Bid-02', CAST(N'2019-06-17T20:00:00' AS SmallDateTime), N'pat-01', N'Doc-01', 0, CAST(N'2019-06-17T05:46:00' AS SmallDateTime), 1)
INSERT [dbo].[DocPay] ([PayId], [Amount], [Method], [PatId], [DocId], [ACNo], [BID]) VALUES (N'Pid-01', 20000, N'bKash', N'pat-01', N'Doc-01', N'+235698', N'Bid-01')
INSERT [dbo].[DocPay] ([PayId], [Amount], [Method], [PatId], [DocId], [ACNo], [BID]) VALUES (N'Pid-02', 20000, N'Rocket', N'pat-01', N'Doc-01', N'+5487545', N'Bid-02')
INSERT [dbo].[Doctor] ([Id], [Password], [Name], [Email], [Age], [Qualifications], [Phone], [Dept], [AddressLn], [City], [Country], [WeekStart], [WeekEnd], [StartTime], [CloseTime], [Fee], [SlotMin]) VALUES (N'Doc-01', N'aA11!!', N'John Cartewd', N'tweld@gmail.co', 65, N'FCPS', N'+3265983499933336', N'Neurology', N'Bunker road, 8790, Holtagardfdf', N'Gazipur', N'Bangladesh', N'Sunday', N'Thursday', CAST(N'20:00:00' AS Time), CAST(N'02:00:00' AS Time), 20000, 30)
INSERT [dbo].[Doctor] ([Id], [Password], [Name], [Email], [Age], [Qualifications], [Phone], [Dept], [AddressLn], [City], [Country], [WeekStart], [WeekEnd], [StartTime], [CloseTime], [Fee], [SlotMin]) VALUES (N'Doc-02', N'aA11!!', N'Shawn Hedge', N'adfdf@gmail.com', 45, N'MBBS', N'+65326598', N'Medicine', N'24, Karter road, Kefiero', N'Dhaka', N'Bangladesh', N'Sunday', N'Thursday', CAST(N'20:00:00' AS Time), CAST(N'14:00:00' AS Time), 2000, 10)
INSERT [dbo].[Hospital] ([Id], [Password], [Name], [Email], [Phone], [AddressLn], [City], [Country], [WeekStart], [WeekEnd], [StartTime], [CloseTime]) VALUES (N'Hpt-01', N'aA11!!', N'United Hospital', N'a@m.co', N'+65233598', N'12, Merul', N'Bangkok', N'Thailand', N'Friday', N'Saturday', CAST(N'06:00:00' AS Time), CAST(N'02:00:00' AS Time))
INSERT [dbo].[Hospital] ([Id], [Password], [Name], [Email], [Phone], [AddressLn], [City], [Country], [WeekStart], [WeekEnd], [StartTime], [CloseTime]) VALUES (N'Hpt-02', N'123', N'Regent Hospital', N'da@m.com', N'+365233598', N'14, Sector 12, Uttara, Dhaka', N'Gazipur', N'Bangladesh', N'Sunday', N'Thursday', CAST(N'06:00:00' AS Time), CAST(N'18:00:00' AS Time))
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-01', N'MRI')
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-02', N'X-Ray')
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-03', N'Blood Test')
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-04', N'Physiotherapy')
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-05', N'Bone Scan')
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-06', N'Cardio Test')
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-07', N'Blood sugar')
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-08', N'Measure Blood Cell')
INSERT [dbo].[HpTest] ([TestId], [TestName]) VALUES (N'Tst-09', N'Sugar Test')
INSERT [dbo].[Patient] ([Id], [Password], [Name], [Age], [Email], [Phone], [BloodGroup], [Address]) VALUES (N'Pat-01', N'aA11!!', N'Jasaaf Jawat', 29, N'fdsfrtrtsd@gmail.co', N'+52585694', N'A-', N'36, Sarowa Road, Kidkcie 
Dhaka 1239
Bangladesh')
INSERT [dbo].[Patient] ([Id], [Password], [Name], [Age], [Email], [Phone], [BloodGroup], [Address]) VALUES (N'Pat-02', N'aA11!!', N'Karis Javin', 18, N'aswe@dd.com', N'+235656', N'B-', N'Mounhar, 12 Shub road
Dhaka 1235
Bangladesh')
INSERT [dbo].[Test_Hp] ([HpId], [TestId], [TestCharge], [Morning], [Afternoon], [Night]) VALUES (N'hpt-01', N'Tst-04', 400, 30, 20, 40)
ALTER TABLE [dbo].[DocBook]  WITH CHECK ADD  CONSTRAINT [FK_BookingDoc_Doctor] FOREIGN KEY([DocId])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[DocBook] CHECK CONSTRAINT [FK_BookingDoc_Doctor]
GO
ALTER TABLE [dbo].[DocBook]  WITH CHECK ADD  CONSTRAINT [FK_BookingDoc_Paitent] FOREIGN KEY([PatId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[DocBook] CHECK CONSTRAINT [FK_BookingDoc_Paitent]
GO
ALTER TABLE [dbo].[HpBlock]  WITH CHECK ADD  CONSTRAINT [FK_HpBlock_Hospital] FOREIGN KEY([HpId])
REFERENCES [dbo].[Hospital] ([Id])
GO
ALTER TABLE [dbo].[HpBlock] CHECK CONSTRAINT [FK_HpBlock_Hospital]
GO
ALTER TABLE [dbo].[HpBlock]  WITH CHECK ADD  CONSTRAINT [FK_HpBlock_HpTest] FOREIGN KEY([TestId])
REFERENCES [dbo].[HpTest] ([TestId])
GO
ALTER TABLE [dbo].[HpBlock] CHECK CONSTRAINT [FK_HpBlock_HpTest]
GO
ALTER TABLE [dbo].[HpBook]  WITH CHECK ADD  CONSTRAINT [FK_HpBook_Hospital] FOREIGN KEY([HpId])
REFERENCES [dbo].[Hospital] ([Id])
GO
ALTER TABLE [dbo].[HpBook] CHECK CONSTRAINT [FK_HpBook_Hospital]
GO
ALTER TABLE [dbo].[HpBook]  WITH CHECK ADD  CONSTRAINT [FK_HpBook_Patient] FOREIGN KEY([PatId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[HpBook] CHECK CONSTRAINT [FK_HpBook_Patient]
GO
ALTER TABLE [dbo].[Test_Hp]  WITH CHECK ADD  CONSTRAINT [FK_Test_Hp_Hospital] FOREIGN KEY([HpId])
REFERENCES [dbo].[Hospital] ([Id])
GO
ALTER TABLE [dbo].[Test_Hp] CHECK CONSTRAINT [FK_Test_Hp_Hospital]
GO
ALTER TABLE [dbo].[Test_Hp]  WITH CHECK ADD  CONSTRAINT [FK_Test_Hp_HpTest] FOREIGN KEY([TestId])
REFERENCES [dbo].[HpTest] ([TestId])
GO
ALTER TABLE [dbo].[Test_Hp] CHECK CONSTRAINT [FK_Test_Hp_HpTest]
GO
USE [master]
GO
ALTER DATABASE [DHC] SET  READ_WRITE 
GO
