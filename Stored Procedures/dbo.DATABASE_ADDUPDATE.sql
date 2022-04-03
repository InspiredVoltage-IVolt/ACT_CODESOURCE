SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[DATABASE_ADDUPDATE] 
	@ID uniqueidentifier,
    @Owner_ID uniqueidentifier,
    @DatabaseName nvarchar(300),
    @DatabaseConnection nvarchar(500) = NULL,
    @Description nvarchar(MAX) = NULL,
    @DateAdded datetime,
    @DateModified datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	IF dbo.FN_USER_EXISTS(@Owner_ID,NULL,NULL,NULL) IS NULL
		BEGIN
			SELECT NULL AS ID, @Owner_ID AS Owner_ID, '' AS DatabaseName,'' AS DatabaseConnection,'' AS Description, NULL AS DateAdded,NULL AS DateModified, 0 AS 'User Doesn''t Exist'
			RETURN
		END

	BEGIN TRAN
	
	DECLARE @NewID AS UNIQUEIDENTIFIER
	SET @NewID = NEWID()

	INSERT INTO [dbo].[Databases] ([ID], [Owner_ID], [DatabaseName], [DatabaseConnection], [Description], [DateAdded], [DateModified])
	SELECT @NewID, @Owner_ID, @DatabaseName, @DatabaseConnection, @Description, @DateAdded, @DateModified
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Owner_ID], [DatabaseName], [DatabaseConnection], [Description], [DateAdded], [DateModified]
	FROM   [dbo].[Databases]
	WHERE  [ID] = @NewID
	-- End Return Select <- do not remove
               
	COMMIT

	BEGIN TRAN

	UPDATE [dbo].[Databases]
		SET    [Owner_ID] = @Owner_ID, [DatabaseName] = @DatabaseName, [DatabaseConnection] = @DatabaseConnection,
				[Description] = @Description, [DateAdded] = @DateAdded, [DateModified] = @DateModified
		WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [Owner_ID], [DatabaseName], [DatabaseConnection], [Description], [DateAdded], [DateModified], 1 AS 'Success'
	FROM   [dbo].[Databases]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT
GO
