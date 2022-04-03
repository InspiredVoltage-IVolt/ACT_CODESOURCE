CREATE TABLE [dbo].[Database_To_Table_Types]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Database_ID] [uniqueidentifier] NOT NULL,
[TableType_ID] [uniqueidentifier] NOT NULL,
[Schema_ID] [uniqueidentifier] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Database_To_Table_Types_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Database_To_Table_Types_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Database_To_Table_Types] ADD CONSTRAINT [PK_Database_To_Table_Types] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Database_To_Table_Types] ADD CONSTRAINT [FK_Database_To_Table_Types_Databases_ID] FOREIGN KEY ([Database_ID]) REFERENCES [dbo].[Databases] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Database', 'SCHEMA', N'dbo', 'TABLE', N'Database_To_Table_Types', NULL, NULL
GO
