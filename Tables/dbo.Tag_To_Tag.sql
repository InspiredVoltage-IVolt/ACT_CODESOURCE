CREATE TABLE [dbo].[Tag_To_Tag]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Tag_ID] [int] NOT NULL,
[Related_Tag_ID] [int] NOT NULL,
[Weight] [decimal] (14, 4) NOT NULL,
[FirstGenCount] [int] NOT NULL,
[SecondGenCount] [int] NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Tag_To_Tag_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Tag_To_Tag_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tag_To_Tag] ADD CONSTRAINT [PK_Tag_To_Tag] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tag_To_Tag] ADD CONSTRAINT [FK_RelatedTag_To_Tag_Tags_ID] FOREIGN KEY ([Related_Tag_ID]) REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[Tag_To_Tag] ADD CONSTRAINT [FK_Tag_To_Tag_Tags_ID] FOREIGN KEY ([Tag_ID]) REFERENCES [dbo].[Tags] ([ID])
GO
