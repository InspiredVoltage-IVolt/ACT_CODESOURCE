SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Mark Alicz
-- Copyright:	IVolt, LLC 2021
-- Create date: 2021
-- Unable To Check Domain User.
-- exec PROC_LOGIN_USER 0, '10C4845B-9D06-448C-90FE-5A850D9B47C2', 'markalicz@gmail.com','ABC'
-- =============================================
CREATE   PROCEDURE [dbo].[PROC_LOGIN_USER]	
	@ReturnStructureOnly	BIT = 0,
	@ID						UNIQUEIDENTIFIER NULL,	
	@EmailAddress			NVARCHAR(500),
	@Password				NVARCHAR(2000)
AS
BEGIN

	SET NOCOUNT ON;
	
	IF @ReturnStructureOnly = 1
		BEGIN
			SELECT NEWID() AS ID, 0 AS LoginSuccessfull, 0 AS IsDomainUser, 0 AS IsAdminUser, 'EXAMPLE RETURN' AS Comments
			RETURN
		END

	DECLARE @tmpID AS UNIQUEIDENTIFIER = NULL

	IF @ID IS NOT NULL
		BEGIN			
			SELECT ID AS ID, CASE COALESCE(ID, @tmpID) WHEN @ID THEN 1 ELSE 0 END AS LoginSuccessfull, 
				dbo.FN_USER_IS_DOMAINUSER(@ID) AS IsDomainUser, dbo.FN_USER_IS_ADMIN(@ID) AS IsAdminUser, 
				'User Found' AS Comments FROM UserData.Users 
				WHERE ID = @ID AND [Password] = @Password AND EmailAddress = @EmailAddress
		END
	ELSE IF @EmailAddress IS NOT NULL
		BEGIN	
			SELECT @tmpID = ID FROM UserData.Users WHERE [Password] = @Password AND EmailAddress = @EmailAddress
			
			IF @TmpID IS NULL
				BEGIN
					SELECT @tmpID AS ID, 0 AS LoginSuccessfull, 0 AS IsDomainUser, 0 AS IsAdminUser, 'User Not Found' AS Comments
				END
			ELSE
				BEGIN
					SELECT ID AS ID, 1 AS LoginSuccessfull, dbo.FN_USER_IS_DOMAINUSER(@TmpID) AS IsDomainUser, dbo.FN_USER_IS_ADMIN(@TmpID) AS IsAdminUser, 'User Found' AS Comments 
						FROM UserData.Users WHERE ID = @TmpID 
				END
		END

END
GO
