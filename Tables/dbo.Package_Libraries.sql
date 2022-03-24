CREATE TABLE [dbo].[Package_Libraries]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Package_ID] [uniqueidentifier] NOT NULL,
[Library_ID] [uniqueidentifier] NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Package_Libraries_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Package_Libraries_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Libraries] ADD CONSTRAINT [PK_Package_Libraries] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package_Libraries] ADD CONSTRAINT [FK_Package_Libraries_Libraries_ID] FOREIGN KEY ([Library_ID]) REFERENCES [dbo].[Libraries] ([ID])
GO
ALTER TABLE [dbo].[Package_Libraries] ADD CONSTRAINT [FK_Package_Libraries_Packages_ID] FOREIGN KEY ([Package_ID]) REFERENCES [dbo].[Packages] ([ID])
GO
