USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetProblemsByKeywordsAndStatus 6_18]
		@Keywords = N'application',
		@ProductName = NULL,
		@Version = N'1.0',
		@StatusName = N'en cours',
		@StartDate = '2023-02-01',
		@EndDate = '2023-09-30'

SELECT	'Return Value' = @return_value

GO
