USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetResolvedTicketsByKeywords19_20]
		@Keywords = N'utilisateurs',
		@Version = NULL,
		@Status = N'en cours'

SELECT	'Return Value' = @return_value

GO
