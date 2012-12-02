USE [GSVIHC]
GO

/****** Object:  Table [dbo].[ReferenceSequences]    Script Date: 07/31/2011 15:58:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReferenceSequences]') AND type in (N'U'))
DROP TABLE [dbo].[ReferenceSequences]
GO

USE [GSVIHC]
GO

/****** Object:  Table [dbo].[ReferenceSequences]    Script Date: 07/31/2011 15:58:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ReferenceSequences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[build_id] [nvarchar](max) NOT NULL,
	[genomic_sequence] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ReferenceSequences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH ( STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
) 


GO


