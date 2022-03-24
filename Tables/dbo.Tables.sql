CREATE TABLE [dbo].[Tables]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Tables_ID] DEFAULT (newid()),
[Owner_ID] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SchemaName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Approved] [bit] NOT NULL CONSTRAINT [DF_Tables_Approved] DEFAULT ((0)),
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Database_Tables_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Database_Tables_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tables] ADD CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tables] ADD CONSTRAINT [FK_Tables_Users_ID] FOREIGN KEY ([Owner_ID]) REFERENCES [UserData].[Users] ([ID])
GO
