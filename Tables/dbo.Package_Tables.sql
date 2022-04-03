CREATE TABLE [dbo].[Package_Tables]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Package_ID] [uniqueidentifier] NOT NULL,
[Table_ID] [uniqueidentifier] NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Package_Tables_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Package_Tables_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Tables] ADD CONSTRAINT [PK_Package_Tables] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Tables] ADD CONSTRAINT [FK_Package_Tables_Packages_ID] FOREIGN KEY ([Package_ID]) REFERENCES [dbo].[Packages] ([ID])
GO
ALTER TABLE [dbo].[Package_Tables] ADD CONSTRAINT [FK_Package_Tables_Tables_ID] FOREIGN KEY ([Table_ID]) REFERENCES [dbo].[Tables] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Packages', 'SCHEMA', N'dbo', 'TABLE', N'Package_Tables', NULL, NULL
GO
