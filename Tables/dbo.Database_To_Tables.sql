CREATE TABLE [dbo].[Database_To_Tables]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Database_ID] [uniqueidentifier] NOT NULL,
[Table_ID] [uniqueidentifier] NOT NULL,
[Schema_ID] [uniqueidentifier] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Database_To_Tables_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Database_To_Tables_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Database_To_Tables] ADD CONSTRAINT [PK_Database_To_Tables] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Database_To_Tables] ADD CONSTRAINT [FK_Database_To_Tables_Databases_ID] FOREIGN KEY ([Database_ID]) REFERENCES [dbo].[Databases] ([ID])
GO
ALTER TABLE [dbo].[Database_To_Tables] ADD CONSTRAINT [FK_Database_To_Tables_Tables_ID] FOREIGN KEY ([Table_ID]) REFERENCES [dbo].[Tables] ([ID])
GO
