CREATE TABLE [dbo].[Object_Types]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Object_Ty__Descr__79C80F94] DEFAULT ('Object Not Yet Defined Properly'),
[MetaData] [dbo].[JSON] NOT NULL CONSTRAINT [DF__Object_Ty__MetaD__7ABC33CD] DEFAULT ('{ }'),
[DateAdded] [datetime] NULL CONSTRAINT [DF__Object_Ty__DateA__77DFC722] DEFAULT (getdate()),
[DateModified] [datetime] NULL CONSTRAINT [DF__Object_Ty__DateM__78D3EB5B] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Object_Types] ADD CONSTRAINT [PK_Object_Types_ID] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Objects', 'SCHEMA', N'dbo', 'TABLE', N'Object_Types', NULL, NULL
GO
