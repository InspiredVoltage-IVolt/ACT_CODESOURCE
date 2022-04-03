CREATE TABLE [dbo].[Language_Compilers]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Language_ID] [uniqueidentifier] NOT NULL,
[Compiler_ID] [uniqueidentifier] NOT NULL,
[Votes] [int] NOT NULL CONSTRAINT [DF__Language___Votes__6A85CC04] DEFAULT ((0)),
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF__Language___DateA__6B79F03D] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF__Language___DateM__6C6E1476] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Language_Compilers] ADD CONSTRAINT [PK_Language_Compilers_ID] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Language_Compilers] ADD CONSTRAINT [FK_Language_Compilers_Compilers_ID] FOREIGN KEY ([Compiler_ID]) REFERENCES [dbo].[Compilers] ([ID])
GO
