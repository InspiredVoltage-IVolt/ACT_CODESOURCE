CREATE TABLE [dbo].[Package_Stored_Procedures]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Package_ID] [uniqueidentifier] NOT NULL,
[Stored_Procedure_ID] [uniqueidentifier] NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Package_Stored_Procedures_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Package_Stored_Procedures_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Stored_Procedures] ADD CONSTRAINT [PK_Package_Stored_Procedures] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Stored_Procedures] ADD CONSTRAINT [FK_Package_Stored_Procedures_Packages_ID] FOREIGN KEY ([Package_ID]) REFERENCES [dbo].[Packages] ([ID])
GO
ALTER TABLE [dbo].[Package_Stored_Procedures] ADD CONSTRAINT [FK_Package_Stored_Procedures_Stored_Procedures_ID] FOREIGN KEY ([Stored_Procedure_ID]) REFERENCES [dbo].[Stored_Procedures] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Packages', 'SCHEMA', N'dbo', 'TABLE', N'Package_Stored_Procedures', NULL, NULL
GO
