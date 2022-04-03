CREATE TABLE [UserData].[Teams]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Teams_ID] DEFAULT (newid()),
[Creator_User_ID] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Teams_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Teams_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [UserData].[Teams] ADD CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [UserData].[Teams] ADD CONSTRAINT [FK_Teams_Users] FOREIGN KEY ([Creator_User_ID]) REFERENCES [UserData].[Users] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Users', 'SCHEMA', N'UserData', 'TABLE', N'Teams', NULL, NULL
GO
