CREATE TABLE [dbo].[StandAlone_Scripts]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StandAlone_Scripts_ID] DEFAULT (newid()),
[Author_Chain] [dbo].[JSON(AUTHOR_CHAIN)] NOT NULL,
[Script_Chain] [dbo].[JSON] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StandAlone_Scripts] ADD CONSTRAINT [PK_StandAlone_Scripts] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
