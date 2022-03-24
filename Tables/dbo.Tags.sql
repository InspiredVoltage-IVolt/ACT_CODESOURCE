CREATE TABLE [dbo].[Tags]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[User_ID] [uniqueidentifier] NULL,
[Tag] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Approved] [bit] NOT NULL CONSTRAINT [DF_Tags_Approved] DEFAULT ((0)),
[FlaggedCount] [int] NOT NULL CONSTRAINT [DF_Tags_FlaggedCount] DEFAULT ((0)),
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Tags_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Tags_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tags] ADD CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
