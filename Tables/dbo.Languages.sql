CREATE TABLE [dbo].[Languages]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Languages_ID] DEFAULT (newid()),
[Name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Languages_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Languages_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Languages] ADD CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
