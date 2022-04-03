CREATE TABLE [UserData].[Team_To_Users]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Team_ID] [uniqueidentifier] NOT NULL,
[User_ID] [uniqueidentifier] NOT NULL,
[Is_Admin] [bit] NOT NULL CONSTRAINT [DF_Team_To_Userss_Is_Admin] DEFAULT ((0)),
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Team_To_Userss_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Team_To_Userss_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [UserData].[Team_To_Users] ADD CONSTRAINT [PK_Team_To_Userss] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [UserData].[Team_To_Users] ADD CONSTRAINT [FK_Team_To_Users_Teams] FOREIGN KEY ([Team_ID]) REFERENCES [UserData].[Teams] ([ID])
GO
ALTER TABLE [UserData].[Team_To_Users] ADD CONSTRAINT [FK_Team_To_Users_Users] FOREIGN KEY ([User_ID]) REFERENCES [UserData].[Users] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Users', 'SCHEMA', N'UserData', 'TABLE', N'Team_To_Users', NULL, NULL
GO
