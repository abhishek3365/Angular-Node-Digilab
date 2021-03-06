/*    ==Scripting Parameters==

    Source Database Engine Edition : Microsoft Azure SQL Database Edition
    Source Database Engine Type : Microsoft Azure SQL Database

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [companionproduction]    Script Date: 29-01-2018 11:06:50 ******/
CREATE DATABASE [companionproduction]
GO
ALTER DATABASE [companionproduction] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [companionproduction].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [companionproduction] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [companionproduction] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [companionproduction] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [companionproduction] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [companionproduction] SET ARITHABORT OFF 
GO
ALTER DATABASE [companionproduction] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [companionproduction] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [companionproduction] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [companionproduction] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [companionproduction] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [companionproduction] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [companionproduction] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [companionproduction] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [companionproduction] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [companionproduction] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [companionproduction] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [companionproduction] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [companionproduction] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [companionproduction] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [companionproduction] SET  MULTI_USER 
GO
ALTER DATABASE [companionproduction] SET DB_CHAINING OFF 
GO
ALTER DATABASE [companionproduction] SET ENCRYPTION ON
GO
ALTER DATABASE [companionproduction] SET QUERY_STORE = ON
GO
ALTER DATABASE [companionproduction] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [companionproduction]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [companionproduction]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 29-01-2018 11:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 29-01-2018 11:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Company]    Script Date: 29-01-2018 11:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Digilab]    Script Date: 29-01-2018 11:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Digilab](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[ReceptionEmail] [nvarchar](100) NOT NULL,
	[LocationLat] [float] NOT NULL,
	[LocationLong] [float] NOT NULL,
	[IsEmailNotificationEnabled] [bit] NOT NULL,
	[IsPushNotificationEnabled] [bit] NOT NULL,
	[IsOpenForBusiness] [bit] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[FeedBackDelayTime] [int] NOT NULL,
	[PreBookExpiryTime] [int] NOT NULL,
	[Question1] [nvarchar](100) NULL,
	[Question2] [nvarchar](100) NULL,
	[ReceptionistMailDeliveryHours] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[Timezone] [varchar](100) NULL,
	[TimezoneId] [varchar](100) NULL,
	[Monday] [bit] NOT NULL,
	[Tuesday] [bit] NOT NULL,
	[Wednesday] [bit] NOT NULL,
	[Thursday] [bit] NOT NULL,
	[Friday] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[DigilabHost]    Script Date: 29-01-2018 11:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigilabHost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Contact] [nvarchar](100) NULL,
	[DigilabId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[DigilabSpaces]    Script Date: 29-01-2018 11:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigilabSpaces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DigilabId] [int] NOT NULL,
	[SpaceId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[DigilabSpaceTypes]    Script Date: 29-01-2018 11:06:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigilabSpaceTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Space] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[DigiSession]    Script Date: 29-01-2018 11:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigiSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[InitiatorEmail] [nvarchar](100) NULL,
	[DigilabId] [int] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[StateId] [int] NOT NULL,
	[InitiatorName] [nvarchar](100) NULL,
	[duration] [int] NULL,
	[CompanyId] [int] NULL,
	[Reason] [nvarchar](500) NULL,
	[MailToReceptionistSent] [bit] NULL,
	[MailToGuestSent] [bit] NULL,
	[ModifiedOn] [datetime] NULL,
	[PreBookExpiryTime] [int] NOT NULL,
	[Description] [varchar](100) NULL,
	[ReminderMailSent] [bit] NULL,
	[DigilabSpaceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 29-01-2018 11:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Answer1] [int] NOT NULL,
	[Answer2] [int] NULL,
	[Answer3] [int] NULL,
	[Comments] [nvarchar](500) NULL,
	[GuestId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 29-01-2018 11:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Contact] [nvarchar](100) NULL,
	[Company] [nvarchar](100) NULL,
	[SessionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[SessionHost]    Script Date: 29-01-2018 11:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionHost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [int] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[SessionState]    Script Date: 29-01-2018 11:06:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[SessionTopic]    Script Date: 29-01-2018 11:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionTopic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DigiSessionId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[DigilabId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 29-01-2018 11:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DigilabId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [dbo].[Digilab] ADD  DEFAULT ((0)) FOR [IsEmailNotificationEnabled]
GO
ALTER TABLE [dbo].[Digilab] ADD  DEFAULT ((0)) FOR [IsPushNotificationEnabled]
GO
ALTER TABLE [dbo].[Digilab] ADD  DEFAULT ((0)) FOR [IsOpenForBusiness]
GO
ALTER TABLE [dbo].[DigiSession] ADD  CONSTRAINT [DF_DigiSession_MailToReceptionistSent]  DEFAULT ((0)) FOR [MailToReceptionistSent]
GO
ALTER TABLE [dbo].[DigiSession] ADD  CONSTRAINT [DF_session_Modified_on]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[DigilabHost]  WITH CHECK ADD FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
ALTER TABLE [dbo].[DigilabHost]  WITH CHECK ADD FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
ALTER TABLE [dbo].[DigilabSpaces]  WITH CHECK ADD FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
ALTER TABLE [dbo].[DigilabSpaces]  WITH CHECK ADD FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
ALTER TABLE [dbo].[DigilabSpaces]  WITH CHECK ADD FOREIGN KEY([SpaceId])
REFERENCES [dbo].[DigilabSpaceTypes] ([Id])
GO
ALTER TABLE [dbo].[DigilabSpaces]  WITH CHECK ADD FOREIGN KEY([SpaceId])
REFERENCES [dbo].[DigilabSpaceTypes] ([Id])
GO
ALTER TABLE [dbo].[DigiSession]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[DigiSession]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[DigiSession]  WITH CHECK ADD FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
ALTER TABLE [dbo].[DigiSession]  WITH CHECK ADD FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
ALTER TABLE [dbo].[DigiSession]  WITH CHECK ADD FOREIGN KEY([DigilabSpaceId])
REFERENCES [dbo].[DigilabSpaces] ([Id])
GO
ALTER TABLE [dbo].[DigiSession]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[SessionState] ([Id])
GO
ALTER TABLE [dbo].[DigiSession]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[SessionState] ([Id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([Id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([Id])
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[DigiSession] ([Id])
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[DigiSession] ([Id])
GO
ALTER TABLE [dbo].[SessionHost]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[DigiSession] ([Id])
GO
ALTER TABLE [dbo].[SessionHost]  WITH CHECK ADD FOREIGN KEY([SessionId])
REFERENCES [dbo].[DigiSession] ([Id])
GO
ALTER TABLE [dbo].[SessionTopic]  WITH CHECK ADD FOREIGN KEY([DigiSessionId])
REFERENCES [dbo].[DigiSession] ([Id])
GO
ALTER TABLE [dbo].[SessionTopic]  WITH CHECK ADD  CONSTRAINT [FK__SessionTo__DigiS__2B0A656D] FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
ALTER TABLE [dbo].[SessionTopic] CHECK CONSTRAINT [FK__SessionTo__DigiS__2B0A656D]
GO
ALTER TABLE [dbo].[SessionTopic]  WITH CHECK ADD FOREIGN KEY([DigiSessionId])
REFERENCES [dbo].[DigiSession] ([Id])
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD FOREIGN KEY([DigilabId])
REFERENCES [dbo].[Digilab] ([Id])
GO
USE [master]
GO
ALTER DATABASE [companionproduction] SET  READ_WRITE 
GO
