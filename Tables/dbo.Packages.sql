CREATE TABLE [dbo].[Packages]
(
[ID] [uniqueidentifier] NOT NULL,
[User_ID] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Packages_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Packages_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Packages] ADD CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
