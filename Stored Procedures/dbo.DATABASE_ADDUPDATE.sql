SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[DATABASE_ADDUPDATE] 
	@ID int,
    @Owner_ID uniqueidentifier,
    @DatabaseName nvarchar(300),
    @DatabaseConnection nvarchar(500) = NULL,
    @Description nvarchar(MAX) = NULL,
    @DateAdded datetime,
    @DateModified datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Databases] ([Owner_ID], [DatabaseName], [DatabaseConnection], [Description], [DateAdded], [DateModified])
	SELECT @Owner_ID, @DatabaseName, @DatabaseConnection, @Description, @DateAdded, @DateModified
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Owner_ID], [DatabaseName], [DatabaseConnection], [Description], [DateAdded], [DateModified]
	FROM   [dbo].[Databases]
	WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

	BEGIN TRAN

	UPDATE [dbo].[Databases]
	SET    [Owner_ID] = @Owner_ID, [DatabaseName] = @DatabaseName, [DatabaseConnection] = @DatabaseConnection, [Description] = @Description, [DateAdded] = @DateAdded, [DateModified] = @DateModified
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Owner_ID], [DatabaseName], [DatabaseConnection], [Description], [DateAdded], [DateModified]
	FROM   [dbo].[Databases]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT
GO
