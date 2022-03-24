CREATE TABLE [dbo].[Object_To_Purpose]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Purpose_ID] [uniqueidentifier] NOT NULL,
[Approved] [bit] NOT NULL CONSTRAINT [DF_Object_To_Purpose_Approved] DEFAULT ((0)),
[UpVoteCount] [int] NOT NULL,
[DownVoteCount] [int] NOT NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Object_To_Purpose_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Object_To_Purpose_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Object_To_Purpose] ADD CONSTRAINT [PK_Object_To_Purpose] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Object_To_Purpose] ADD CONSTRAINT [FK_Object_To_Purpose_Purposes_ID] FOREIGN KEY ([Purpose_ID]) REFERENCES [dbo].[Purposes] ([ID])
GO
