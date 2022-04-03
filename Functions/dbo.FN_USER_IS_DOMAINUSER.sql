SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Mark Alicz
-- Create date: 3-2022
-- Description:	Check is User Is a Domain User
-- print dbo.FN_USER_IS_DOMAINUSER('10C4845B-9D06-448C-90FE-5A850D9B47C2')
-- =============================================
CREATE   FUNCTION [dbo].[FN_USER_IS_DOMAINUSER]
(
	@UserID AS UNIQUEIDENTIFIER
)
RETURNS BIT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @tmpReturn AS BIT
    
	IF EXISTS(SELECT ID FROM UserData.Users WHERE UserData.Users.DOMAIN IS NOT NULL AND IsDomainAccount = 1 AND ID = @UserID)
		BEGIN
			SET @tmpReturn = 1
		END
	ELSE
		BEGIN
			SET @tmpReturn = 0
		END
	
	RETURN @tmpReturn

END
GO
