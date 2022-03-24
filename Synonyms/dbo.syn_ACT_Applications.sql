CREATE SYNONYM [dbo].[syn_ACT_Applications] FOR [ACTCloud].[dbo].[ACT_Applications]
GO
EXEC sp_addextendedproperty N'FOREIGN_KEY', N'ID', 'SCHEMA', N'dbo', 'SYNONYM', N'syn_ACT_Applications', NULL, NULL
GO
EXEC sp_addextendedproperty N'FOREIGN_KEY_NAME', N'Application_ID', 'SCHEMA', N'dbo', 'SYNONYM', N'syn_ACT_Applications', NULL, NULL
GO
