CREATE TABLE [dbo].[Synonyms]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Synonyms_ID] DEFAULT (newid()),
[Database_ID] [uniqueidentifier] NULL,
[User_ID] [uniqueidentifier] NULL,
[Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PointsTo] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsPrivate] [bit] NOT NULL CONSTRAINT [DF_Table_1_Private] DEFAULT ((0)),
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Synonyms_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Synonyms_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Synonyms] ADD CONSTRAINT [PK_Synonyms] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Synonyms] ADD CONSTRAINT [FK_Synonyms_Databases_ID] FOREIGN KEY ([Database_ID]) REFERENCES [dbo].[Databases] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Database', 'SCHEMA', N'dbo', 'TABLE', N'Synonyms', NULL, NULL
GO
