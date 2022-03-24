SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[DATABASE_SEARCH] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Owner_ID], [DatabaseName], [DatabaseConnection], [Description], [DateAdded], [DateModified] 
	FROM   [dbo].[Databases] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT
GO
