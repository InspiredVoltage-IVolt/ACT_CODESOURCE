CREATE TABLE [dbo].[Package_Databases]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Package_ID] [uniqueidentifier] NOT NULL,
[Database_ID] [uniqueidentifier] NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Package_Databases_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Package_Databases_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Databases] ADD CONSTRAINT [PK_Package_Databases] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Databases] ADD CONSTRAINT [FK_Package_Databases_Databases_ID] FOREIGN KEY ([Database_ID]) REFERENCES [dbo].[Databases] ([ID])
GO
ALTER TABLE [dbo].[Package_Databases] ADD CONSTRAINT [FK_Package_Databases_Packages_ID] FOREIGN KEY ([Package_ID]) REFERENCES [dbo].[Packages] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Packages', 'SCHEMA', N'dbo', 'TABLE', N'Package_Databases', NULL, NULL
GO
