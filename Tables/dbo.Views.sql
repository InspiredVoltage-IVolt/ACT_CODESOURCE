CREATE TABLE [dbo].[Views]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Database_Views_ID] DEFAULT (newid()),
[Database_ID] [uniqueidentifier] NULL,
[User_ID] [uniqueidentifier] NULL,
[Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Database_Views_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Database_Views_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Views] ADD CONSTRAINT [PK_Database_Views] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Views] ADD CONSTRAINT [FK_Views_Databases_ID] FOREIGN KEY ([Database_ID]) REFERENCES [dbo].[Databases] ([ID])
GO
ALTER TABLE [dbo].[Views] ADD CONSTRAINT [FK_Views_Users_ID] FOREIGN KEY ([User_ID]) REFERENCES [UserData].[Users] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Database', 'SCHEMA', N'dbo', 'TABLE', N'Views', NULL, NULL
GO
