CREATE TABLE [UserData].[Users]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Users_ID] DEFAULT (newid()),
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailAddress] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Password] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsAdmin] [bit] NOT NULL CONSTRAINT [DF_Users_IsAdmin] DEFAULT ((0)),
[DomainUserAccount] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Users_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Users_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [UserData].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
