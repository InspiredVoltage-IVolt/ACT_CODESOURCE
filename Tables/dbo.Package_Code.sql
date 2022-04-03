CREATE TABLE [dbo].[Package_Code]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Package_Code_ID] DEFAULT (newid()),
[Package_ID] [uniqueidentifier] NOT NULL,
[Code_ID] [uniqueidentifier] NOT NULL,
[Required] [bit] NOT NULL,
[DownloadOrder] [int] NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Package_Code_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Package_Code_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Code] ADD CONSTRAINT [PK_Package_Code] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Code] ADD CONSTRAINT [FK_Package_Code_Code_ID] FOREIGN KEY ([Code_ID]) REFERENCES [dbo].[Code] ([ID])
GO
ALTER TABLE [dbo].[Package_Code] ADD CONSTRAINT [FK_Package_Code_Packages_ID] FOREIGN KEY ([Package_ID]) REFERENCES [dbo].[Packages] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Packages', 'SCHEMA', N'dbo', 'TABLE', N'Package_Code', NULL, NULL
GO
