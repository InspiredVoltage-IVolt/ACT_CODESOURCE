CREATE TABLE [dbo].[Object_To_Tag]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[TableName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Table_ID] [uniqueidentifier] NOT NULL,
[Tag_ID] [int] NOT NULL,
[Approved] [bit] NOT NULL CONSTRAINT [DF_Object_To_Tag_Approved] DEFAULT ((0)),
[UpVoteCount] [int] NOT NULL,
[DownVoteCount] [int] NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Object_To_Tag_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Object_To_Tag_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Object_To_Tag] ADD CONSTRAINT [PK_Object_To_Tag] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Object_To_Tag] ADD CONSTRAINT [FK_Object_To_Tag_Tags_ID] FOREIGN KEY ([Tag_ID]) REFERENCES [dbo].[Tags] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Objects', 'SCHEMA', N'dbo', 'TABLE', N'Object_To_Tag', NULL, NULL
GO
