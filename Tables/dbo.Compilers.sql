CREATE TABLE [dbo].[Compilers]
(
[ID] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plugin_DLL] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plugin_Class] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Compilers_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Compilers_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compilers] ADD CONSTRAINT [PK_Compilers] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
