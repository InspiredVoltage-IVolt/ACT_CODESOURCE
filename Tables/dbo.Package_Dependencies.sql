CREATE TABLE [dbo].[Package_Dependencies]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Package_ID] [uniqueidentifier] NOT NULL,
[Object_ID] [uniqueidentifier] NOT NULL,
[Object_Type_ID] [int] NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF__Package_D__DateA__63D8CE75] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF__Package_D__DateM__64CCF2AE] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Dependencies] ADD CONSTRAINT [PK_Package_Dependencies_ID] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Dependencies] ADD CONSTRAINT [FK_Package_Dependencies_Object_Types_ID] FOREIGN KEY ([Object_Type_ID]) REFERENCES [dbo].[Object_Types] ([ID])
GO
ALTER TABLE [dbo].[Package_Dependencies] ADD CONSTRAINT [FK_Package_Dependencies_Packages_ID] FOREIGN KEY ([Package_ID]) REFERENCES [dbo].[Packages] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Packages', 'SCHEMA', N'dbo', 'TABLE', N'Package_Dependencies', NULL, NULL
GO
