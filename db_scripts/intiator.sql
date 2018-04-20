USE [companionproduction]
GO

/****** Object:  Table [dbo].[Initiator]    Script Date: 3/29/2018 12:24:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Initiator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nchar](30) NOT NULL,
	[password] [nchar](20) NOT NULL,
	[name] [nchar](20) NULL,
 CONSTRAINT [PK_Initiator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


