CREATE TABLE [dbo].[Purposes]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Purposes_ID] DEFAULT (newid()),
[Name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Keywords] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Approved] [bit] NOT NULL CONSTRAINT [DF_Purposes_Approved] DEFAULT ((0)),
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Database_Table_Purposes_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Database_Table_Purposes_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Purposes] ADD CONSTRAINT [PK_Purposes_1] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Shared', 'SCHEMA', N'dbo', 'TABLE', N'Purposes', NULL, NULL
GO
