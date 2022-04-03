SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Mark Alicz
-- Copyright:	IVolt, LLC 2021
-- Create date: 2021
-- exec PROC_REGISTER_USER 1, null, 'Mark','Alicz','markalicz@gmail.com','invkr945',0,1, 'MarkAlicz','GamersGather'
-- =============================================
CREATE   PROCEDURE [dbo].[PROC_REGISTER_USER]
	@ReturnStructureOnly	BIT = 0,
	@ID						UNIQUEIDENTIFIER NULL,
	@FirstName				NVARCHAR(100),
	@LastName				NVARCHAR(100),
	@EmailAddress			NVARCHAR(500),
	@Password				NVARCHAR(2000),
	@IsAdmin				BIT = 0,
	@IsDomainAccount		BIT = 0,
	@DomainAccountName		NVARCHAR(100) NULL,
	@Domain					NVARCHAR(100) NULL	 
AS
BEGIN
	
	IF @ReturnStructureOnly = 1
		BEGIN
			SELECT NEWID() AS ID, 0 AS Created, 'EXAMPLE RETURN' AS Comments
			RETURN
		END

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @ID IS NULL
		SET @ID = NEWID()

    -- Insert statements for procedure here
	SELECT @ID, 1 AS Created, 'Created User' AS Comments
END
GO
