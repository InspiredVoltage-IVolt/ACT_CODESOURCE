CREATE TABLE [dbo].[StandAlone_Scripts]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StandAlone_Scripts_ID] DEFAULT (newid()),
[Author_Chain] [dbo].[JSON(AUTHOR_CHAIN)] NULL,
[Script] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Script_Chain] [dbo].[JSON(VALUE_CHANGELOG)] NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_StandAlone_Scripts_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_StandAlone_Scripts_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StandAlone_Scripts] ADD CONSTRAINT [PK_StandAlone_Scripts] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
