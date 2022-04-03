SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Mark Alicz
-- Copyright:	IVolt, LLC 2021
-- Create date: 2021
-- exec [PROC_UPDATE_USER] 0, '10C4845B-9D06-448C-90FE-5A850D9B47C2', 'Marc','Alicz','markalicz@gmail.com','invkr945',0,1, 'MarkAlicz','GamersGather'
-- =============================================
CREATE     PROCEDURE [dbo].[PROC_UPDATE_USER]
	@ReturnStructureOnly	BIT = 0,
	@ID						UNIQUEIDENTIFIER,
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
			SELECT NEWID() AS ID, 0 AS Updated, 'EXAMPLE RETURN' AS Comments
			RETURN
		END

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @ID IS NULL
		BEGIN
			SELECT NEWID() AS ID, 0 AS Updated, 'User Not Found: ID is Required' AS Comments
			RETURN
		END
	ELSE
		BEGIN
			IF EXISTS(SELECT * FROM UserData.Users WHERE ID = @ID)
				BEGIN
					UPDATE UserData.Users SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, IsAdmin = @IsAdmin,
						IsDomainAccount = @IsDomainAccount, Domain = @Domain, DomainUserAccount = @DomainAccountName WHERE ID = @ID
						
					SELECT @ID, 1 AS Created, 'Updated User' AS Comments
				END
			ELSE
				BEGIN

					SELECT @ID, 0 AS Updated, 'User Not Found' AS Comments
				END
		END
    -- Insert statements for procedure here
	
END
GO
