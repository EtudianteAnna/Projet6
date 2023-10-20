USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetResolvedTicketsByKeywords19_20]
		@Keywords = N'application',
		@Version = N'1.0',
		@Status = N'Résolu'

SELECT	'Return Value' = @return_value

GO
