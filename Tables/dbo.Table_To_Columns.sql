CREATE TABLE [dbo].[Table_To_Columns]
(
[ID] [int] NOT NULL,
[Table_ID] [uniqueidentifier] NOT NULL,
[Column_ID] [uniqueidentifier] NOT NULL,
[Default_Value] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Distribution_Level] [int] NOT NULL CONSTRAINT [DF_Table_To_Columns_Data_Level] DEFAULT ((1)),
[Optional] [bit] NOT NULL CONSTRAINT [DF_Table_To_Columns_Optional] DEFAULT ((0)),
[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Table_Columns_DateAdded] DEFAULT (getdate()),
[DateModified] [datetime] NOT NULL CONSTRAINT [DF_Table_Columns_DateModified] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_To_Columns] ADD CONSTRAINT [PK_Table_Columns] PRIMARY KEY CLUSTERED ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_To_Columns] ADD CONSTRAINT [FK_Table_To_Columns_Columns_ID] FOREIGN KEY ([Column_ID]) REFERENCES [dbo].[Columns] ([ID])
GO
ALTER TABLE [dbo].[Table_To_Columns] ADD CONSTRAINT [FK_Table_To_Columns_Tables_ID] FOREIGN KEY ([Table_ID]) REFERENCES [dbo].[Tables] ([ID])
GO
EXEC sp_addextendedproperty N'VirtualFolder', N'Database', 'SCHEMA', N'dbo', 'TABLE', N'Table_To_Columns', NULL, NULL
GO
