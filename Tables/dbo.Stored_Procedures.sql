CREATE TABLE [dbo].[Stored_Procedures]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Database_Stored_Procedures_ID] DEFAULT (newid()),
[Database_ID] [uniqueidentifier] NOT NULL,
[Purpose_ID] [uniqueidentifier] NULL,
[Name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SchemaName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Database_Stored_Procedures_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Database_Stored_Procedures_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stored_Procedures] ADD CONSTRAINT [PK_Database_Stored_Procedures_1] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stored_Procedures] ADD CONSTRAINT [FK_Stored_Procedures_Databases_ID] FOREIGN KEY ([Database_ID]) REFERENCES [dbo].[Databases] ([ID])
GO
