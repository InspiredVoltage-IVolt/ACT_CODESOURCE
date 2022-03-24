CREATE TABLE [dbo].[Object_Comments]
(
[ID] [uniqueidentifier] NOT NULL,
[Object_ID] [uniqueidentifier] NOT NULL,
[User_ID] [uniqueidentifier] NOT NULL,
[Comment] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Database_Table_Comments_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Database_Table_Comments_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Object_Comments] ADD CONSTRAINT [PK_Database_Table_Comments] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Object_Comments] ADD CONSTRAINT [FK_Object_Comments_Users_ID] FOREIGN KEY ([User_ID]) REFERENCES [UserData].[Users] ([ID])
GO
