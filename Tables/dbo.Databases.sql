CREATE TABLE [dbo].[Databases]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__Databases__ID__28B808A7] DEFAULT (newid()),
[Owner_ID] [uniqueidentifier] NOT NULL,
[DatabaseName] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DatabaseConnection] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Databases_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Databases_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Databases] ADD CONSTRAINT [PK_Databases_NewID] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
