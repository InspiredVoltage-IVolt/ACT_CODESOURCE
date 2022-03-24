CREATE TABLE [dbo].[Libraries]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Libraries_ID] DEFAULT (newid()),
[User_ID] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DLL] [varbinary] (max) NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Libraries_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Libraries_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Libraries] ADD CONSTRAINT [PK_Libraries] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Libraries] ADD CONSTRAINT [FK_Libraries_Users_ID] FOREIGN KEY ([User_ID]) REFERENCES [UserData].[Users] ([ID])
GO
