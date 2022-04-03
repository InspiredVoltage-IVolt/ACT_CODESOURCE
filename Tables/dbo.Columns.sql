CREATE TABLE [dbo].[Columns]
(
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Database_Columns_ID] DEFAULT (newid()),
[User_ID] [uniqueidentifier] NULL,
[FieldName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataType_ID] [int] NOT NULL,
[Length] [int] NULL,
[Length_B] [int] NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Database_Table_Column_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Database_Table_Column_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Columns] ADD CONSTRAINT [PK_Database_Columns] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Columns] ADD CONSTRAINT [FK_Columns_Users_ID] FOREIGN KEY ([User_ID]) REFERENCES [UserData].[Users] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Database', 'SCHEMA', N'dbo', 'TABLE', N'Columns', NULL, NULL
GO
