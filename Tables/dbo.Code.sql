CREATE TABLE [dbo].[Code]
(
[ID] [uniqueidentifier] NOT NULL,
[Owner_ID] [uniqueidentifier] NOT NULL,
[Language_ID] [uniqueidentifier] NOT NULL,
[Code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MetaData] [dbo].[JSON] NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Code_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Code_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Code] ADD CONSTRAINT [PK_Code] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Code] ADD CONSTRAINT [FK_Code_Users] FOREIGN KEY ([Owner_ID]) REFERENCES [UserData].[Users] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Code', 'SCHEMA', N'dbo', 'TABLE', N'Code', NULL, NULL
GO
