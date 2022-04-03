CREATE TABLE [dbo].[Data_Languages]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Data_Languages_ID] DEFAULT (newid()),
[Rank] [int] NOT NULL,
[Language] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Speakers_Millions] [bigint] NOT NULL,
[PeopleUsagePercent] [float] NOT NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF_Data_Languages_Active] DEFAULT ((1)),
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Data_Languages_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Data_Languages_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Data_Languages] ADD CONSTRAINT [PK_Data_Languages] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Data', 'SCHEMA', N'dbo', 'TABLE', N'Data_Languages', NULL, NULL
GO
