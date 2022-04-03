SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Mark Alicz
-- Create date: 3-2022
-- Description:	USER EXISTS FUNCTION
-- print dbo.[FN_USER_EXISTS] '10C4845B-9D06-448C-90FE-5A850D9B47C2',null,null,null
-- =============================================
CREATE   FUNCTION [dbo].[FN_USER_EXISTS]
(
	@UserID AS UNIQUEIDENTIFIER NULL,
	@UserEmail AS NVARCHAR(500) NULL,
	@DomainAccount AS NVARCHAR(100) NULL,
	@DomainName AS NVARCHAR(100) null
)
RETURNS UNIQUEIDENTIFIER
AS
BEGIN
	-- Declare the return variable here
	DECLARE @TmpReturn AS UNIQUEIDENTIFIER

	IF (@UserEmail IS NOT NULL)
		BEGIN
        	(SELECT TOP 1 @TmpReturn = ID FROM UserData.Users WHERE EmailAddress = @UserEmail)
			IF @TmpReturn IS NOT NULL
				RETURN @TmpReturn			
		END
	ELSE IF (@UserID IS NOT NULL)
		BEGIN
			(SELECT TOP 1 @tmpReturn = ID FROM UserData.Users WHERE ID = @UserID)
			IF @TmpReturn IS NOT NULL
				RETURN @TmpReturn			
		END
	ELSE IF (@DomainAccount IS NOT NULL AND @DomainName IS NOT NULL)
		BEGIN
			(SELECT TOP 1 @tmpReturn = ID FROM UserData.Users WHERE DomainUserAccount = @DomainAccount AND Domain = @DomainName)
			IF @TmpReturn IS NOT NULL
				RETURN @TmpReturn			
		END
	
	SET @TmpReturn = NULL
	RETURN @TmpReturn
END
GO
